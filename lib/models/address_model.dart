import 'dart:convert';

class AddressModel {
  final int? id;
  final String type;
  final String? contactPersonName;
  final String? contactPersonNumber;
  final String address;
  final String latitude;
  final String longitude;

  AddressModel({
    this.id,
    required this.type,
    this.contactPersonName,
    this.contactPersonNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'address': address,
      'contact_person_name': contactPersonName,
      'contact_person_number': contactPersonNumber,
      'address_type': type,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'],
      address: map['address'] ?? '',
      contactPersonName: map['contact_person_name'] ?? '',
      contactPersonNumber: map['contact_person_number'] ?? '',
      type: map['address_type'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
