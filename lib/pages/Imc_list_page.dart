// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_imc/model/imc_model.dart';
import 'package:flutter_imc/repositories/imc_repository.dart';
import 'package:flutter_imc/util/imc_util.dart';

class ListImcPage extends StatefulWidget {
  const ListImcPage({Key? key}): super(key: key);
 
  @override
  State<ListImcPage> createState() => _ListImcPageState();
}

class _ListImcPageState extends State<ListImcPage> {

  ImcRepository imcRepository = ImcRepository();
  var _imc = const <ImcModel>[];

  @override
  void initState() {
    super.initState();
    obterImc();
  }

  void obterImc() async {
    _imc = await imcRepository.get();
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Lista de calculos",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            )),
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: _imc.length,
                    itemBuilder: (BuildContext context, int index) {
                      var imc = _imc[index];
                      return Dismissible(
                         direction: DismissDirection.endToStart,
                        onDismissed: (DismissDirection dismissDirection) async {
                          await imcRepository.delete(imc.id);
                          obterImc();
                          setState(() {});
                        },
                        background: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          color: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        key: Key(imc.id.toString()),
                        child: ListTile(
                          isThreeLine: true,
                          title: Text(imc.nome,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w200,
                              )),
                          subtitle: Text(
                              "Altura: ${imc.altura}M    Peso: ${imc.peso}Kg    Peso ideal ${ImcUtil.pesoIdeal(imc.altura)}Kg\n${imc.resultado}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              )),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
