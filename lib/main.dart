import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/ui/screens/My_Cart.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const MyCart());
  }
}

// create payment intent(amount , currency , customerId)
//KeySecret create EphemeralKey (stripeVersion , customerId)
// initPaymentSheet (merchantDisplayName , IntentClientSecret , EphemeralKeySecret)
// presentPaymentSheet
