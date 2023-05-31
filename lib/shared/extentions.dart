import 'package:flutter/material.dart';

extension ScaffoldMessengerContext on BuildContext {
  void showError(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
