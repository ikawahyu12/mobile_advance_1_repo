import 'package:flutter/material.dart';
import 'api_service.dart';
import 'mahasiswa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acara 41',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MahasiswaPage(),
    );
  }
}

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({super.key});

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  final ApiService apiService = ApiService();

  late Future<List<Mahasiswa>> mahasiswaFuture;

  @override
  void initState() {
    super.initState();
    mahasiswaFuture = apiService.getMahasiswa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
      ),
      body: FutureBuilder<List<Mahasiswa>>(
        future: mahasiswaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          final mahasiswa = snapshot.data ?? [];

          if (mahasiswa.isEmpty) {
            return const Center(
              child: Text('Data mahasiswa kosong'),
            );
          }

          return ListView.builder(
            itemCount: mahasiswa.length,
            itemBuilder: (context, index) {
              final item = mahasiswa[index];

              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(item.id.toString()),
                  ),
                  title: Text(item.nama),
                  subtitle: Text(
                    '${item.nim}\n${item.prodi}',
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}