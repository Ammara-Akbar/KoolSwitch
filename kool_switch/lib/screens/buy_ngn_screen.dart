import 'package:flutter/material.dart';

class BuyNGNScreen extends StatefulWidget {
  const BuyNGNScreen({super.key});

  @override
  State<BuyNGNScreen> createState() => _BuyNGNScreenState();
}

class _BuyNGNScreenState extends State<BuyNGNScreen> {
  bool isFiat = true;

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
        centerTitle: true,
        title: const Text(
          "Buy NGN",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Toggle Tabs
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isFiat = true),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isFiat ? const Color(0xFF0D213A) : Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Fiat",
                          style: TextStyle(
                            color: isFiat ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isFiat = false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isFiat ? const Color(0xFF0D213A) : Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "RMB",
                          style: TextStyle(
                            color: !isFiat ? Colors.white : Colors.black,
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

            /// RMB Amount
            const Text("RMB Amount",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _buildTextField("E.g 5000", suffix: "NGN"),
            const SizedBox(height: 8),

            /// Price + Limit Row
            Row(
              children: const [
                Icon(Icons.monetization_on, size: 16, color: Colors.black54),
                SizedBox(width: 4),
                Text("Price ₦750",
                    style: TextStyle(fontSize: 13, color: Colors.black54)),
                SizedBox(width: 16),
                Icon(Icons.lock_clock, size: 16, color: Colors.black54),
                SizedBox(width: 4),
                Text("Limit ₦7,500.00 - 9,000.00",
                    style: TextStyle(fontSize: 13, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 16),

            /// FIAT Amount
            const Text("FIAT amount you'll send",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            _buildTextField("10,0000", suffix: "NGN"),
            const SizedBox(height: 20),

            /// Proceed Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D213A),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: const Center(
                child: Text("Proceed", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 24),

            /// Trade Information
            const Text(
              "Trade Information",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0D213A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildInfoRow(Icons.person, "Seller Name", "Micaael"),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.access_time, "Est Time", "15 Minutes"),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.payment, "Payment Method", "Bank Transfer"),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                    "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// Bottom Nav Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0D213A),
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Trades"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Listing"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {String? suffix}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
        suffixText: suffix,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white70, size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
