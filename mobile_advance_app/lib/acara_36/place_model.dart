class Place {
  final String name;
  final String displayName;
  final String lat;
  final String lon;
  final String type;

  Place({
    required this.name,
    required this.displayName,
    required this.lat,
    required this.lon,
    required this.type,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'] ?? 'Tidak ada nama',
      displayName: json['display_name'] ?? '',
      lat: json['lat'] ?? '0',
      lon: json['lon'] ?? '0',
      type: json['type'] ?? '',
    );
  }
}