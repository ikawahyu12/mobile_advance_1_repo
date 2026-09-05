class Titan {
  int _powerPoint = 0;

  int get powerPoint => _powerPoint;

  set powerPoint(int value) {
    if (value < 5) {
      _powerPoint = 5;
    } else {
      _powerPoint = value;
    }
  }
}