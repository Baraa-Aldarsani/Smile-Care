import 'package:flutter/material.dart';

class L10n {
  L10n._();

  static final all = [
    const Locale('en'),
    const Locale('ar'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return 'Arabic';
      case 'en':
        return 'English';
      default:
        return 'English';
    }
  }
}
