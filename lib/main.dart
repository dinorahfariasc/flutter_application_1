import 'package:flutter/material.dart';
import 'package:flutter_application_1/resultado.dart';
import './resultado.dart';
import './questionario.dart';

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

  var _notaFinal = 0;
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'gato', 'nota': 5},
        {'texto': 'cachorro', 'nota': 3},
        {'texto': 'rato', 'nota': 10},
        {'texto': 'jacaré', 'nota': 1},
      ],
    },
    {
      'texto': "qual é o grupo favorito?",
      'respostas': [
        {'texto': 'idle', 'nota': 3},
        {'texto': 'black pink', 'nota': 1},
        {'texto': 'loona', 'nota': 5},
        {'texto': 'red velvet', 'nota': 10},
      ]
    },
    {
      'texto': 'qual é a sua utt?',
      'respostas': [
        {'texto': 'jisoo', 'nota': 5},
        {'texto': 'sinb', 'nota': 1},
        {'texto': 'seulgi', 'nota': 10},
        {'texto': 'gaeul', 'nota': 3},
      ]
    },
  ];

  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _notaFinal += nota;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarTeste() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaFinal = 0;
    });
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
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('teste de afinidade'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_notaFinal, _reiniciarTeste),
      ),
    );
  }
}
