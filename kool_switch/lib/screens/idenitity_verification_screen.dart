import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kool_switch/utils/colors.dart';

class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Let’s get started",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "To ensure the security of your account and protect against fraud, "
              "we require you to complete our identity verification process",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),

            // Photo ID
            _buildVerificationItem(
              image: "assets/images/idcard.png",
              title: "Photo ID",
              subtitle: "ID card, passport, driver license supported",
            ),
            const SizedBox(height: 20),

            // Proof of address
            _buildVerificationItem(
              image: "assets/images/address.png",
              title: "Proof of address",
              subtitle: "Documents that can prove the address, such as utility bills, etc",
            ),
            const SizedBox(height: 20),

            // Facial recognition
            _buildVerificationItem(
              image: "assets/images/recog.png",
              title: "Facial recognition",
              subtitle: "Confirm that the portrait matches the picture on the identification document.",
            ),

            const Spacer(),

            // Footer text with link
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text.rich(
                TextSpan(
                  text: "Clicking the continue button means that I have read and agreed to the ",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                  children: [
                    TextSpan(
                      text: "user identity authentication information statement",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Open link or navigate
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Continue action
                },
                child: const Text(
                  "Agree and continue",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationItem({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, width: 40, height: 40),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
        )
      ],
    );
  }
}
