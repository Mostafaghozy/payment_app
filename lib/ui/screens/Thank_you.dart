import 'package:flutter/material.dart';
import 'package:payment_app/ui/widgets/Container_thank_you_details.dart';
import 'package:payment_app/ui/widgets/appBar_Widget.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Transform.translate(
        offset: Offset(0, -16),
        child: ContainerThankYouDetails(),
      ),
    );
  }
}
