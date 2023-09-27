import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/account_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAdressPage extends StatefulWidget {
  const AddAdressPage({super.key});

  @override
  State<AddAdressPage> createState() => _AddAdressPageState();
}

class _AddAdressPageState extends State<AddAdressPage> {
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
