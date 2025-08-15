import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/data/models/cubits_stripe/payment_state.dart';
import 'package:payment_app/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_app/data/repos/checkout_repo.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());
    var date = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    date.fold(
      (l) => emit(PaymentFailure(l.errMessage)),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
