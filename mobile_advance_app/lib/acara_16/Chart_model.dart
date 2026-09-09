class ChartModel {
  final String name;
  final String message;
  final String time;
  final String profileUrl;

  ChartModel({
    required this.name,
    required this.message,
    required this.time,
    required this.profileUrl,
  });
}

final List<ChartModel> items = [
  ChartModel(
    name: 'Hilmy',
    message: 'Hello Hilmy',
    time: '12.00',
    profileUrl: 'assets/images/groot.jpg', // Bisa pakai asset lokal atau URL network
  ),
  ChartModel(
    name: 'Riska',
    message: 'hello riska',
    time: '9 march',
    profileUrl: 'assets/images/groot.jpg',
  ),
  ChartModel(
    name: 'Vita',
    message: 'hello vita',
    time: '10 march',
    profileUrl: 'assets/images/groot.jpg',
  ),
  ChartModel(
    name: 'Niva',
    message: 'hello niva',
    time: '12.21',
    profileUrl: 'assets/images/groot.jpg',
  ),
  ChartModel(
    name: 'Citra',
    message: 'hello citra',
    time: '13.41',
    profileUrl: 'assets/images/groot.jpg',
  ),
  ChartModel(
    name: 'Adi',
    message: 'hello adi',
    time: '25 january',
    profileUrl: 'assets/images/groot.jpg',
  ),
  ChartModel(
    name: 'Ashraf',
    message: 'hello ashraf',
    time: '19.00',
    profileUrl: 'assets/images/groot.jpg',
  ),
];