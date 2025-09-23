// lib/auth_screens/splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kool_switch/verification_screens/idenitity_verification_screen.dart';
import 'package:kool_switch/utils/my_images.dart';
import 'utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const IdentityVerificationScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              MyImages.appLogo,
              height: 120,
              width: 160,
            ),
            const SizedBox(height: 7),
             Text(
              'KOOLSWITCH',
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 2.6,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
