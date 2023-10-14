import 'package:flutter/material.dart';
import 'package:flutter_imc/pages/main_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ImcApp extends StatelessWidget {
  const ImcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal, textTheme: GoogleFonts.akayaKanadakaTextTheme()),
      home: const MainPage(),
    );
  }
}
