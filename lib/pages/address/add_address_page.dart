import 'package:flutter/material.dart';
import 'package:food_delivery/components/custom_snackbar.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/components/text/text_input_field.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final controller = Get.find<LocationController>();
  var _camPos = const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  LatLng _initPos = const LatLng(45.51563, -122.677433);

  @override
  void initState() {
    super.initState();
    // var uc = Get.find<AccountController>();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Page'),
      ),
      body: GetBuilder<LocationController>(
          init: controller.loadAccountData(),
          builder: (c) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // map view
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: AppColors.mainColor,
                      ),
                    ),
                    child: Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition: CameraPosition(target: _initPos, zoom: 17),
                          compassEnabled: false,
                          mapToolbarEnabled: false,
                          indoorViewEnabled: true,
                          zoomControlsEnabled: false,
                          onCameraIdle: () => c.updateCameraPosition(_camPos, true),
                          onCameraMove: (position) => _camPos = position,
                          onMapCreated: (mapController) {
                            c.setMapController(mapController);
                          },
                        )
                      ],
                    ),
                  ),
                  // Text Views
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height20),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: c.addressTypeList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => controller.setAddressTypeIndex(index),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width20,
                                vertical: Dimensions.height10,
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius5),
                                color: context.theme.cardColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[200]!,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Icon(
                                index == 0
                                    ? Icons.home_filled
                                    : index == 1
                                        ? Icons.work
                                        : Icons.location_on,
                                color: c.addressTypeIndex == index
                                    ? AppColors.mainColor
                                    : context.theme.disabledColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width20, bottom: Dimensions.height10),
                    child: const BigText(text: 'Delivery Address'),
                  ),
                  TextInputField(
                    controller: c.addressController,
                    icon: Icons.map_outlined,
                    hint: 'Your Address',
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height10),
                    child: const BigText(text: 'Your Name'),
                  ),
                  SizedBox(height: Dimensions.height15),
                  TextInputField(
                    controller: c.cPersonName,
                    icon: Icons.person,
                    hint: 'Your Name',
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height10),
                    child: const BigText(text: 'Your Number'),
                  ),
                  SizedBox(height: Dimensions.height15),
                  TextInputField(
                    controller: c.cPersonNumber,
                    icon: Icons.phone,
                    hint: 'Your Contact',
                  ),
                ],
              ),
            );
          }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(Dimensions.width30, 0, Dimensions.width30, 5),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.height20,
            vertical: Dimensions.height20,
          ),
          onPressed: () => controller.addAddress().then((response) {
            if (response.getSuccess) {
              Get.back();
              showCustomSnackBar(title: 'Success', 'Address info saved');
            } else {
              showCustomSnackBar('Could not save address');
            }
          }),
          color: AppColors.mainColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15))),
          child: BigText(
            text: 'Save address',
            size: Dimensions.font26,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
