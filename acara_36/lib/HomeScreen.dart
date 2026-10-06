import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),

            // Notification dan Extension
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.extension),
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(
              height: 37,
            ),

            // Welcome
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: "Welcome, \n",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: auth.currentUser?.email ?? "",
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              style: const TextStyle(
                fontSize: 30,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Search
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Search",
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // Recommended Place
            const Text(
              "Recomended Place",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Logout
            Container(
              child: ElevatedButton(
                onPressed: () {
                  _signOut().then((value) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  });
                },
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data contoh sesuai struktur pada materi
final countries = [
  "Tokyo",
  "Berlin",
  "Roma",
  "Monas",
];