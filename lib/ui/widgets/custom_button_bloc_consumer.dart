import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
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
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //       amount: "100",
            //       currency: "USD",
            //       customerId: 'cus_SrNbuc9QbdLH7O',
            //     );
            // BlocProvider.of<PaymentCubit>(
            //   context,
            // ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckoutView(
                  sandboxMode: true, //when live mode translate to false
                  clientId: "",
                  secretKey: "",
                  transactions: const [
                    {
                      "amount": {
                        "total": "70",
                        "currency": "USD",
                        "details": {
                          "subtotal": "70",
                          "shipping": "0",
                          "shipping_discount": 0,
                        },
                      },
                      "description": "The payment transaction description.",

                      "item_list": {
                        "items": [
                          {
                            "name": "Apple",
                            "quantity": 4,
                            "price": '5',
                            "currency": "USD",
                          },
                          {
                            "name": "Pineapple",
                            "quantity": 5,
                            "price": '10',
                            "currency": "USD",
                          },
                        ],
                      },
                    },
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    print("onSuccess: $params");
                  },
                  onError: (error) {
                    print("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                  },
                ),
              ),
            );
          },
          isLoading: state is PaymentLoading ? true : false,
          title: "Continue",
        );
      },
    );
  }
}
