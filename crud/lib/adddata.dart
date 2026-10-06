import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNis = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerKelas = TextEditingController();
  TextEditingController controllerJurusan = TextEditingController();

  Future<void> addData() async {
    var url = Uri.parse(
      'http://192.168.1.3:8080/api/siswa',
    );

    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'nis': controllerNis.text,
          'nama': controllerNama.text,
          'kelas': controllerKelas.text,
          'jurusan': controllerJurusan.text,
        },
      );

      print('POST status: ${response.statusCode}');
      print('POST body: ${response.body}');

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        if (mounted) {
          Navigator.pop(context);
        }
      } else {
        print('Gagal menambahkan data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    controllerNis.dispose();
    controllerNama.dispose();
    controllerKelas.dispose();
    controllerJurusan.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD DATA'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              controller: controllerNis,
              decoration: const InputDecoration(
                hintText: 'NIS',
                labelText: 'NIS',
              ),
            ),
            TextField(
              controller: controllerNama,
              decoration: const InputDecoration(
                hintText: 'Nama',
                labelText: 'Nama',
              ),
            ),
            TextField(
              controller: controllerKelas,
              decoration: const InputDecoration(
                hintText: 'Kelas',
                labelText: 'Kelas',
              ),
            ),
            TextField(
              controller: controllerJurusan,
              decoration: const InputDecoration(
                hintText: 'Jurusan',
                labelText: 'Jurusan',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addData,
              child: const Text('ADD DATA'),
            ),
          ],
        ),
      ),
    );
  }
}