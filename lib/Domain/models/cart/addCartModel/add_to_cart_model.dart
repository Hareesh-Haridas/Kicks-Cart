class AddToCartModel {
  final String id;
  final String message;
  AddToCartModel({required this.id, required this.message});
  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
        id: json['_id'] != null ? json['_id'].toString() : "",
        message: json['message'] ?? '');
  }
}
