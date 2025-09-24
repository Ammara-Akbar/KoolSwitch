import 'package:flutter/material.dart';

class WalletDashboardScreen extends StatelessWidget {
  const WalletDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundImage:
                            AssetImage("assets/images/profilepic.jpg"),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Halo,",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "Nadila Aulia",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/notification (1).png",
                    height: 22,
                  )
                ],
              ),

              const SizedBox(height: 20),

              // Balance card
              Container(
                width: double.infinity,
                height: 120,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF0C2340),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/background.png"), // wave background
                    fit: BoxFit.contain,

                    alignment: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Your Balance",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "\$56.98",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Featured
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Featured",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _ActionCard(
                    icon: "assets/images/addicon.png",
                    label: "Deposit",
                  ),
                  _ActionCard(
                    icon: "assets/images/download.png",
                    label: "Withdraw",
                  ),
                  _ActionCard(
                    icon: "assets/images/request.png",
                    label: "Request",
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Last Activity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Last Activity",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              const _ActivityTile(
                name: "Mendy Inc.",
                date: "Thu, 22 Aug",
                amount: "+₦500.00",
              ),
              const _ActivityTile(
                name: "Riger Inc.",
                date: "Wed, 21 Aug",
                amount: "+₦324.38",
              ),
              const _ActivityTile(
                name: "Owen Inc.",
                date: "Tue, 20 Aug",
                amount: "+₦550.00",
              ),
              const _ActivityTile(
                name: "Mordan Inc.",
                date: "Mon, 19 Aug",
                amount: "+₦1,876.09",
              ),
              const _ActivityTile(
                name: "Owen Inc.",
                date: "Tue, 20 Aug",
                amount: "+₦550.00",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // static Widget _divider() {
  //   return const Divider(
  //     thickness: 0.4,
  //     color: Colors.black12,
  //     indent: 55,
  //     endIndent: 10,
  //   );
  // }
}

// Action card widget
class _ActionCard extends StatelessWidget {
  final String icon;
  final String label;
  const _ActionCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(icon, height: 32, color: Colors.black87),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// Activity list tile
class _ActivityTile extends StatelessWidget {
  final String name;
  final String date;
  final String amount;
  const _ActivityTile({
    required this.name,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.04), // soft shadow
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 2), // bottom
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.04),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, -2), // top
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.04),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(2, 0), // right
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.04),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(-2, 0), // left
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          radius: 20,
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        trailing: Text(
          amount,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xff5E82DE),
          ),
        ),
      ),
    );
  }
}
