import 'package:flutter/material.dart';
import 'package:flutter_imc/service/storage_service.dart';
import 'package:flutter_imc/shared/widgets/fild_heigth.dart';
import 'package:flutter_imc/shared/widgets/fild_text.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  StorageService storage = StorageService();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;

  @override
  void initState() {
    super.initState();
    carregarDadosConfig();
  }

  carregarDadosConfig() async {
    double altura = await (storage.getConfiguracaoAltura());
    String nome = await storage.getConfiguracaoNome();

    if (altura > 0) {
      alturaController.text = altura.toString().replaceAll(".", ",");
    }

    if (nome != "") {
      nomeUsuarioController.text = nome;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Configurações",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            )),
       
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      height: 30,
                      alignment: Alignment.center,
                      child: FildText(
                          icon: Icons.person_3_rounded,
                          nomeController: nomeUsuarioController,
                          textColor: Colors.black,
                          corBorder: Colors.black,
                          corIcone: Colors.black,
                          hint: "Nome"),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      height: 30,
                      alignment: Alignment.center,
                      child: FildHeigth(
                          icon: Icons.swap_vert,
                          controller: alturaController,
                          textColor: Colors.black,
                          corBorder: Colors.black,
                          corIcone: Colors.black,
                          hint: "Altura",
                          textSufix: "M"),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();

                        double altura = validaAltura();

                        if (altura > 0) {
                          await storage.setConfiguracaoAltura(altura);
                        }

                        await storage
                            .setConfiguracaoNome(nomeUsuarioController.text);

                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal)),
                      child: const Text(
                        "Salvar",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double validaAltura() {
    String alturaText =
        alturaController.text == '' ? '0,00' : alturaController.text;

    double altura =
        double.parse(alturaText.replaceAll('.', '').replaceAll(',', '.'));
    return altura;
  }
}
