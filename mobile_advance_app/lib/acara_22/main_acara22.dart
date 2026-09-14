import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
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
    'loki1': Color(0xFF2DB569),
    'loki2': Color(0xFFF386B8),
    'loki3': Color(0xFF45CAF5),
    'loki4': Color(0xFFB19ECB),
    'loki5': Color(0xFFF58E4C),
    'loki6': Color(0xFF46C1BE),
    'loki7': Color(0xFFFFEA0E),
    'loki8': Color(0xFFDBE4E9),
  };

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0; // Memperlambat animasi Hero untuk efek peragaan

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [Colors.white, Colors.purple, Colors.deepPurple],
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
                              "assets/images/${gambar[i]}", // Perbaikan path asset
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

class Halamandua extends StatelessWidget {
  const Halamandua({
    Key? key,
    required this.gambar,
    required this.colors,
  }) : super(key: key);

  final String gambar;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Image"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                colors: [Colors.purple, Colors.white, Colors.deepPurple],
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: gambar,
              child: ClipOval(
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        color: colors,
                        child: Image.asset(
                          "assets/images/$gambar", // Perbaikan: hilangkan [i]
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