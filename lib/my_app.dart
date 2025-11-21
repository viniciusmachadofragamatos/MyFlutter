import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_app/pages/home_page.dart';
import 'package:meu_app/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark, // cor dos ícones da barra de status
          elevation: 4, // pequena sombra pra destacar
          centerTitle: true, // título centralizado
        ),
      ),
      home: const LoginPage(),
    );
  }
}

