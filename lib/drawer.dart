import 'package:flutter/material.dart';
import 'package:mobilproje1/login_screen.dart'; 
import 'package:mobilproje1/records_page.dart'; 
import 'package:mobilproje1/about_page.dart';  

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFEDC6C1),  
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,  
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),  // Yumuşatılmış köşeler
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Image.network(
                      'https://img.freepik.com/free-vector/3d-businesswoman-work-with-job-character_40876-3733.jpg?t=st=1744052450~exp=1744056050~hmac=4af7e91bd5490fb03538fdf32d460932b88d22b2b48554eec6aa44f576aa717e&w=740',
                      width: 100, // Logo genişliği
                      height: 100, // Logo yüksekliği
                      fit: BoxFit.cover, // Görseli tam sığdırmak için
                    ),
                    SizedBox(width: 10), // Görsel ve metin arasında boşluk
                    Text(
                      'Menü',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.purple.shade900),  
              title: Text('Kayıtlar', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecordsPage(), 
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.purple.shade900),  
              title: Text('Hakkımızda', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(), 
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.purple.shade900),  
              title: Text('Çıkış Yap', style: TextStyle(fontSize: 18)),
              onTap: () {
                
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()), 
                      (route) => false, 
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
