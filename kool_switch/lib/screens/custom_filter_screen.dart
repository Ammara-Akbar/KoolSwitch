import 'package:flutter/material.dart';
import 'package:kool_switch/utils/colors.dart';

class CustomFiltersScreen extends StatefulWidget {
  const CustomFiltersScreen({Key? key}) : super(key: key);

  @override
  State<CustomFiltersScreen> createState() => _CustomFiltersScreenState();
}

class _CustomFiltersScreenState extends State<CustomFiltersScreen> {
  final TextEditingController _amountController = TextEditingController();
  String selectedCurrency = "NGN";

  List<String> selectedMethods = ["Bank", "Wise"];
  List<String> allMethods = [
    "All",
    "Bank Transfer",
    "PayPal",
    "Cash"
  ]; // added more to test scroll

  List<String> selectedCountries = ["Nigeria"];
  List<Map<String, String>> countries = [
    {"flag": "🇮🇳", "name": "India"},
    {"flag": "🇮🇩", "name": "Indonesia"},
    {"flag": "🇳🇬", "name": "Nigeria"},
    {"flag": "🇰🇪", "name": "Kenya"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey.shade200,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.black45),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Custom Filters",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // 🔹 makes whole screen scrollable
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Amount
            const Text("Amount",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.primaryColor,
                      controller: _amountController,
                      decoration: const InputDecoration(
                        hintText: "E.g 5000",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Text(selectedCurrency,
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Payment Method
            const Text("Payment Method",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: selectedMethods.map((method) {
                return Chip(
                  label: Text(method),
                  avatar: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 4,
                  ),
                  onDeleted: () {
                    setState(() {
                      selectedMethods.remove(method);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),

            // 🔹 Scrollable Payment Method List
            // 🔹 Scrollable Payment Method List with borders
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26), // outer border
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                height: 130, // fixed height so it scrolls internally
                child: ListView.builder(
                  itemCount: allMethods.length,
                  itemBuilder: (context, index) {
                    final m = allMethods[index];
                    bool isSelected = selectedMethods.contains(m);

                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedMethods.remove(m);
                          } else {
                            selectedMethods.add(m);
                          }
                        });
                      },
                      child: Container(
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.white,
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : Colors.grey
                                    .shade300, // light border for unselected
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              m,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                            if (isSelected)
                              const Icon(Icons.check_circle,
                                  color: Colors.white),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Select Country
            const Text("Select Country",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: selectedCountries.map((country) {
                return Chip(
                  label: Text(country),
                  avatar: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 4,
                  ),
                  onDeleted: () {
                    setState(() {
                      selectedCountries.remove(country);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final c = countries[index];
                bool isSelected = selectedCountries.contains(c["name"]);
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedCountries.remove(c["name"]);
                      } else {
                        selectedCountries.add(c["name"]!);
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected ? AppColors.primaryColor : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${c["flag"]} ${c["name"]!}",
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            )),
                        Icon(Icons.check_circle,
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade400),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 22),

            // 🔹 Bottom buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // ✅ radius
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _amountController.clear();
                        selectedMethods.clear();
                        selectedCountries.clear();
                      });
                    },
                    child: const Text(
                      "Reset",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D213A),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // ✅ radius
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, {
                        "amount": _amountController.text,
                        "methods": selectedMethods,
                        "countries": selectedCountries,
                      });
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
