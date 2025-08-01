import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jayem_agencies/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:jayem_agencies/core/themes/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: Scaffold(
        backgroundColor: AppColors.whiteText,
        body: Consumer<LoginProvider>(
          builder: (context, provider, child) {
            return Form(
              key: provider.formKey,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white
                  // gradient: LinearGradient(
                  //   colors: [Color(0xFF9C27B0), Color(0xFF2196F3)],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  // ),
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: size.height - MediaQuery.of(context).padding.top,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
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
                                const SizedBox(height: 25),
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
                                  decoration: _buildInputDecoration("Username"),
                                  style: const TextStyle(color: Colors.white),
                                  validator: (value) =>
                                      value!.isEmpty ? 'Enter username' : null,
                                  onSaved: (value) => provider.email = value!,
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  obscureText: true,
                                  decoration: _buildInputDecoration("Password"),
                                  style: const TextStyle(color: Colors.white),
                                  validator: (value) =>
                                      value!.isEmpty ? 'Enter password' : null,
                                  onSaved: (value) => provider.password = value!,
                                ),
                                const SizedBox(height: 5),

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      // Handle forgot password
                                    },
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                provider.isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : ElevatedButton(
                                        onPressed: () =>
                                            provider.submitLogin(context),
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
                                          "SIGN IN",
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
                                    text: "Don't have an account? ",
                                    style:
                                        const TextStyle(color: Colors.white70),
                                    children: [
                                      TextSpan(
                                        text: "Sign Up",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context, '/signup');
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
