import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/data/models/cubits/payment_cubit.dart';
import 'package:payment_app/data/models/cubits/payment_state.dart';
import 'package:payment_app/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_app/ui/screens/Thank_you.dart';
import 'package:payment_app/ui/widgets/Button_widget.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return ThankYou();
              },
            ),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return ButtonWidget(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(amount: "100", currency: "USD");
            BlocProvider.of<PaymentCubit>(
              context,
            ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is PaymentLoading ? true : false,
          title: "Continue",
        );
      },
    );
  }
}
