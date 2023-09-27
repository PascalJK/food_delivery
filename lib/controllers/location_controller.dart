import 'package:food_delivery/data/repo/location_repo.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  bool isLoading = false;
  late Position _position;
  late Position _pickPosition;

  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();

  List<AddressModel> _addressList = [];
  List<AddressModel> get getAddressList => _addressList;
  late List<AddressModel> _allAddressList = [];

  List<String> _addressTypeList = ['home', 'office', 'other'];
  int _addressTypeIndex = 0;

  late Map<String, dynamic> _getAdress;
  Map get getAdress => _getAdress;
}
