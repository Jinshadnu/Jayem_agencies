import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool isLoading = false;

  void submitLogin(BuildContext context) {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    isLoading = true;
    notifyListeners();

    // Simulate login delay
    Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
      notifyListeners();

      // Navigate to home screen or dashboard
      Navigator.pushReplacementNamed(context, '/dashboard');
    });
  }
}
