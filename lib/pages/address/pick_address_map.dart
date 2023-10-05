import 'package:flutter/material.dart';
import 'package:food_delivery/components/custom_button.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatelessWidget {
  final GoogleMapController googleMapController;
  final bool fromAddress;
  PickAddressMap({super.key, required this.googleMapController, required this.fromAddress});
  var _camPos = const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  late LatLng _initPos = const LatLng(45.51563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(initState: (state) {
      var lc = Get.find<LocationController>();
      // Is checking if user is logged in really needed??
      // if user model is null first get user info...
      // if (uc.getAccountModel.isUndefinedOrNull) {}

      if (lc.addressList.isNotEmpty) {
        _camPos = CameraPosition(
            target: LatLng(
          double.parse(lc.getAdress['latitude']),
          double.parse(lc.getAdress['longitude']),
        ));
        _initPos = _camPos.target;
      }
    }, builder: (c) {
      return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(target: _initPos, zoom: 17),
              compassEnabled: false,
              mapToolbarEnabled: false,
              indoorViewEnabled: true,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              onCameraIdle: () => c.updateCameraPosition(_camPos, false),
              onCameraMove: (position) => _camPos = position,
              onMapCreated: (mapController) {
                c.setMapController(mapController);
              },
            ),
            Center(
              child: !c.isloading
                  ? Image.asset('assets/image/pick_marker.png', height: 50, width: 50)
                  : const CircularProgressIndicator(),
            ),
            Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: Dimensions.iconSize24,
                      color: AppColors.yellowColor,
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        c.pickPlaceMark.name ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.font17,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 50,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: pickLocationBtn(c))
          ],
        ),
      );
    });
  }

  Widget pickLocationBtn(LocationController c) {
    return c.isServiceLoading
        ? CustomButton(
            text: 'Pick Address',
            onPressed: c.isloading
                ? null
                : () {
                    if (c.pickPosition.latitude != 0 && c.pickPlaceMark.name != null) {
                      googleMapController.moveCamera(CameraUpdate.newCameraPosition(_camPos));
                    }
                    c.setAddAddressData();
                    Get.back();
                  },
          )
        : const CircularProgressIndicator();
  }
}
