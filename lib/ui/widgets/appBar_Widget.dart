import 'package:flutter/material.dart';
import 'package:payment_app/ui/core/utils/styles.dart';

AppBar appBar({final String? title}) {
  return AppBar(
    leading: Icon(Icons.arrow_back),
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      title ?? "",
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
    centerTitle: true,
  );
}
