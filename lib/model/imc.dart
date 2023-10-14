// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

class Imc {
 String _id = UniqueKey().toString();
  double _peso;
  double _altura;
  String _nome;
  String _indice = '';
  String _resultado = '';

  Imc(this._peso, this._altura, this._nome);

  String get id => _id;
  
  set id(String value) {
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
  
  String get indice => _indice;
  
  set indice(String value) {
    _indice = value;
  }
  
  String get resultado => _resultado;
  
  set resultado(String value) {
    _resultado = value;
  }

  double calcularIMC() {
    return _peso / (_altura * _altura);
  }

  String tipoImc(double imc) {
    String msg = "";
      if (imc < 16) {
        msg = 'Magreza grave';
      } else if (imc < 17) {
        msg = 'Magreza moderada';
      } else if (imc < 18.5) {
        msg = 'Magreza leve';
      } else if (imc < 25) {
        msg = 'Saudável';
      } else if (imc < 30) {
        msg = 'Sobrepeso';
      } else if (imc < 35) {
        msg = 'Obesidade – Grau I';
      } else if (imc < 40) {
        msg = 'Obesidade – Grau II (Severa)';
      } else {
        msg = 'Obesidade – Grau III (Mórbida)';
      }
      String valorImc = imc.toStringAsFixed(2);
      return "Seu indice é de $valorImc definido como $msg ";
    }

    
  

}
