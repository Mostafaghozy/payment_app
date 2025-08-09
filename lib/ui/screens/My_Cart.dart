import 'package:flutter/material.dart';
import 'package:payment_app/ui/core/utils/styles.dart';
import 'package:payment_app/ui/screens/Payment_Details.dart';
import 'package:payment_app/ui/widgets/Button_widget.dart';
import 'package:payment_app/ui/widgets/Order_Info_Item.dart';
import 'package:payment_app/ui/widgets/PaymentMethodsListView.dart';
import 'package:payment_app/ui/widgets/Total_Price.dart';
import 'package:payment_app/ui/widgets/appBar_Widget.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "My Cart"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 25),
            Expanded(
              child: Image.asset(
                "assets/images/Group 6.png",
                height: 424,
                width: 277,
              ),
            ),
            SizedBox(height: 20),
            OrderInfoItem(title: 'Order Subtotal', value: '\$42.97'),
            SizedBox(height: 3),
            OrderInfoItem(title: 'Discount', value: r'$0'),
            SizedBox(height: 3),
            OrderInfoItem(title: 'Shipping', value: '\$8'),
            Divider(height: 50, thickness: 2),

            SizedBox(height: 10),
            TotalPrice(title: 'Total', value: '\$50.97'),
            SizedBox(height: 16),
            ButtonWidget(
              title: 'Complete Payment',
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return PaymentDetails();
                //     },
                //   ),
                // );
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20),
                  ),
                  builder: (context) {
                    return PaymentMethodBottomSheet();
                  },
                );
              },
            ),

            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          PaymentMethodsListView(),
          SizedBox(height: 30),
          ButtonWidget(title: "Continue"),
        ],
      ),
    );
  }
}
