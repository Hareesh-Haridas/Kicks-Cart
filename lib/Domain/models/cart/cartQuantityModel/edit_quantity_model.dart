class CartEditQuantityModel {
  final int newQuantity;
  final int newSubtotal;

  CartEditQuantityModel({required this.newQuantity, required this.newSubtotal});
  factory CartEditQuantityModel.fromJson(Map<String, dynamic> json) {
    return CartEditQuantityModel(
        newQuantity: json['newQuantity'] ?? 0,
        newSubtotal: json['newSubtotal'] ?? 0);
  }
}
