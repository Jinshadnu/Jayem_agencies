import 'package:flutter/material.dart';
import 'package:jayem_agencies/core/themes/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
  super.initState();
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.of(context).pushReplacementNamed('/onboard');
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/jayem_agencies_logo.png',
              width: 350,
              height: 350,
            ),
          ],
        ),
      ),
    );
  }
}
