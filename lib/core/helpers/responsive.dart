import 'package:flutter/material.dart';

class Responsive {
  static double _valueCalc(BuildContext context, double size) {
    return size * MediaQuery.of(context).size.width / 375;
  }

  static double text(BuildContext context, double size) {
    return _valueCalc(context, size);
  }

  static double icon(BuildContext context, double size) {
    return _valueCalc(context, size);
  }

  static double padding(BuildContext context, double size) {
    return _valueCalc(context, size);
  }

  static double value(BuildContext context, double size) {
    return _valueCalc(context, size);
  }
}