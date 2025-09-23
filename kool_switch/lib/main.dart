import 'package:flutter/material.dart';
import 'package:kool_switch/splash_screen.dart';

Future<void> main() async {
 
                       
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}