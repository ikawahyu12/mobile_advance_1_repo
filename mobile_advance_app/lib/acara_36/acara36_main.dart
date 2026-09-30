import 'package:flutter/material.dart';
import 'api_service.dart';
import 'place_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest API Nominatim',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController =
      TextEditingController(text: 'Alun-Alun Nganjuk');
  List<Place> _places = [];
  bool _isLoading = false;
  String _errorMessage = '';

  void _performSearch() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final results = await ApiService.searchPlace(_searchController.text);
      setState(() {
        _places = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _performSearch(); // Jalankan pencarian awal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Rest API (Acara 34)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      labelText: 'Cari Lokasi',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _performSearch,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _isLoading
                ? const CircularProgressIndicator()
                : _errorMessage.isNotEmpty
                    ? Text(_errorMessage, style: const TextStyle(color: Colors.red))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _places.length,
                          itemBuilder: (context, index) {
                            final place = _places[index];
                            return Card(
                              elevation: 2,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: ListTile(
                                leading: const Icon(Icons.location_on,
                                    color: Colors.red),
                                title: Text(place.name.isEmpty
                                    ? place.displayName
                                    : place.name),
                                subtitle: Text(
                                  '${place.displayName}\nLat: ${place.lat}, Lon: ${place.lon}',
                                ),
                                isThreeLine: true,
                              ),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}