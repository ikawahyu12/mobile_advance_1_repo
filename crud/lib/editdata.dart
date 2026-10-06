import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  const EditData({
    super.key,
    required this.list,
    required this.index,
  });

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerNis;
  late TextEditingController controllerNama;
  late TextEditingController controllerKelas;
  late TextEditingController controllerJurusan;

  Future<void> editData() async {
    var url = Uri.parse(
      'http://192.168.1.3:8080/api/siswa/'
      '${widget.list[widget.index]['id']}',
    );

    try {
      final response = await http.put(
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

      print('PUT status: ${response.statusCode}');
      print('PUT body: ${response.body}');

      if (response.statusCode == 200) {
        if (mounted) {
          Navigator.pop(context);
        }
      } else {
        print('Gagal mengubah data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    controllerNis = TextEditingController(
      text: widget.list[widget.index]['nis'].toString(),
    );

    controllerNama = TextEditingController(
      text: widget.list[widget.index]['nama'].toString(),
    );

    controllerKelas = TextEditingController(
      text: widget.list[widget.index]['kelas'].toString(),
    );

    controllerJurusan = TextEditingController(
      text: widget.list[widget.index]['jurusan'].toString(),
    );
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
        title: const Text('EDIT DATA'),
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
              onPressed: editData,
              child: const Text('EDIT DATA'),
            ),
          ],
        ),
      ),
    );
  }
}