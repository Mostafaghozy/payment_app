import 'package:flutter/material.dart';
import 'package:payment_app/ui/widgets/Button_widget.dart';
import 'package:payment_app/ui/widgets/PaymentMethodsListView.dart';
import 'package:payment_app/ui/widgets/custom_button_bloc_consumer.dart';

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
          SizedBox(height: 32),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
