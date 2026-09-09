import 'package:flutter/material.dart';
import 'Chart_model.dart'; // Import file model di sini

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram UI',
      theme: ThemeData(
        primaryColor: const Color(0xFF5682a3),
      ),
      home: const TelegramHomePage(),
    );
  }
}

class TelegramHomePage extends StatelessWidget {
  const TelegramHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telegram'),
        backgroundColor: const Color(0xFF5682a3),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 15),
        ],
      ),
      // --- DRAWER TELEGRAM ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF5682a3)),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/groot.jpg'),
              ),
              accountName: const Text('Mahasiswa TI', style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: const Text('+62 812-3456-7890'),
            ),
            ListTile(
              leading: const Icon(Icons.group_outlined),
              title: const Text('New Group'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Contacts'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.call_outlined),
              title: const Text('Calls'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.bookmark_border),
              title: const Text('Saved Messages'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      // --- BODY: DAFTAR CHAT MENGGUNAKAN CHART_MODEL ---
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, i) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(items[i].profileUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  items[i].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  items[i].time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                items[i].message,
                style: const TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          );
        },
      ),
    );
  }
}