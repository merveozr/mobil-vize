import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hakkımızda"),
        backgroundColor: Color(0xFFEDC6C1),  
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Ekip Üyeleri',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Üye 1
            _buildTeamMember(
              'assets/aleyna.png', 
              'Aleyna Özmen',
              '030122016@std.izu.edu.tr',
            ),
            const SizedBox(height: 20),
            // Üye 2
            _buildTeamMember(
              'assets/merve.png', 
              'Merve Özer',
              '030122063@std.izu.edu.tr',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);  
              },
              child: const Text('Geri Dön'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(String imagePath, String name, String email) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
