import 'package:flutter/material.dart';
import 'package:payment_app/ui/core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.value});
  final String title, value; // ignore: use_key_in_widget_constructors

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Styles.style18, textAlign: TextAlign.center),
        Spacer(),

        Text(value, style: Styles.style18, textAlign: TextAlign.center),
      ],
    );
  }
}
