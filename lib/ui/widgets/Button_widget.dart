import 'package:flutter/material.dart';
import 'package:payment_app/ui/core/utils/styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 330,
        decoration: BoxDecoration(
          color: Color(0xFF34A853),
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,

        child: Text(title, style: Styles.style22, textAlign: TextAlign.center),
      ),
    );
  }
}
