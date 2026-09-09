import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acara 15 - Core Components',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Acara 15 - Core Component I'),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1. Text Widget
              const Text(
                '1. Text Widget',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ini Text',
                style: TextStyle(
                  color: Colors.blue,
                  backgroundColor: Colors.pinkAccent,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(height: 30, thickness: 1),

              // 2. Icon Widget
              const Text(
                '2. Icon Widget',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_alarm, color: Colors.blue),
                      Text('Alarm'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.phone, color: Colors.green),
                      Text('Phone'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.book, color: Colors.orange),
                      Text('Book'),
                    ],
                  ),
                ],
              ),
              const Divider(height: 30, thickness: 1),

              // 3. Container Widget
              const Text(
                '3. Container Widget',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.purple,
                ),
                child: const Text(
                  'Haiii, ini teks di dalam Container',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              const Divider(height: 30, thickness: 1),

              // 4. Button Widgets
              const Text(
                '4. Button Widgets',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    onPressed: () {},
                    child: const Text("Raised / ElevatedButton"),
                  ),
                  const SizedBox(height: 8),
                  MaterialButton(
                    color: Colors.lime,
                    onPressed: () {},
                    child: const Text("Material Button"),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                    ),
                    onPressed: () {},
                    child: const Text("Flat / TextButton"),
                  ),
                ],
              ),
              const Divider(height: 30, thickness: 1),

              // 5. TextFormField Widget
              const Text(
                '5. TextFormField Widget',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Username",
                        icon: Icon(Icons.person),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Login"),
                    ),
                  ],
                ),
             ), // Form
                ], // Column
              ), // Column
            ), // SingleChildScrollView
          ), // Scaffold
        ); // MaterialApp
      }
    }