import 'package:flutter/material.dart';

final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

extension TextEditingControllerEnhanced on TextEditingController {
  bool isValid([String? Function(String)? validator]) {
    if (validator == null) {
      return text.isNotEmpty;
    }

    return validator(text) == null;
  }

  bool isValidEmail() {
    return _emailRegex.hasMatch(text);
  }
}
