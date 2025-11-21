import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 223, 219, 219),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100
                ),
                const Icon(Icons.person, size: 150,color: Color.fromARGB(255, 13, 153, 196),),
                SizedBox(
                height: 50
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  //color: Colors.green,
                  height: 30,
                  alignment: Alignment.center,
                  child: Row(
                    
                    children: [
                      Expanded(flex: 2, child: Text("Informe seu email:")),
                      SizedBox(width: 20),
                      Expanded(flex: 3,child: Text("Email")),
                    ],
                  ),
                ),
                SizedBox(
                height: 10
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  //color: Colors.green,
                  height: 30,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(flex:2,child: Text("Informe Sua Senha:")),
                      SizedBox(width: 20,),
                      Expanded(flex:3,child: Text("Senha")),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  color: Colors.green,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text("Login"),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  height: 30,
                  alignment: Alignment.center,
                  child: Text("Cadastrar"),
                ),SizedBox(
                height: 20
                ),

            ],
          ),
        ),
      ),
    );
  }
}