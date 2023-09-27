import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/account_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _addressController = TextEditingController();
  final _cPersonName = TextEditingController();
  final _cPersonNumber = TextEditingController();

  var _camPos = const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  late LatLng _initPos;

  @override
  void initState() {
    super.initState();
    // var uc = Get.find<AccountController>();
    var lc = Get.find<LocationController>();
    // Is checking if user is logged in really needed??
    // if user model is null first get user info...
    // if (uc.getAccountModel.isUndefinedOrNull) {}

    if (lc.getAddressList.isNotEmpty) {
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
      body: Column(
        children: [
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(target: _initPos, zoom: 17),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
