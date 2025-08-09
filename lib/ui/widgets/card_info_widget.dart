import 'package:flutter/material.dart';
import 'package:payment_app/ui/core/utils/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/mastercard.png"),
          SizedBox(width: 23),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Credit Card ", style: Styles.styleBold18),
                TextSpan(text: "Mastercard **78", style: Styles.style16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
