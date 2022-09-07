import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

LinearGradient gradient(Color color1, Color color2) {
  return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topLeft,
      stops: const [0.05, 0.75],
      colors: [color1, color2]);
}
