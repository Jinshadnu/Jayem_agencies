import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jayem_agencies/presentation/screens/dasboard_screen.dart';
import 'package:jayem_agencies/presentation/screens/login_screen.dart';
import 'package:jayem_agencies/presentation/screens/onboarding_screen.dart';
import 'package:jayem_agencies/presentation/screens/signup_screen.dart';
import 'package:jayem_agencies/presentation/screens/splash_screen.dart';
import 'package:jayem_agencies/presentation/screens/start_transport_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboard':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());  
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
         case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
        case '/myTransport':
        return MaterialPageRoute(builder: (_) => const StartTransportScreen());
        
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(body: Center(child: Text('Route Not Found')))); 
    }
  }
}