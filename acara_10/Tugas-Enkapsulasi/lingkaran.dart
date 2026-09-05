class Lingkaran {
  double _jariJari = 0;

  void setJariJari(double value) {
    if (value < 0) {
      _jariJari = value * -1;
    } else {
      _jariJari = value;
    }
  }

  double get JariJari => _jariJari;

  double get luas => 3.14 * _jariJari * _jariJari;
}