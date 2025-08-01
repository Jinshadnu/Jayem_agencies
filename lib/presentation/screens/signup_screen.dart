import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jayem_agencies/presentation/providers/signup_provider.dart';
import 'package:provider/provider.dart';
import 'package:jayem_agencies/core/themes/app_theme.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupProvider(),
      child: Scaffold(
        backgroundColor: AppColors.whiteText,
        body: Consumer<SignupProvider>(
          builder: (context, provider, child) {
            return Form(
              key: provider.formKey,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.background,
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 30,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2196F3), Color(0xFF9C27B0)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Jayem\nAgencies",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFEEDCFF),
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                decoration:
                                    _buildInputDecoration("Full Name"),
                                style: const TextStyle(color: Colors.white),
                                validator: (value) => value!.isEmpty
                                    ? 'Enter your full name'
                                    : null,
                                onSaved: (value) =>
                                    provider.fullName = value!,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration:
                                    _buildInputDecoration("Mobile Number"),
                                style: const TextStyle(color: Colors.white),
                                validator: (value) => value!.isEmpty
                                    ? 'Enter your mobile number'
                                    : null,
                                onSaved: (value) =>
                                    provider.email = value!,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                obscureText: true,
                                decoration:
                                    _buildInputDecoration("Password"),
                                style: const TextStyle(color: Colors.white),
                                validator: (value) => value!.isEmpty
                                    ? 'Enter a password'
                                    : null,
                                onSaved: (value) =>
                                    provider.password = value!,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                obscureText: true,
                                decoration: _buildInputDecoration(
                                    "Confirm Password"),
                                style: const TextStyle(color: Colors.white),
                                validator: (value) => value!.isEmpty
                                    ? 'Confirm your password'
                                    : null,
                                onSaved: (value) =>
                                    provider.confirmPassword = value!,
                              ),
                              const SizedBox(height: 30),
                              provider.isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : ElevatedButton(
                                      onPressed: () =>
                                          provider.submitSignup(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 40,
                                          vertical: 14,
                                        ),
                                      ),
                                      child: const Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                          color: Color(0xFF9C27B0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                              const SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  text: "Already have an account? ",
                                  style:
                                      const TextStyle(color: Colors.white70),
                                  children: [
                                    TextSpan(
                                      text: "Sign In",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pop(context);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.white24,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
    );
  }
}
