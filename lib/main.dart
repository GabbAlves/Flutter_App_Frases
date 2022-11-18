import 'package:flutter/material.dart';

import 'dart:math';
//App de frases randomicas

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
//stateless = contante
//statefull variavel
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "Que a Força esteja com você!",
    "Seus olhos podem te enganar, não confie neles",
    "Sem dúvidas, maravilhosa a mente de uma criança é",
    "Seu foco determina sua realidade.",
    "Não, eu sou seu pai.",
  ];
  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
   //Scaffold = esqueleto do app
    return Scaffold(
      appBar: AppBar(
        title: Text('Frases do Yoda',
          style: TextStyle(
            color: Colors.black
          ),),
        //Hex color no Flutter, troca o "#" por "0xff" e a cor
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(17),
          //criar uma borda no body, na parte central do display
          width: double.infinity,
          decoration:
              BoxDecoration(border: Border.all(width: 2, color: Colors.deepPurpleAccent)),
          child: Column(
            //classe filho para abrigar duas classes,
            //clasimagede logo e text para clicar e gerar frases.
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // colocar a image no pubsec.yaml tbm
              Image.asset('images/babyyoda.png'),
              Text(_fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              TextButton(onPressed: _gerarFrase,
                  child: Text("Nova frase",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    backgroundColor: Colors.deepPurple,
                    fontWeight: FontWeight.bold
                  ),

              )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Text(" "),
      ),
    );
  }
}
