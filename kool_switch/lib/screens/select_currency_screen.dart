import 'package:flutter/material.dart';

class SelectCurrencyScreen extends StatefulWidget {
  const SelectCurrencyScreen({super.key});

  @override
  State<SelectCurrencyScreen> createState() => _SelectCurrencyScreenState();
}

class _SelectCurrencyScreenState extends State<SelectCurrencyScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCurrency = "NGN"; // default selected
  List<Map<String, String>> currencies = [
    {"symbol": "د.إ", "code": "AED"},
    {"symbol": "\$", "code": "ARS"},
    {"symbol": "\$", "code": "AUD"},
    {"symbol": "₼", "code": "AZN"},
    {"symbol": "\$", "code": "BMD"},
    {"symbol": "\$", "code": "BOB"},
    {"symbol": "KM", "code": "BAM"},
    {"symbol": "P", "code": "BWP"},
    {"symbol": "\$", "code": "COP"},
    {"symbol": "₦", "code": "NGN"},
    {"symbol": "\$", "code": "SVC"},
    {"symbol": "€", "code": "EUR"},
    {"symbol": "£", "code": "FKP"},
    {"symbol": "\$", "code": "FJD"},
    {"symbol": "د.إ", "code": "AED"},
    {"symbol": "د.إ", "code": "AED"},
    {"symbol": "د.إ", "code": "AED"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.white,
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
        centerTitle: true,
        title: const Text(
          "Select Currency",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔍 Search bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey.shade500, size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Enter Currency",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    onChanged: (value) => setState(() {}),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Currencies",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(137, 105, 61, 61),
                  ),
                ),
                Divider(),
              ],
            ),
          ),

          // Currency list
          Expanded(
            child: ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                final isSelected = selectedCurrency == currency["code"];

                if (_searchController.text.isNotEmpty &&
                    !currency["code"]!
                        .toLowerCase()
                        .contains(_searchController.text.toLowerCase())) {
                  return const SizedBox.shrink();
                }

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCurrency = currency["code"]!;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? const Color(0xFF0D213A) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currency["symbol"]!,
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          currency["code"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        if (isSelected)
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                            child: const Icon(Icons.check,
                                color: Colors.white, size: 18),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
