import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({super.key});

  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  // Kayıtları getir
  Future<List<String>> _getGreetingTimes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('greeting_times') ?? [];
  }

  // Kayıtları sil
  Future<void> _deleteGreetingTime(String time) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> greetingTimes = prefs.getStringList('greeting_times') ?? [];
    greetingTimes.remove(time);
    await prefs.setStringList('greeting_times', greetingTimes);
    setState(() {});
  }

  // Yeniden ekleme (geri alma) işlemi için
  Future<void> _undoDelete(String time, int index, List<String> currentList) async {
    final prefs = await SharedPreferences.getInstance();
    currentList.insert(index, time);
    await prefs.setStringList('greeting_times', currentList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Selamlaşma Kayıtları",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Color(0xFFEDC6C1),
      ),
      body: FutureBuilder<List<String>>(
        future: _getGreetingTimes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history_toggle_off,
                    size: 60,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Henüz kayıtlı selamlaşma yok.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          } else {
            List<String> greetingTimes = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: greetingTimes.length,
              itemBuilder: (context, index) {
                final time = greetingTimes[index];
                
                return TweenAnimationBuilder<Offset>(
                  tween: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  builder: (context, offset, child) {
                    return Transform.translate(
                      offset: offset * 200, 
                      child: child,
                    );
                  },
                  child: Dismissible(
                    key: Key(time),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _deleteGreetingTime(time);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$time silindi"),
                          action: SnackBarAction(
                            label: "Geri Al",
                            onPressed: () {
                              _undoDelete(time, index, greetingTimes);
                            },
                          ),
                        ),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: const Icon(
                          
                          Icons.alarm,
                          color: Colors.pinkAccent,
                          size: 30,
                        ),
                        title: Text(
                          time,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Ek bir ikon olarak sağ tarafta "alarm" ikonu ekledim
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () => _deleteGreetingTime(time),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {}); 
        },
        backgroundColor: Color(0xFFEDC6C1),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}