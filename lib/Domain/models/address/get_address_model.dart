class GetAddressModel {
  final String name;
  final int phoneNumber;
  final String streetName;
  final int pinCode;
  final String cityName;
  final String countryName;
  final String id;
  GetAddressModel(
      {required this.name,
      required this.id,
      required this.phoneNumber,
      required this.streetName,
      required this.pinCode,
      required this.cityName,
      required this.countryName});
  factory GetAddressModel.fromJson(Map<String, dynamic> json) {
    return GetAddressModel(
        name: json['name'] ?? '',
        phoneNumber: json['phoneNumber'] ?? 0,
        streetName: json['streetName'] ?? '',
        pinCode: json['pinCode'] ?? 0,
        cityName: json['cityName'] ?? '',
        countryName: json['countryName'] ?? '',
        id: json['_id'] != null ? json['_id'].toString() : "");
  }
}
