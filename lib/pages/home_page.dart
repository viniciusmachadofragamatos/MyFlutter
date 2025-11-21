import 'package:flutter/material.dart';
import 'package:meu_app/services/gerador_numero_aleatorio.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadedecliques = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("Chamando metodo build");
    return SafeArea(
      // evita que a AppBar fique atrás da barra de status
      child: Scaffold(
        extendBodyBehindAppBar:
            false, // garante que o corpo não sobreponha a AppBar
        appBar: AppBar(
          title: Text("Meu app", style: GoogleFonts.acme(fontSize: 40)),
        ),
        body: Container(
          //color: const Color.fromARGB(255, 9, 121, 226),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.purple,
                width: 200,
                height: 200,
                child: Text("Ações do Usuario"),
              ),
              SizedBox(//serve para fixar tamanho
                width: 100,
                height: 100,
                child: Container(
                  color: Colors.orange,
                  child: Text("Foi clicado : $quantidadedecliques Vezes"),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.pink,
                  child: Text("O numero Gerado foi: $numeroGerado "),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.green,
                        child: Text("Nome: "),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.red,
                        child: Text("Vinicius Machado"),
                      ),
                    ),
                    Expanded(
                      child: Container(color: Colors.blue, child: Text("30")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_box),
          onPressed: () {
            setState(() {
              quantidadedecliques += 1;
              numeroGerado = GeradorNumeroAleatorioService.gerarNumeroAleatorio(
                100,
              );
            });
          },
        ),
      ),
    );
  }
}