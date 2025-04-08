import 'package:flutter/material.dart';
import 'animated_greeting.dart';  
import 'package:lottie/lottie.dart';  

class LanguageButton extends StatelessWidget {
  final String language;
  final String animationType;

  LanguageButton({required this.language, required this.animationType});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showGreeting(context, language, animationType);
      },
      child: Text(
        language,
        style: TextStyle(color: Colors.pinkAccent),  
      ),
    );
  }

  void _showGreeting(BuildContext context, String language, String animationType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: null,  
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              
              Lottie.asset('assets/animations/Animation - 1744030702388.json', width: 100, height: 100),
              SizedBox(height: 20), 
              AnimatedGreeting(
                language: language,
                animationType: animationType,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}
