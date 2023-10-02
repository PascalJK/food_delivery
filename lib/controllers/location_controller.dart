import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/account_controller.dart';
import 'package:food_delivery/data/repo/location_repo.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  // final _accController = Get.find<AccountController>();

  final addressController = TextEditingController();
  final cPersonName = TextEditingController();
  final cPersonNumber = TextEditingController();

  bool _isLoading = false;
  late Position _position;
  late Position _pickPosition;

  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;

  late List<AddressModel> _allAddressList = [];
  List<AddressModel> get allAddressList => _allAddressList;

  final List<String> addressTypeList = ['home', 'office', 'other'];
  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;

  late Map<String, dynamic> _getAdress;
  Map get getAdress => _getAdress;

  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;

  bool _updateAddressData = true;
  bool _changeAddress = true;

  get isloading => _isLoading;
  Position get position => _position;
  get pickPosition => _pickPosition;
  get placeMark => _placemark;
  Placemark get pickPlaceMark => _pickPlacemark;

  void setMapController(GoogleMapController mapController) => _mapController = mapController;

  loadAccountData() {
    var uc = Get.find<AccountController>();
    cPersonName.text = uc.getAccountModel.name;
    cPersonNumber.text = uc.getAccountModel.contact;
    // addressController.text = getUserAddress().address;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModel> addAddress() async {
    var model = AddressModel(
      type: addressTypeList[addressTypeIndex],
      address: addressController.text,
      latitude: position.latitude.toString(),
      longitude: position.longitude.toString(),
      contactPersonName: cPersonName.text,
      contactPersonNumber: cPersonNumber.text,
    );

    _isLoading = true;
    update();
    var response = await locationRepo.addAddress(model);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      await getAddressList();
      responseModel = ResponseModel(true, response.body['message']);
      await saveUserAddress(model);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      print('error: could not save the address');
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  AddressModel getUserAddress() {
    late AddressModel addressModel;
    _getAdress = jsonDecode(locationRepo.getUserAddress());
    try {
      addressModel = AddressModel.fromMap(_getAdress);
    } catch (e) {
      print(e);
    }
    return addressModel;
  }

  Future<void> updateCameraPosition(CameraPosition camPos, bool fromAdress) async {
    if (_updateAddressData) {
      _isLoading = true;
      update();
      try {
        if (fromAdress) {
          _position = Position(
              longitude: camPos.target.longitude,
              latitude: camPos.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              altitudeAccuracy: 1,
              heading: 1,
              headingAccuracy: 1,
              speed: 1,
              speedAccuracy: 1);
        } else {
          _position = Position(
              longitude: camPos.target.longitude,
              latitude: camPos.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              altitudeAccuracy: 1,
              heading: 1,
              headingAccuracy: 1,
              speed: 1,
              speedAccuracy: 1);
        }

        if (_changeAddress) {
          var address = await getAdressFromGeoCode(camPos.target);
          fromAdress
              ? _placemark = Placemark(name: address)
              : _pickPlacemark = Placemark(name: address);
          addressController.text = address;
        }
      } catch (e) {
        // print(e.toString());
      }
      _isLoading = false;
      update();
    }
  }

  Future<String> getAdressFromGeoCode(LatLng latLng) async {
    var res = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    // var res = await locationRepo.getAddressfromGeocode(latLng);
    // if (res.body['status'] == 'OK') {
    //   return res.body['results'][0]['formatted_address'].toString();
    // } else {
    //   print('error return getting G-Api');
    // }
    var loc = res.firstOrNull;
    return loc == null ? 'null' : '${loc.street}, ${loc.locality}, ${loc.isoCountryCode}';
  }

  Future getAddressList() async {
    var response = await locationRepo.getAllAddresses();
    _addressList = [];
    _allAddressList = [];
    if (response.statusCode == 200) {
      for (var adress in response.body) {
        _addressList.add(AddressModel.fromMap(adress));
        _allAddressList.add(AddressModel.fromMap(adress));
      }
      // response.body.forEach((adress) {
      //   _addressList.add(AddressModel.fromJson(adress));
      //   _allAddressList.add(AddressModel.fromJson(adress));
      // });
    }
    update();
  }

  Future saveUserAddress(AddressModel model) async => locationRepo.saveUserAddress(model);

// Needed??
  void getUserAddressFromLocalStorage() {
    if (locationRepo.getUserAddress().isEmpty) saveUserAddress(addressList.last);
  }

  void clearAddressList() {
    _addressList.clear();
    _allAddressList.clear();
    update(); //TODO Needed?
  }
}
