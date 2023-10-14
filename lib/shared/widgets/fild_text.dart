import 'package:flutter/material.dart';

class FildText extends StatelessWidget {
  const FildText(
      {super.key,
      required this.icon,
      required this.nomeController,
      required this.textColor,
      required this.corBorder,
      required this.corIcone,
      required this.hint});

   final IconData icon;
  final TextEditingController nomeController;
  final Color? textColor;
  final Color corBorder;
  final Color corIcone;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: nomeController,
      style: TextStyle(color: textColor, fontSize: 18),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 0),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: corBorder)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: corBorder)),
          hintText: hint,
          hintStyle: TextStyle(color: textColor),
          prefixIcon: Icon(
            icon,
            color: corIcone,
            size: 30,
          )),
    );
  }
}