import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  const Questao(this.texto); // constructor
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Text(texto);
  }
}
