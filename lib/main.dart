import 'package:flutter/material.dart';
 // LoginScreen'i içe aktar
import 'splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
    );
  }
}

