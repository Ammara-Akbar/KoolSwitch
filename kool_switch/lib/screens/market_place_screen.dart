import 'package:flutter/material.dart';
import 'package:kool_switch/screens/custom_filter_screen.dart';
import 'package:kool_switch/screens/select_currency_screen.dart';
import 'package:kool_switch/utils/colors.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({super.key});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  bool isBuySelected = true;
  int selectedCurrency = 1; // 0 = Naira, 1 = Yuan, 2 = Naira M

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ Header AppBar
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Koolswitch MarketPlace",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Buy / Sell toggle
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 22, 46, 71),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Row(
                      children: [
                        _buySellTab("Buy", true),
                        _buySellTab("Sell", false),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ✅ Currency selection
                  Column(
                    children: [
                      Row(
                        children: [
                          _currencyItem("Nigerian Naira", 0),
                          _currencyItem("Chinese Yuan", 1),
                          _currencyItem("Nigerian M", 2),
                        ],
                      ),
                      Divider()
                    ],
                  ),

                  // ✅ Search + Filter
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              
                            },
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(08),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "E.g 5000",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "NGN",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SelectCurrencyScreen()),
                            );
                          },
                          child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(08),
                                  border: Border.all(
                                      color: Colors.white, width: 0.8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/tradeee.png",
                                    height: 22,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "NGN",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CustomFiltersScreen()),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Filter",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Image.asset(
                                  "assets/images/Filter.png",
                                  height: 22,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ✅ Trade list
            _tradeTile(
              name: "Tolulope",
              method: "Bank Transfer",
              price: "₦4,500",
              quantity: "348.78 NGN",
              orders: "750",
              completion: "91%",
              buttonText: "Sell",
              buttonColor: Colors.red,
            ),
            _tradeTile(
              name: "Michael",
              method: "Momo",
              price: "₦4,563",
              quantity: "348.78 NGN",
              orders: "750",
              completion: "91%",
              buttonText: "Buy",
              buttonColor: Colors.green,
            ),
            _tradeTile(
              name: "Michael",
              method: "Momo",
              price: "₦4,587",
              quantity: "348.78 NGN",
              orders: "750",
              completion: "91%",
              buttonText: "Sell",
              buttonColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Buy / Sell Tab
  Widget _buySellTab(String label, bool buy) {
    bool isSelected = isBuySelected == buy;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isBuySelected = buy),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Currency Item
  Widget _currencyItem(String label, int index) {
    final bool isSelected = selectedCurrency == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedCurrency = index),
        child: Column(
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                color: isSelected ? Colors.white : Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            if (isSelected)
              Container(
                height: 2,
                width: 60,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }

// ✅ Custom Trade Tile (No ListTile used)
  Widget _tradeTile({
    required String name,
    required String method,
    required String price,
    required String quantity,
    required String orders,
    required String completion,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Top row: Avatar + Name + Verified + Quantity
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey.shade300,
                    child: Text(
                      name[0],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Name + Verified
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(Icons.verified,
                            color: Color(0xffF2C025), size: 16),
                      ],
                    ),
                  ),

                  // Quantity
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quantity  $quantity",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      // 🔹 Method row
                      Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            method,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // 🔹 Price
              Text(
                "Price",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black38,
                ),
              ),

              // 🔹 Orders + Completion + Button on right
              Row(
                children: [
                  Image.asset("assets/images/receipt-2.png", height: 19),
                  const SizedBox(width: 4),
                  Text(
                    "$orders orders",
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child:
                        const Icon(Icons.check, size: 8, color: Colors.black),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "$completion Completion",
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                  ),

                  const Spacer(), // 👈 pushes button to the far right

                  SizedBox(
                    width: 90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          color: Colors.black, // white like screenshot
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey.shade300, thickness: 1),
      ],
    );
  }
}
