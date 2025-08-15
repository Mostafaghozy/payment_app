import 'package:flutter/material.dart';
import 'package:payment_app/ui/widgets/container_widget.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key, required this.updatePaymentMethod});
  final Function({required int index}) updatePaymentMethod;

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> PaymentMethodsItems = const [
    'assets/images/card.png',
    'assets/images/PayPal.png',
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: PaymentMethodsItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
                widget.updatePaymentMethod(index: activeIndex);
              },
              child: ContainerWidget(
                image: PaymentMethodsItems[index],
                isActive: activeIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
