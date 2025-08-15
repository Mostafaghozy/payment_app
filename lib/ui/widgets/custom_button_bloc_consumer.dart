import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app/core/functions/get_transactions.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/data/models/amount_model/amount_model.dart';
import 'package:payment_app/data/models/amount_model/details.dart';
import 'package:payment_app/data/models/cubits_stripe/payment_cubit.dart';
import 'package:payment_app/data/models/cubits_stripe/payment_state.dart';
import 'package:payment_app/data/models/item_list_model/item.dart';
import 'package:payment_app/data/models/item_list_model/item_list_model.dart';
import 'package:payment_app/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_app/ui/screens/My_Cart.dart';
import 'package:payment_app/ui/screens/Thank_you.dart';
import 'package:payment_app/ui/widgets/Button_widget.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.isPaypal});
  final bool isPaypal;

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
            if (isPaypal) {
              var transactionsData = getTransactionData();
              executePaypalPayment(context, transactionsData);
            } else {
              executeStripePayment(context);
            }
          },
          isLoading: state is PaymentLoading ? true : false,
          title: "Continue",
        );
      },
    );
  }

  void executeStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: "100",
      currency: "USD",
      customerId: 'cus_SrNbuc9QbdLH7O',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void executePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionsData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true, //when live mode translate to false
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description": "The payment transaction description.",

              "item_list": transactionsData.itemList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ThankYou();
                },
              ),
              (route) {
                //if return into screen
                if (route.settings.name == "/") {
                  return true;
                } else {
                  return false;
                }
              },
            );
          },
          onError: (error) {
            SnackBar snackBar = SnackBar(content: Text(error.toString()));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MyCart();
                },
              ),
              (route) {
                //if return into screen
                if (route.settings.name == "/") {
                  return true;
                } else {
                  return false;
                }
              },
            );
          },
          onCancel: () {
            log('cancelled:');
          },
        ),
      ),
    );
  }
}
