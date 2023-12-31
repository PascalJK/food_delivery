import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> addAddress(AddressModel model) async {
    return await apiClient.postData(AppConstants.ADD_USER_ADDRESS_URI, model.toJson());
  }

  Future<Response> getAddressfromGeocode(LatLng latLng) async {
    return await apiClient
        .getData('${AppConstants.GEOCODE_URI}?lat=${latLng.latitude}&lng=${latLng.longitude}');
  }

  Future<Response> getAllAddresses() async {
    return await apiClient.getData(AppConstants.ADDRESS_LIST_URI);
  }

  String getUserAddress() => sharedPreferences.getString(AppConstants.USER_ADDRESS) ?? '';

  Future<bool> saveUserAddress(AddressModel model) async {
    apiClient.updateHeader(sharedPreferences.getString(AppConstants.TOKEN)!);
    return await sharedPreferences.setString(AppConstants.USER_ADDRESS, model.toJson());
  }
}
