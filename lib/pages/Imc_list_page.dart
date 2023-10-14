// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_imc/model/imc.dart';
import 'package:flutter_imc/repositories/imc_repository.dart';

class ListImcPage extends StatefulWidget {
  const ListImcPage({Key? key, required this.imc, required this.imcRepository})
      : super(key: key);
  final ImcRepository imcRepository;
  final List<Imc> imc;

  @override
  State<ListImcPage> createState() => _ListImcPageState();
}

class _ListImcPageState extends State<ListImcPage> {
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
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: widget.imc.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var imc = widget.imc[index];
                      return Dismissible(
                         direction: DismissDirection.endToStart,
                        onDismissed: (DismissDirection dismissDirection) async {
                          await widget.imcRepository.remove(imc.id);
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
                        key: Key(imc.id),
                        child: ListTile(
                          isThreeLine: true,
                          title: Text(imc.nome,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w200,
                              )),
                          subtitle: Text(
                              "Altura: ${imc.altura}  Peso: ${imc.peso}\n${imc.resultado}",
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
