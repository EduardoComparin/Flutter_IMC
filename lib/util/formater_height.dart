import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class HeightPtBrInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    var formatter = NumberFormat("#,##", "pt_BR");
    if (newValue.text.length <= 2) {
      formatter = NumberFormat("##,#", "pt_BR");
    }

    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText.replaceAll('.', ','),
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
