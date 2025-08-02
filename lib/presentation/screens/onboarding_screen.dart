import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../providers/onboarding_provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  final List<Map<String, String>> _onboardingData = const [
    {
      'title': 'Track Deliveries',
      'subtitle': 'Monitor all your transport activity in real-time.',
      'animation': 'assets/animations/deliveryVan.json',
    },
    {
      'title': 'Easy Transport Start',
      'subtitle': 'Start new orders with just a few taps.',
      'animation': 'assets/animations/delivery_start.json',
    },
    {
      'title': 'Seamless Updates',
      'subtitle': 'Update delivery status anytime, anywhere.',
      'animation': 'assets/animations/box_open.json',
    },
  ];

  void _goToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [Color(0xFF2196F3), Color(0xFF9C27B0)],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: onboardingProvider.updatePage,
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  final data = _onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          data['animation']!,
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          data['title']!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9C27B0),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data['subtitle']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF9C27B0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_onboardingData.length, (index) {
                return AnimatedContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: onboardingProvider.currentPage == index ? 12 : 8,
                  height: onboardingProvider.currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color:
                        onboardingProvider.currentPage == index
                            ? const Color.fromARGB(255, 175, 172, 172)
                            : const Color.fromARGB(137, 184, 182, 182),
                    shape: BoxShape.circle,
                  ),
                  duration: const Duration(milliseconds: 300),
                );
              }),
            ),
            const SizedBox(height: 20),
            if (onboardingProvider.currentPage == _onboardingData.length - 1)
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextButton(
                  onPressed: () => _goToLogin(context),
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Color(0xFF9C27B0), // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Color(0xFF9C27B0),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
