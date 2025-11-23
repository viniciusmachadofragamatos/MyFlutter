import 'package:flutter/material.dart';
import 'package:meu_app/repositories/lingugagens_repository.dart';
import 'package:meu_app/repositories/nivel_repository.dart';
import 'package:meu_app/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  var lingugagensRepository = LingugagensRepository();
  var nivelRepository = NivelRepository();

  bool salvando = false;
  int tempoExperiencia = 0;
  double salarioEscolhido = 0;
  List<String> linguagemSelecionadas = [];
  String nivelSelecionado = "";
  List<String> linguaguens = [];
  List<String> niveis = [];

  DateTime? dataNascimento;

  @override
  void initState() {
    super.initState();
    niveis = nivelRepository.returnaNiveis();
    linguaguens = lingugagensRepository.retornaLinguagem();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for(var i = 0 ; i < quantidadeMaxima; i++){
      itens.add(DropdownMenuItem(
                  child: Text(i.toString()),
                  value: i),
                );
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Dados"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando ? const Center(child: CircularProgressIndicator()) : ListView(
          children: [
            const TextLabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),
            SizedBox(height: 20),

            const TextLabel(texto: "Data de Nascimento"),
            TextField(
              readOnly: true,
              controller: dataNascimentoController,
              onTap: () async {
                var data = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900, 1, 1),
                  lastDate: DateTime(2025, 12, 31),
                );
                if (data != null) {
                  dataNascimentoController.text = data.toString();
                  dataNascimento = data;
                }
              },
            ),

            const SizedBox(height: 20),

            const TextLabel(texto: "Nível de Experiência"),

            Column(
              children: niveis.map((nivel) {
                return RadioListTile(
                  dense: true,
                  title: Text(nivel.toString()),
                  selected: nivelSelecionado == nivel,
                  value: nivel.toString(),
                  groupValue: nivelSelecionado,
                  onChanged: (value) {
                    setState(() {
                      nivelSelecionado = value.toString();
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            const TextLabel(texto: "Linguagens preferidas"),
            Column(
              children: linguaguens.map((linguagem) {
                return CheckboxListTile(
                  dense: true,
                  title: Text(linguagem),
                  value: linguagemSelecionadas.contains(linguagem),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        linguagemSelecionadas.add(linguagem);
                      } else {
                        linguagemSelecionadas.remove(linguagem);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const TextLabel(texto: "Tempo de Experiência"),
            DropdownButton(
              value: tempoExperiencia,
              isExpanded: true,  
              items: returnItens(20),
             onChanged: (value){ setState(() {
               tempoExperiencia = int.parse(value.toString());
              });}
            ),

            TextLabel(texto: "Pretensão salarial. R\$ ${salarioEscolhido.round().toString()}"),
            SizedBox(height: 20),

            Slider(min: 0, max: 10000, value:salarioEscolhido, onChanged: (double value) {
              setState(() {
                salarioEscolhido = value;
              });
            }),
            TextButton(
              onPressed: () {
                setState(() {
                  salvando = true;
                });
                if(nomeController.text.trim().length < 3) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("o nome deve ser preenchido")));
                  return;
                }
                if(dataNascimento == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Data de nascimento inválida")));
                  return;
                }
                if(nivelSelecionado.trim() == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("O nivel deve ser selecionado")));
                  return;
                }
                if(linguagemSelecionadas.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("deve ser selecionada ao menos uma linguagem")));
                  return;
                }
                if(salarioEscolhido == 0 ) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("A pretenção salarial deve ser maior que zero")));
                  return;
                }
                Future.delayed(Duration(seconds: 3), () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("salvo com sucesso!")));
                  setState(() {
                   salvando = false;
                Navigator.pop(context);
                  });
                });
              },
              child: Text("Salvar"),
            )
          ],
        ),
      ),
    );
  }
}