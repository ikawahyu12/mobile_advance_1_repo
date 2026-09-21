import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> gambar = [
    "loki1.jpg",
    "loki2.jpg",
    "loki3.jpg",
    "loki4.jpg",
    "loki5.jpg",
    "loki6.jpg",
    "loki7.jpg",
    "loki8.jpg",
  ];

  static const Map<String, Color> colors = {
    'loki1': Color(0xFF1E5631),
    'loki2': Color(0xFFC99700),
    'loki3': Color(0xFF14452F),
    'loki4': Color(0xFFD4AF37),
    'loki5': Color(0xFF0B6623),
    'loki6': Color(0xFFAA7C11),
    'loki7': Color(0xFF2E8B57),
    'loki8': Color(0xFF8B6508),
  };

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Color(0xFF0F380F),
              Color(0xFF000000),
              Color(0xFF1E5631),
            ],
          ),
        ),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: gambar.length,
          itemBuilder: (BuildContext context, int i) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 50.0,
              ),
              child: Material(
                elevation: 8.0,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Hero(
                      tag: gambar[i],
                      child: Material(
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Halamandua(
                                gambar: gambar[i],
                                colors: colors.values.elementAt(i),
                              ),
                            ),
                          ),
                          child: Container(
                            color: colors.values.elementAt(i),
                            child: Image.asset(
                              "assets/images/${gambar[i]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Halamandua extends StatefulWidget {
  const Halamandua({
    Key? key,
    required this.gambar,
    required this.colors,
  }) : super(key: key);

  final String gambar;
  final Color colors;

  @override
  State<Halamandua> createState() => _HalamanduaState();
}

class _HalamanduaState extends State<Halamandua> {
  late Color warna;

  @override
  void initState() {
    super.initState();
    warna = widget.colors;
  }

  void _pilihannya(Pilihan pilihan) {
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loki Variant"),
        backgroundColor: const Color(0xFF0F380F),
        actions: <Widget>[
          PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context) {
              return listPilihan.map((Pilihan pilihan) {
                return PopupMenuItem<Pilihan>(
                  value: pilihan,
                  child: Text(pilihan.teks),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                colors: [
                  warna,
                  const Color(0xFF0F380F),
                  const Color(0xFF000000),
                ],
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: widget.gambar,
              child: ClipOval(
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        color: warna,
                        child: Image.asset(
                          "assets/images/${widget.gambar}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Data Model Pilihan Menu Warna
class Pilihan {
  const Pilihan({required this.teks, required this.warna});
  final String teks;
  final Color warna;
}

const List<Pilihan> listPilihan = <Pilihan>[
  Pilihan(teks: "Red", warna: Colors.red),
  Pilihan(teks: "Green", warna: Colors.green),
  Pilihan(teks: "Blue", warna: Colors.blue),
];