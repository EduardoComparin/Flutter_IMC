// ignore_for_file: unnecessary_getters_setters

class ImcModel {
  int _id;
  double _peso;
  double _altura;
  String _nome;
  double _indice;
  String _resultado;

  ImcModel(
    this._id,
    this._peso,
    this._altura,
    this._nome,
    this._indice,
    this._resultado,
  );

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  double get peso => _peso;

  set peso(double value) {
    _peso = value;
  }

  double get altura => _altura;

  set altura(double value) {
    _altura = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  double get indice => _indice;

  set indice(double value) {
    _indice = value;
  }

  String get resultado => _resultado;

  set resultado(String value) {
    _resultado = value;
  }


}
