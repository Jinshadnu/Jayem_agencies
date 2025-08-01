import 'package:flutter/material.dart';
import 'package:jayem_agencies/core/themes/app_theme.dart';
import 'package:jayem_agencies/presentation/providers/dashboard_provider.dart';
import 'package:jayem_agencies/presentation/providers/login_provider.dart';
import 'package:jayem_agencies/presentation/providers/onboarding_provider.dart';
import 'package:jayem_agencies/presentation/providers/signup_provider.dart';
import 'package:jayem_agencies/presentation/providers/start_transport_provider.dart';
import 'package:jayem_agencies/presentation/screens/splash_screen.dart';
import 'package:jayem_agencies/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_) => OnboardingProvider()),
         ChangeNotifierProvider(create: (_) => SignupProvider()),
         ChangeNotifierProvider(create: (_) => LoginProvider()),
         ChangeNotifierProvider(create: (_) => DashboardProvider()),
         ChangeNotifierProvider(create: (_) => StartTransportProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Warehouse Driver App',
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: '/splash',
      ),
    );
  }
}


