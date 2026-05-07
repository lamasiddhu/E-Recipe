import 'dart:async';
import 'package:e_recipe/views/onboarding_view.dart' show OnboardingView;
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color brandColor = Color(0xFFB84715);
    const Color bgColor = Color(0xFFF7F2E9);

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.restaurant,
                size: 40,
                color: brandColor,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'E-Recipe',
              style: TextStyle(
                color: brandColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Cook Smart, Eat Better',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 150,
              child: LinearProgressIndicator(
                value: 0.3,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(brandColor),
                borderRadius: BorderRadius.circular(5),
                minHeight: 3,
              ),
            ),
            // ElevatedButton and its preceding SizedBox have been removed
          ],
        ),
      ),
    );
  }
}