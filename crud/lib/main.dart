import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';
import 'adddata.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD Siswa',
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    final response = await http.get(
      Uri.parse(
        'http://192.168.1.3:8080/api/siswa',
      ),
      headers: {
        'Accept': 'application/json',
      },
    );

    print('GET status: ${response.statusCode}');
    print('GET body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      return responseData['data'];
    } else {
      throw Exception('Gagal mengambil data siswa');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Siswa'),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => 
              const AddData(),
            ),
          );
        },
      ),

      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.connectionState == 
          ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return ItemList(
              list: snapshot.requireData,
            );
          }

          return const Center(
            child: Text('Tidak ada data siswa'),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  const ItemList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),

          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Detail(
                    list: list,
                    index: i,
                  ),
                ),
              );
            },

            child: Card(
              child: ListTile(
                title: Text(
                  list[i]['nama'].toString(),
                ),

                leading: const Icon(
                  Icons.person,
                ),

                subtitle: Text(
                  'NIS : ${list[i]['nis']}\n'
                  'Kelas : ${list[i]['kelas']}\n'
                  'Jurusan : ${list[i]['jurusan']}',
                ),

                isThreeLine: true,

                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}