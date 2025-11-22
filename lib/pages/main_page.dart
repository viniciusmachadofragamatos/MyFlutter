import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Main Page")),
        drawer: Drawer(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    InkWell(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          child: Text("Dados cadastrais")),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          child: Text("Termos de uso e privacidade")),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          child: Text("Configurações")),
                      onTap: () {},
                    ),
                  ],
                ))),
      ),
    );
  }
}
