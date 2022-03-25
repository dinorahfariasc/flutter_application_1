import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/resultado.dart';
import './resultado.dart';
import 'questionario.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  // estado que gerencia as atulizacao do app
  // a arvore de componentes pra ser exibida prescisa do estado
  // qual quer mudança que queremos imediato prescisamos usar o setState(){}
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'qual é o seu animal favorito?',
      'respostas': ['gato', 'cachorro', 'rato', 'jacaré'],
    },
    {
      'texto': "qual é o grupo favorito?",
      'respostas': ['idle', 'black pink', 'loona', 'red velvet']
    },
    {
      'texto': 'qual é a sua utt?',
      'respostas': ['minnie', 'lisa', 'seulgi', 'yujin']
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

// abordagem mais interativa
  //List<Widget> respostas = [];
  //for (String textResp in perguntas[_perguntaSelecionada]['respostas']) {
  //  respostas.add(Resposta(textResp, _responder));
  //}

// abordagem mais declarativa
  //List<String> respostas = temPerguntaSelecionada
  //    ? perguntas[_perguntaSelecionada]['respostas']
  //    : [];
  // se nao conseguir o indice da pergunta selecionada retorna nulo
  //List<Widget> widgets =
  //    respostas.map((t) => Resposta(t, _responder)).toList();
  // pega somente o texto do nosso map, instaciamos esse texto com a classe
  // Resposta e passamos para uma lista, assim temos uma lista de widgets do
  // tipo Resposta que sao os botoes com as opcoes

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text('Perguntas'),
              ),
              body: temPerguntaSelecionada
                  ? Questionario(
                      perguntas: _perguntas,
                      perguntaSelecionada: _perguntaSelecionada,
                      quandoResponder: _responder)
                  : const Resultado()),
        ),
      ],
    );
  }
}
