class ImcUtil {
  static double calcularIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  static String tipoImc(double imc) {
    String msg = "";
    if (imc < 16) {
      msg = 'Magreza grave';
    } else if (imc < 17) {
      msg = 'Magreza moderada';
    } else if (imc < 18.5) {
      msg = 'Magreza leve';
    } else if (imc < 25) {
      msg = 'Saudável';
    } else if (imc < 30) {
      msg = 'Sobrepeso';
    } else if (imc < 35) {
      msg = 'Obesidade – Grau I';
    } else if (imc < 40) {
      msg = 'Obesidade – Grau II (Severa)';
    } else {
      msg = 'Obesidade – Grau III (Mórbida)';
    }
    String valorImc = imc.toStringAsFixed(2);
    return "Seu indice é de $valorImc definido como $msg ";
  }

  static String pesoIdeal(double altura) {
    return (21 * (altura * altura)).toStringAsFixed(2);
  }
  
}
