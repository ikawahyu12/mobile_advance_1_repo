import 'package:flutter/material.dart';

// 1. MAIN PAGE (Halaman utama yang menampung Drawer & Bottom Navigation)
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acara 20 - Integration Navigation'),
      ),
      
      // ===== DI SINI DRAWER DIHUBUNGKAN =====
      drawer: DrawerScreen(), 
      
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

// 2. DRAWER WIDGET (Sesuai tampilan gambar modul)
class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
         UserAccountsDrawerHeader(
          accountName: Text("Belajar Flutter"),
          accountEmail: Text("hallo@belajarflutter.com"),

          // Foto Profil Utama dari Lokal Asset
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/images/groot.jpg'),
          ),

          // Foto Akun Lainnya dari Lokal Asset
          otherAccountsPictures: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/icebear.jpg'),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/patrick.jpg'),
            ),
          ],
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('My File'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Shared with me'),
            selected: true, // Sorotan item terpilih
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Recent'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Trash'),
            onTap: () {},
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            child: Text(
              'Labels',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.label),
            title: Text('Family'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// 3. TAMPILAN HALAMAN (Tab Content)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tampilan Halaman Utama', style: TextStyle(fontSize: 18)),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tampilan Halaman Search', style: TextStyle(fontSize: 18)),
    );
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tampilan Halaman Akun', style: TextStyle(fontSize: 18)),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tentang Aplikasi')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Kembali'),
        ),
      ),
    );
  }
}