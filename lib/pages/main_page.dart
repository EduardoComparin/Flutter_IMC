import 'package:flutter/material.dart';
import 'package:flutter_imc/pages/Imc_list_page.dart';
import 'package:flutter_imc/pages/imc_page.dart';
import 'package:flutter_imc/repositories/imc_repository.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);

  ImcRepository imcRepository = ImcRepository();

  @override
  void initState() {
    super.initState();
  }

  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  ImcPage(),
                  ListImcPage()
                ],
              ),
            ),
            BottomNavigationBar(
              iconSize: 30,
                backgroundColor: Colors.teal,
                selectedItemColor: Colors.black,
                selectedFontSize: 15,
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                    label: "Calculadora",
                    tooltip: "Calculadora",
                    icon: Icon(Icons.calculate,  color: Colors.black),
                  ),
                  BottomNavigationBarItem(
                    label: "Listagem",
                     tooltip: "Lista de Calculos",
                      icon: Icon(Icons.list,  color: Colors.black)),
                ])
          ],
        ),
      ),
    );
  }
}
