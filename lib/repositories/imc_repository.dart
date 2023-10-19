import 'package:flutter_imc/model/imc_model.dart';
import 'package:flutter_imc/service/sqlitedatabase.dart';

class ImcRepository {
  Future<List<ImcModel>> get() async {
    
    List<ImcModel> imc = [];
    
    var db = await SQLiteDataBase().obterDataBase();
    
    var result = await db.rawQuery('SELECT * FROM tb_imc');
   
    for (var element in result) {
      imc.add(ImcModel(
        int.parse(element["id"].toString()),
        double.parse(element["peso"].toString()),
        double.parse(element["altura"].toString()),
        element["nome"].toString(),
        double.parse(element["indice"].toString()),
        element["resultado"].toString(),
      ));
    }
    return imc;
  }

  Future<void> save(ImcModel imcModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    
    await db.rawInsert(
        'INSERT INTO tb_imc (peso,altura,nome,indice,resultado) values(?,?,?,?,?)',
        [
          imcModel.peso.toStringAsFixed(2),
          imcModel.altura.toStringAsFixed(2),
          imcModel.nome.toString(),
          imcModel.indice.toStringAsFixed(2),
          imcModel.resultado.toString(),
        ]);
  }

  Future<void> update(ImcModel imcModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    
    await db.rawInsert(
        'UPDATE tb_imc SET peso = ?,altura  = ?,nome  = ?,indice  = ?,resultado  = ? WHERE id = ?',
        [
          imcModel.peso.toStringAsFixed(2),
          imcModel.altura.toStringAsFixed(2),
          imcModel.nome.toString(),
          imcModel.indice.toStringAsFixed(2),
          imcModel.resultado.toString(),
          imcModel.id,
        ]);
  }

  Future<void> delete(int id) async {
    var db = await SQLiteDataBase().obterDataBase();
   
    await db.rawInsert('DELETE FROM tb_imc WHERE id = ?', [id]);
  }
}
