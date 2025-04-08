import 'package:flutter/material.dart';
import 'greeting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String _language = 'Türkçe'; // Varsayılan dil

  void _saveGreetingTime() async {
    final prefs = await SharedPreferences.getInstance();
    String currentTime = DateTime.now().toString();
    List<String> greetingTimes = prefs.getStringList('greeting_times') ?? [];
    greetingTimes.add(currentTime);
    await prefs.setStringList('greeting_times', greetingTimes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDC6C1), // Açık pastel arka plan
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Giriş Yap", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline, size: 80, color: Colors.pink),  
              SizedBox(height: 30),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  if (_usernameController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    _saveGreetingTime();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GreetingScreen(language: _language),
                      ),
                    );
                  }
                },
                child: Text("Giriş Yap", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
