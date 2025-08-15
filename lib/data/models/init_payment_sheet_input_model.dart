class InitPaymentSheetInputModel {
  final String clientSecret;
  final String ephemeralKeySecret;
  final String customerId;
  InitPaymentSheetInputModel({
    required this.customerId,
    required this.clientSecret,
    required this.ephemeralKeySecret,
  });
}
