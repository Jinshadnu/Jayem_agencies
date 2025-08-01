import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String fullName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  bool isLoading = false;

  void submitSignup(BuildContext context) {
  if (!formKey.currentState!.validate()) return;
  formKey.currentState!.save();

  if (password != confirmPassword) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Signup Successful")),
    );
    });
    return;
  }

  isLoading = true;
  notifyListeners();

  // Simulate API call
  Future.delayed(const Duration(seconds: 2), () {
    isLoading = false;
    notifyListeners();

    // Redirect to dashboard screen
    Navigator.pushReplacementNamed(context, '/dashboard');
  });
}
}