class AddAddressModel {
  final String name;
  final int phoneNumber;
  final String streetName;
  final int postalCode;
  final String cityName;
  final String countryName;

  AddAddressModel(
      {required this.name,
      required this.phoneNumber,
      required this.streetName,
      required this.postalCode,
      required this.cityName,
      required this.countryName});
}
