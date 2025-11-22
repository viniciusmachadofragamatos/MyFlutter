import 'package:flutter/material.dart';
import 'package:meu_app/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController senhaController = TextEditingController(text: ""); 
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 238, 235),
          body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 5,
                      child: Image.asset('assets/images/logo.jpeg'),
                    ),
                    Expanded(child: Container())
                  ],
                ),
                SizedBox(height: 20),
                const Text(
                  "Já tem cadastro?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10),
                const Text("Faça seu login e make the change_",
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: emailController,
                    onChanged: (value){
                      debugPrint(value);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      enabledBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.cyan
                        )
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.cyan),
                      prefixIcon: Icon(Icons.person, color: Colors.cyan,),
                    ),
                  )
                  ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: senhaController,
                    obscureText: isObscureText,
                    onChanged: (value){
                      debugPrint(emailController.text);
                      debugPrint(senhaController.text);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      enabledBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.cyan
                        )
                      ),
                      hintText: "Senha",
                      hintStyle: TextStyle(color: Colors.cyan),
                      prefixIcon: Icon(Icons.lock, color: Colors.cyan),
                      suffixIcon:
                          InkWell(
                            onTap: (){
                              setState(() {   
                              isObscureText = !isObscureText;
                            });
                          },
                        child : Icon(
                          isObscureText ? Icons.visibility_off : Icons.visibility,
                           color: Colors.cyan,
                           )
                           ),
                    ),
                  )
                
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            if(emailController.text.trim() == "email@email.com" && senhaController.text.trim() == "123"){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Erro ao efetuar o Login"))
                              );
                              //debugPrint("Erro ao efetuar o Login");
                            }
                            //debugPrint(emailController.text);
                            //debugPrint(senhaController.text);
                          },
                          style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 24, 165, 207))),
                          child: Text(
                            "ENTRAR",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ))),
                ),
                Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    "Esqueci minha senha",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 24, 165, 207),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 24, 165, 207),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
          ),
      ),
    );
  }
}
