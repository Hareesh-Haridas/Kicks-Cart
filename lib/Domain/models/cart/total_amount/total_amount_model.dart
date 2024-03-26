class TotalAmountModel {
  final int totalAmount;

  TotalAmountModel({required this.totalAmount});
  factory TotalAmountModel.fromJson(Map<String, dynamic> json) {
    TotalAmountModel totalAmountModel =
        TotalAmountModel(totalAmount: json['totalPrice'] ?? 0);
    print('GET TOTAL $totalAmountModel');
    return TotalAmountModel(totalAmount: json['totalPrice'] ?? 0);
  }
}
