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
}
