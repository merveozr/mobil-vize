import 'package:flutter/material.dart';

class AnimatedGreeting extends StatelessWidget {
  final String language;
  final String animationType;

  AnimatedGreeting({required this.language, required this.animationType});

  @override
  Widget build(BuildContext context) {
    String greeting = '';
    switch (language) {
      case 'Türkçe':
        greeting = "Merhaba!";
        break;
      case 'English':
        greeting = "Hello!";
        break;
      case 'Deutsch':
        greeting = "Hallo!";
        break;
      case 'Français':
        greeting = "Bonjour!";
        break;
      case 'Español':
        greeting = "¡Hola!";  
        break;
      case 'Italiano':
        greeting = "Ciao!";
        break;
      case 'Русский':
        greeting = "Привет!";
        break;
      case '日本語':
        greeting = "こんにちは!";
        break;
      case '中文':
        greeting = "你好!";
        break;
    }

    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(seconds: 2),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Text(
            greeting,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
