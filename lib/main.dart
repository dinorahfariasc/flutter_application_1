import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './questao.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState
    extends State<PerguntaApp> // estado que gerencia as atulizacao do app
// a arvore de componentes pra ser exibida prescisa do estado
// qual quer mudança que queremos imediato prescisamos usar o setState(){}
{
  var perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      perguntaSelecionada++;
    });

    print('respondido');
  }

  // teste
  final List<String> perguntas = [
    'qual é a sua cor favorita',
    'qual é o seu animal favorito',
    'teste1',
    'teste2'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[perguntaSelecionada]),
            TextButton(
                onPressed:
                    _responder, // tanto podemos usar uma funcao ja definida
                child: Text('resposta 1')),
            TextButton(
                onPressed: () {
                  _responder();
                  print('resposta 2'); // como uma funcao anonima
                },
                child: Text('resposta 2')),
            TextButton(onPressed: _responder, child: Text('resposta 3')),
          ],
        ),
      ),
    );
  }
}
