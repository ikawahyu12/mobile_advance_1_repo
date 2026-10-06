import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './editdata.dart';
import './main.dart';

class Detail extends StatefulWidget {
  final List list;
  final int index;

  const Detail({
    super.key,
    required this.list,
    required this.index,
  });

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Future<void> deleteData() async {
    final url = Uri.parse(
      'http://192.168.1.3:8080/api/siswa/'
      '${widget.list[widget.index]['id']}',
    );

    try {
      final response = await http.delete(
        url,
        headers: {
          'Accept': 'application/json',
        },
      );

      print('DELETE status: ${response.statusCode}');
      print('DELETE body: ${response.body}');

      if (response.statusCode == 200) {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        }
      } else {
        print('Gagal menghapus data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void confirm() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "Apakah kamu yakin ingin menghapus "
            "'${widget.list[widget.index]['nama']}'?",
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
                deleteData();
              },
              child: const Text(
                'DELETE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'CANCEL',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.list[widget.index]['nama'].toString(),
        ),
      ),
      body: Container(
        height: 350.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),

                Text(
                  widget.list[widget.index]['nama'].toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  'NIS : ${widget.list[widget.index]['nis']}',
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'Kelas : ${widget.list[widget.index]['kelas']}',
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'Jurusan : ${widget.list[widget.index]['jurusan']}',
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditData(
                              list: widget.list,
                              index: widget.index,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'EDIT',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: confirm,
                      child: const Text(
                        'DELETE',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}