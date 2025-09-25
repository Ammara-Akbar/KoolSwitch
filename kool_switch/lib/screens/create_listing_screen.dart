import 'package:flutter/material.dart';
import 'package:kool_switch/screens/buy_ngn_screen.dart';
import 'package:kool_switch/utils/colors.dart';

class CreateListingScreen extends StatefulWidget {
  CreateListingScreen({Key? key}) : super(key: key);

  @override
  State<CreateListingScreen> createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  bool isBuy = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,

        //  leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(6),
        //             color: Colors.grey.shade200),
        //         child: Icon(Icons.arrow_back, color: Colors.black45)),
        //   ),
        // ),
        title: const Text(
          "Create Listing",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Offer Type
            const Text(
              "Offer Type",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isBuy = true),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isBuy ? const Color(0xFF0D213A) : Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Buy",
                          style: TextStyle(
                            fontSize: 16,
                            color: isBuy ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isBuy = false),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              !isBuy ? const Color(0xFF0D213A) : Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Sell",
                          style: TextStyle(
                            fontSize: 16,
                            color: !isBuy ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// Exchange Details
            const Text(
              "Exchange Details",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            _buildTextField("Min NGN (e.g 1000)"),
            const SizedBox(height: 10),
            _buildTextField("Max NGN (e.g 1000)"),
            const SizedBox(height: 10),
            _buildTextField("Rate (e.g 1RMB = 250 NGN)"),
            const SizedBox(height: 20),

            /// Payment Method
            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            _buildPaymentTile(
                "assets/images/bank.png", "Bank", const Color.fromARGB(255, 206, 231, 252)),
            const SizedBox(height: 12),
            _buildPaymentTile("assets/images/wallet.png", "Mobile Wallet",
                const Color.fromARGB(255, 228, 205, 232)),
            const SizedBox(height: 12),
            _buildPaymentTile("assets/images/cash.png", "Cash Pickup",
                const Color.fromARGB(255, 251, 232, 202)),
            const SizedBox(height: 20),

            /// Additional Info
            const Text(
              "Additional Info",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            _buildTextField("Notes", maxLines: 3),
            const SizedBox(height: 15),

            /// Fee Section
            const Text(
              "Estimated fee: 0.5% | You will receive: 9,750 NGN",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),

            /// Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () {},
                    child: const Text("Preview",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D213A),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => BuyNGNScreen()),
                      );
                    },
                    child: const Text("Post Listing",
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

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }

  Widget _buildPaymentTile(String icon, String title, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(8)),
          child: Image.asset(
            icon,
            height: 24,
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 16, color: Colors.black54),
        onTap: () {},
      ),
    );
  }
}
