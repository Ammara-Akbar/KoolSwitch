import 'package:flutter/material.dart';
import 'package:kool_switch/screens/facial_recognition_screen.dart';
import 'package:kool_switch/utils/colors.dart';

class ProofOfAddressScreen extends StatelessWidget {
  const ProofOfAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(height: 3, color: Colors.black87),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(height: 3, color: Colors.black87),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(height: 3, color: Colors.black12),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Address card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/hhh-removebg-preview.png",
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Title
                  const Text(
                    "Proof of address",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Subtitle
                  const Text(
                    "We need proof of address to confirm that you live in Hong Kong",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Bullet points
                  const _BulletPoint(
                    text:
                        "You can use any of the following documents as proof of address documentation: Utility bills / Bank statement / Communication billing",
                  ),
                  const SizedBox(height: 12),
                  const _BulletPoint(
                    text:
                        "The document must contain your name, address in Hong Kong, date within the last 3 months",
                  ),
                  const SizedBox(height: 12),
                  const _BulletPoint(
                      text: "Please provide supporting documents in English"),
                ],
              ),
            ),
          ),

          // Take photo button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const FacialRecognitionScreen()),
                  );
                },
                child: const Text(
                  "Take photo",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 14, color: Colors.black54)),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
