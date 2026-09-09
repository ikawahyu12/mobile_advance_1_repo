import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acara 16 - Core Components II',
      home: const Acara16HomePage(),
    );
  }
}

class Acara16HomePage extends StatefulWidget {
  const Acara16HomePage({super.key});

  @override
  State<Acara16HomePage> createState() => _Acara16HomePageState();
}

class _Acara16HomePageState extends State<Acara16HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acara 16 - Layout & Assets'),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Mahasiswa TI"),
              accountEmail: Text("mahasiswa@polije.ac.id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.teal),
              ),
              decoration: BoxDecoration(color: Colors.teal),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1. Assets Gambar Lokal (Sesuai BKPM)
            const Text(
              '1. Assets Gambar Lokal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/groot.jpg', // Pastikan nama file gambar sesuai
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 150,
                      height: 150,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Text(
                          'Gambar lokal\nbelum ada',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Divider(height: 30),

            // 2. Row Widget
            const Text(
              '2. Row Widget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Chip(avatar: Icon(Icons.star), label: Text('Rating')),
                Chip(avatar: Icon(Icons.thumb_up), label: Text('Like')),
                Chip(avatar: Icon(Icons.share), label: Text('Share')),
              ],
            ),
            const Divider(height: 30),

            // 3. Column Widget
            const Text(
              '3. Column Widget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('• Item Pertama dalam Column'),
                Text('• Item Kedua dalam Column'),
              ],
            ),
            const Divider(height: 30),

            // 4. Stack Widget
            const Text(
              '4. Stack Widget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 100,
                    color: Colors.teal.shade200,
                  ),
                  Container(
                    width: 150,
                    height: 70,
                    color: Colors.teal.shade400,
                  ),
                  const Text(
                    'Teks Di Atas Stack',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}