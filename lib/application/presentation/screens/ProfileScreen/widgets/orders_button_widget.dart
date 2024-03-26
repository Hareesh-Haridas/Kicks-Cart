import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/my_orders_screen/my_orders_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class OrdersButton extends StatelessWidget {
  const OrdersButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyOrdersScreen())),
      title: Text('Your Orders'),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: kGrey),
          borderRadius: BorderRadius.circular(10)),
      trailing: Icon(Icons.chevron_right_outlined),
    );
  }
}
