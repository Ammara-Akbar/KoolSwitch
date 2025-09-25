import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:kool_switch/utils/colors.dart';

class ReleaseFiatScreen extends StatelessWidget {
  const ReleaseFiatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.shade200),
                child: Icon(Icons.arrow_back, color: Colors.black45)),
          ),
        ),
        title: const Text(
          "Releasing Fiat Currency",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  children: [
                    Image.asset("assets/images/messages.png", height: 22),
                    const Text(
                      "Chat",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  ],
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subtitle
            const Text(
              "You have marked this order as paid",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 12),

            // Timer
            const Text(
              "00:10:00",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black45,
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black54, fontSize: 13),
                children: [
                  const TextSpan(text: "Estimated release time is "),
                  TextSpan(
                    text: "10 Minutes",
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Attention Box
            DottedBorder(
              color: Colors.black26,
              strokeWidth: 1,
              borderType: BorderType.RRect,
              radius: const Radius.circular(6),
              dashPattern: const [6, 3],
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/danger.png", height: 22),
                        SizedBox(width: 8,),
                        Text("Attention")
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "After the the payment is confirmed. The Fiat would be transfered automatically to your account",
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Fiat & Payment Details
            DottedBorder(
              color: Colors.black26,
              strokeWidth: 1,
              borderType: BorderType.RRect,
              radius: const Radius.circular(6),
              dashPattern: const [6, 3],
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _detailRow("Fiat Currency", "NGN"),
                    const SizedBox(height: 12),
                    _detailRow("Value", "0.03456NGN"),
                    const SizedBox(height: 12),
                    _detailRow("FIAT Value", "100,000.00 NGN", valueBold: true),
                    const SizedBox(height: 20),
                    const Text(
                      "Payment Details",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _detailRow("Account Name", "John Doe", showCopy: true),
                    const SizedBox(height: 12),
                    _detailRow("Account Number", "0123456783", showCopy: true),
                    const SizedBox(height: 12),
                    _detailRow("Bank", "Access Bank"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Cancel",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Appeal",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value,
      {bool showCopy = false, bool valueBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 13)),
        Row(
          children: [
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: valueBold ? FontWeight.w700 : FontWeight.normal,
              ),
            ),
            if (showCopy) ...[
              const SizedBox(width: 6),
              Image.asset("assets/images/copy.png", height: 18),
            ]
          ],
        ),
      ],
    );
  }
}
