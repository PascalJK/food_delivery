import 'package:food_delivery/data/repo/location_repo.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  bool _isLoading = false;
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

  late GoogleMapController _mapController;
  bool _updateAddressData = true;
  bool _changeAddress = true;

  get isloading => _isLoading;
  get position => _position;
  get pickPosition => _pickPosition;
  get placeMark => _placemark;
  get pickPlaceMark => _pickPlacemark;

  void setMapController(GoogleMapController mapController) => _mapController = mapController;

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

          if (_changeAddress) {
            var address = await getAdressFromGeoCode(camPos.target);
          }
        }
      } catch (e) {}
    }
  }

  Future<String> getAdressFromGeoCode(LatLng latLng) async {
    var res = await locationRepo.getAddressfromGeocode(latLng);
    if (res.body['status'] == 'OK') {
      return res.body['results'][0]['formatted_address'].toString();
    } else {
      print('error return getting G-Api');
    }
    return '';
  }
}
