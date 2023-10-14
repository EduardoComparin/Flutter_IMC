import 'package:flutter_imc/model/imc.dart';

class ImcRepository {
  final List<Imc> _imc = [];

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 50));
    _imc.remove(_imc.where((imc) => imc.id == id).first);
  }

   Future<void> insert(Imc imc) async {
    await Future.delayed(const Duration(milliseconds: 50));
    _imc.add(imc);
  }

  Future<List<Imc>> getList() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return _imc;
  }

}
