import 'package:flutter/material.dart';
import 'about_page.dart';  // Hakkımızda sayfasını içe aktar
import 'language_button.dart';
import 'drawer.dart'; // CustomDrawer'ı içe aktar
import 'login_screen.dart'; // Giriş ekranını içe aktar

class GreetingScreen extends StatelessWidget {
  final String language;

  GreetingScreen({required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hoşgeldiniz ❤️"),
        backgroundColor: Colors.pinkAccent,  // AppBar arka plan rengini pembe yapıyoruz
        actions: [
          // Home yerine Log out butonunu ekliyoruz
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Log out işlemi
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()), // Giriş ekranına yönlendirme
                (route) => false, // Tüm önceki sayfaları kaldırır
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              // Hakkımızda sayfasına git
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Yatayda değil dikeyde ortalamak için
          crossAxisAlignment: CrossAxisAlignment.center, // Yatayda ortalamak için
          children: <Widget>[
            const Text(
              "Haydi Dünya'nın Her Yerinde Selamlaşalım!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Yazıyı yatayda da ortalar
            ),
            const SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  LanguageButton(language: "Türkçe", animationType: "turkish"),
                  const SizedBox(width: 8),
                  LanguageButton(language: "English", animationType: "english"),
                  const SizedBox(width: 8),
                  LanguageButton(language: "Deutsch", animationType: "german"),
                  const SizedBox(width: 8),
                  LanguageButton(language: "Français", animationType: "french"),
                  const SizedBox(width: 8),
                  LanguageButton(language: "Español", animationType: "spanish"),
                  const SizedBox(width: 8),
                  LanguageButton(language: "Italiano", animationType: "italian"),
                  const SizedBox(width: 8),
                  LanguageButton(language: "Русский", animationType: "russian"),
                  const SizedBox(width: 8),
                  LanguageButton(language: "日本語", animationType: "japanese"),
                  const SizedBox(width: 8),
                  LanguageButton(language: "中文", animationType: "chinese"),
                ],
              ),
            ),
            const SizedBox(height: 40), // Dil butonları ile yazı arasına boşluk
            const Text(
              "Kaydirarak daha fazla dil seçeneğine erisebilirsiniz.", // Yeni eklenen yazı
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
