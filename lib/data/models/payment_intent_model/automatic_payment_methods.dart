class AutomaticPaymentMethods {
  bool? enabled;

  AutomaticPaymentMethods({this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(enabled: json['enabled'] as bool?);
  }

  Map<String, dynamic> toJson() => {'enabled': enabled};

  AutomaticPaymentMethods copyWith({bool? enabled}) {
    return AutomaticPaymentMethods(enabled: enabled ?? this.enabled);
  }
}
