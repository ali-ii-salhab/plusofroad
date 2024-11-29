import 'package:flutter/material.dart';

List<BoxShadow>? boxShadow() {
  return [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 2,
      offset: Offset(0, 1),
      spreadRadius: 2,
      blurStyle: BlurStyle.outer,
    )
  ];
}
