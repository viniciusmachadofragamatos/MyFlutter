import 'package:flutter/material.dart';

import '../../pages/dados_cadastrais.dart' show DadosCadastraisPage;

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(),
                      currentAccountPicture: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 63, 148, 187),
                          child: Image.asset('assets/images/logo.jpeg')),
                      accountName: Text("Vinicius Machado", style: TextStyle(color: Colors.black),),
                      accountEmail: Text("email@email.com", style: TextStyle(color: Colors.black))),
                      onTap: () {
                        showModalBottomSheet(context: context, builder: (BuildContext bc){
                          return Column(
                            children: [
                              ListTile(title: Text("Camera"), leading: Icon(Icons.camera),),
                              ListTile(title: Text("Galeria"), leading: Icon(Icons.album),)
                            ],
                          );
                        });
                      },
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Row(children: [
                        const Icon(Icons.person),
                        SizedBox(
                          width: 5,
                        ),
                        const Text("Dados cadastrais")
                      ])),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DadosCadastraisPage()));
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.info),
                          SizedBox(
                            width: 5,
                          ),
                          const Text("Termos de uso e privacidade"),
                        ],
                      )),
                  onTap: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.settings),
                          SizedBox(
                            width: 5,
                          ),
                          const Text("Configurações"),
                        ],
                      )),
                  onTap: () {},
                ),
              ],
            )));
  }
}