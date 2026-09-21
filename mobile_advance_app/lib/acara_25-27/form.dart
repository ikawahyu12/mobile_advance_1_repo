import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: BelajarForm(),
    debugShowCheckedModeBanner: false,
  ));
}

class BelajarForm extends StatefulWidget {
  const BelajarForm({Key? key}) : super(key: key);

  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  // GlobalKey untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Variabel state untuk komponen tambahan Acara 26
  double nilaiSlider = 25.0;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;

  // Controller untuk text field
  final TextEditingController _namaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form II - Checkbox, Switch & Slider"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            // Input Text / TextFormField dengan Validasi
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(
                hintText: "Masukkan Nama Lengkap",
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),

            // CheckboxListTile
            CheckboxListTile(
              title: const Text('Belajar Dasar Flutter'),
              subtitle: const Text('Dart, widget, http'),
              value: nilaiCheckBox,
              activeColor: Colors.deepPurpleAccent,
              onChanged: (bool? value) {
                setState(() {
                  nilaiCheckBox = value!;
                });
              },
            ),
            const Divider(),

            // SwitchListTile
            SwitchListTile(
              title: const Text('Backend Programming'),
              subtitle: const Text('Dart, Nodejs, PHP, Java, dll'),
              value: nilaiSwitch,
              activeTrackColor: Colors.pink[100],
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  nilaiSwitch = value;
                });
              },
            ),
            const Divider(),

            // Slider Widget
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tingkat Kepuasan / Nilai Slider: ${nilaiSlider.toStringAsFixed(0)}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Slider(
                    value: nilaiSlider,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: nilaiSlider.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        nilaiSlider = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // Tombol Submit / Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              onPressed: () {
                // Mengecek validasi form
                if (_formKey.currentState!.validate()) {
                  // Jika valid, tampilkan pesan sukses atau dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Form Berhasil Disubmit!\nNama: ${_namaController.text}\nCheckbox: $nilaiCheckBox\nSwitch: $nilaiSwitch\nSlider: ${nilaiSlider.toStringAsFixed(0)}',
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}