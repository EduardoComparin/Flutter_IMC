import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_imc/util/formater_height.dart';


class FildHeigth extends StatelessWidget {
  const FildHeigth({
    super.key,
    required this.icon,
    required this.controller,
    required this.textColor,
    required this.corBorder,
    required this.corIcone,
    required this.hint,
    required this.textSufix,
  });

  final IconData icon;
  final TextEditingController controller;
  final Color? textColor;
  final Color corBorder;
  final Color corIcone;
  final String hint;
  final String textSufix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(4),
        FilteringTextInputFormatter.digitsOnly,
        HeightPtBrInputFormatter()
      ],
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
          ),
          suffix: Text(textSufix)),
    );
  }
}