import 'package:flutter/material.dart';
import 'package:payment_app/ui/screens/Thank_you.dart';
import 'package:payment_app/ui/widgets/Button_widget.dart';
import 'package:payment_app/ui/widgets/Custom_Credit_Card.dart';
import 'package:payment_app/ui/widgets/PaymentMethodsListView.dart';
import 'package:payment_app/ui/widgets/appBar_Widget.dart';
import 'package:payment_app/ui/widgets/container_widget.dart';

class PaymentDetails extends StatefulWidget {
  PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Payment Details"),
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(child: PaymentMethodsListView()),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              formKey: formKey,
              autovalidateMode: autovalidateMode,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
                child: ButtonWidget(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ThankYou();
                          },
                        ),
                      );

                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  title: 'Pay',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
