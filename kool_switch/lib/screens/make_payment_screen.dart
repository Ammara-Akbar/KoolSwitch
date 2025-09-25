import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kool_switch/utils/colors.dart';

class MakePaymentScreen extends StatelessWidget {
  const MakePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Make Payment",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Amount
            const Text(
              "N100,000",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 6),
            const Text(
              "Make Payment in",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 4),
            const Text(
              "00:45:23",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Card Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Seller Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Seller Name",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                      Row(
                        children: [
                          Text("Michael",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white)),
                          SizedBox(width: 4),
                          Icon(Icons.verified, color: Colors.amber, size: 16),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Chat button
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white10, width: 1),
                        borderRadius: BorderRadius.circular(6)),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0C2340), // Dark Blue
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),

                        padding: const EdgeInsets.symmetric(horizontal: 14),
                      ),
                      onPressed: () {},
                      icon:
                          Image.asset("assets/images/messages.png", height: 22),
                      label: const Text(
                        "Chat",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

// Instructions Box
DottedBorder(
  color: Colors.white24,
  strokeWidth: 1,
  borderType: BorderType.RRect,
  radius: const Radius.circular(6),
  dashPattern: const [6, 3],
  child: Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: const Text(
            "M",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Leave the app and make the transfer to the details listed above. "
          "Transfer the funds to the seller account",
          style: TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
    ),
  ),
),

                  const SizedBox(height: 20),

                  // Payment Details
                  const Text(
                    "Payment Details",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),

                  _detailRow("Account Name", "John Doe"),
                  const SizedBox(height: 15),
                  _detailRow("Account Number", "0123456783"),
                  const SizedBox(height: 15),
                  _detailRow("Bank", "Access Bank", showCopy: false),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: const Text(
                  "Transferred, Notify Seller",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable Payment Details Row
  Widget _detailRow(String label, String value, {bool showCopy = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 14)),
        Row(
          children: [
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
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
