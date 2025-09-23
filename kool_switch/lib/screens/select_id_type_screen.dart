import 'package:flutter/material.dart';
import 'package:kool_switch/screens/passport_photo_instruction_screen.dart';
import 'package:kool_switch/utils/colors.dart';

class SelectIDTypeScreen extends StatefulWidget {
  const SelectIDTypeScreen({super.key});

  @override
  State<SelectIDTypeScreen> createState() => _SelectIDTypeScreenState();
}

class _SelectIDTypeScreenState extends State<SelectIDTypeScreen> {
  String? selectedIdType;

  final List<Map<String, String>> idTypes = [
    {"title": "ID card", "image": "assets/images/idcard1.png"},
    {"title": "Passport", "image": "assets/images/passport.png"},
    {"title": "Driver’s license", "image": "assets/images/idcard.png"},
  ];

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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Select ID type",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Document Issuing Country/Region",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Fake dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "🇳🇬 Nigerian Naira",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_drop_down, color: Colors.black54),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // ID type options
                  ...idTypes.map((item) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIdType = item["title"];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 14),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(item["image"]!,
                                      width: 26, height: 26),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  item["title"]!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  selectedIdType == item["title"]
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color: selectedIdType == item["title"]
                                      ? AppColors.primaryColor
                                      : Colors.black38,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    );
                  }).toList(),

                  const Spacer(),

                  // Continue button
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
                      onPressed: selectedIdType == null
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const PassportPhotoInstructionScreen()),
                              );
                            },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
