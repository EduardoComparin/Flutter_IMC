// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVE_NOME,
  CHAVE_ALTURA,
}

class StorageService {
  Future<void> setConfiguracaoAltura(double value) async {
    await _setDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString(), value);
  }

  Future<double> getConfiguracaoAltura() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString());
  }

  Future<void> setConfiguracaoNome(String nome) async {
    await _setString(STORAGE_CHAVES.CHAVE_NOME.toString(), nome);
  }

  Future<String> getConfiguracaoNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_NOME.toString());
  }

  Future<void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  /*Future<void> _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

    Future<void> _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }

  Future<void> _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }
  */
}
