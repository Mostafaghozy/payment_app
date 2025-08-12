import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/ui/widgets/Total_Price.dart';
import 'package:payment_app/ui/widgets/card_info_widget.dart';
import 'package:payment_app/ui/widgets/payment_item_info.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Color(0xffEDEDED),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            Text(
              "Thank you!",
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              "Your transaction was successful",
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            SizedBox(height: 42),
            PaymentItemInfo(title: 'Date', value: '01/24/2023'),
            SizedBox(height: 20),
            PaymentItemInfo(title: 'Time', value: '10:15 AM'),
            SizedBox(height: 20),
            PaymentItemInfo(title: "To", value: "Sam Louis"),
            Divider(thickness: 2, height: 60),
            TotalPrice(title: "Total", value: r"$50.97"),
            SizedBox(height: 30),
            CardInfoWidget(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(FontAwesomeIcons.barcode, size: 66),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.50, color: Color(0xff34A853)),
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "PAID",
                      style: Styles.style24.copyWith(color: Color(0xff34A853)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * 0.2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
