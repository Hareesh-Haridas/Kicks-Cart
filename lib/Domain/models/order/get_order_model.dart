class GetOrderModel {
  final List<String> images;
  final String name;
  final int price;
  final String id;
  final String description;
  final String brand;
  final String status;
  final String size;
  final int quantity;
  final String addressName;
  final int phoneNumber;
  final String cityName;
  final String deliveryDate;
  GetOrderModel(
      {required this.images,
      required this.name,
      required this.price,
      required this.id,
      required this.description,
      required this.brand,
      required this.status,
      required this.size,
      required this.quantity,
      required this.addressName,
      required this.cityName,
      required this.phoneNumber,
      required this.deliveryDate});
  factory GetOrderModel.fromJson(
      Map<String, dynamic> json,
      String orderId,
      String orderStatus,
      String addressName,
      int phoneNumber,
      String cityName) {
    return GetOrderModel(
        images: json['image'] != null ? List<String>.from(json['image']) : [],
        name: json['name'] ?? '',
        price: json['price'] ?? 0,
        id: orderId,
        description: json['description'] ?? '',
        brand: json['category'] ?? '',
        status: orderStatus,
        size: json['size'] ?? '',
        quantity: json['quantity'] ?? 0,
        addressName: addressName,
        phoneNumber: phoneNumber,
        cityName: cityName,
        deliveryDate: json['deliveryDate'] ?? '');
  }
}
