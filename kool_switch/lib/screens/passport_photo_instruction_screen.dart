import 'package:flutter/material.dart';
import 'package:kool_switch/screens/confirm_id_photo_screen.dart';
import 'package:kool_switch/utils/colors.dart';

class PassportPhotoInstructionScreen extends StatelessWidget {
  const PassportPhotoInstructionScreen({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
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
                  child: Container(
                    height: 3,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    height: 3,
                    color: Colors.black12,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    height: 3,
                    color: Colors.black12,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Passport image
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: Image.asset(
                          "assets/images/ddd.png",
                          width: 270,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
SizedBox(height: 22,),
                  // Title
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Before take your passport photo, please make sure that",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Bullet points
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _BulletPoint(text: "Your ID isn’t expired"),
                      SizedBox(height: 8),
                      _BulletPoint(text: "Take a clear photo"),
                      SizedBox(height: 8),
                      _BulletPoint(text: "Capture you entire ID"),
                    ],
                  ),
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
                                    builder: (_) =>
                                        const ConfirmIDPhotoScreen()),
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
        const Text(
          "• ",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
