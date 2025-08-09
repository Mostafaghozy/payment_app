import 'package:flutter/material.dart';
import 'package:payment_app/ui/screens/My_Cart.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const MyCart());
  }
}
