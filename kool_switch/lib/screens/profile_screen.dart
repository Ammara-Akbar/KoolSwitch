import 'package:flutter/material.dart';
import 'package:kool_switch/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),

      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Avatar
            const CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primaryColor,
              child: Text(
                "J",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 12),

            // Name
            const Text(
              "James Doe John",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(height: 4),

            // Username
            const Text(
              "@jamesd",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 10),

            // Verified Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified, color: Colors.teal, size: 16),
                  SizedBox(width: 4),
                  Text("Verified user",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Trading Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trading info",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      // Toggle Buttons (30d / All time)

                      ToggleExample()
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  // Stats Grid
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("5",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Text("Total Trades",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("100.00%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Text("Completion Rate",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("4.3 Minutes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Text("Average release time",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("100.00%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Text("Average pay time",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // View More Details
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "View More Details",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),

            const Divider(thickness: 1),

            // Menu Items
            const _MenuItem(
                title: "Received Feedback", icon: "assets/images/like-tag.png"),
            Divider(),
            const _MenuItem(
                title: "Notifications",
                icon: "assets/images/Notification.png"),
                  Divider(),
            const _MenuItem(
                title: "Become a merchant", icon: "assets/images/verify.png"),
                  Divider(),
            const _MenuItem(
                title: "Your Payment Method", icon: "assets/images/money1.png"),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ToggleExample extends StatefulWidget {
  const ToggleExample({super.key});

  @override
  State<ToggleExample> createState() => _ToggleExampleState();
}

class _ToggleExampleState extends State<ToggleExample> {
  bool is30dSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0C2340), // dark navy bg
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 30d Button
          GestureDetector(
            onTap: () {
              setState(() => is30dSelected = true);
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: is30dSelected ? const Color(0xFF0C2340) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "30d",
                  style: TextStyle(
                    color: is30dSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          // All time Button
          GestureDetector(
            onTap: () {
              setState(() => is30dSelected = false);
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: is30dSelected ? Colors.white : const Color(0xFF0C2340),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "All time",
                  style: TextStyle(
                    color: is30dSelected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w500,
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

// ✅ Custom Menu Item
class _MenuItem extends StatelessWidget {
  final String title;
  final String icon;

  const _MenuItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Image.asset(
        icon,
        color: Colors.black87,
        height: 25,
      ),
      title: Text(title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {},
    );
  }
}
