import 'package:flutter/material.dart';
import 'package:kool_switch/screens/chat_screen.dart';
import 'package:kool_switch/screens/create_listing_screen.dart';
import 'package:kool_switch/screens/market_place_screen.dart';
import 'package:kool_switch/screens/profile_screen.dart';
import 'package:kool_switch/screens/wallet_dashboard_screen.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;

  final Color selectedColor = const Color(0xff2063A8);
  final Color unselectedColor = Colors.black54;

  // Screens for each tab
  final List<Widget> _screens = [
    WalletDashboardScreen(),
    MarketPlaceScreen(),
    CreateListingScreen(),
    ChatScreen(),
    ProfileScreen()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // background color of bottom bar
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: selectedColor,
          unselectedItemColor: unselectedColor,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/homeicon.png",
                height: 28,
                color: _selectedIndex == 0 ? selectedColor : unselectedColor,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/tradeicon.png",
                height: 28,
                color: _selectedIndex == 1 ? selectedColor : unselectedColor,
              ),
              label: "Trades",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/receipt-2.png",
                height: 28,
                color: _selectedIndex == 2 ? selectedColor : unselectedColor,
              ),
              label: "Listing",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/chaticon.png",
                height: 28,
                color: _selectedIndex == 3 ? selectedColor : unselectedColor,
              ),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/profileicon.png",
                height: 28,
                color: _selectedIndex == 4 ? selectedColor : unselectedColor,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
