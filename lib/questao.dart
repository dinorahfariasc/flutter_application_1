import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  const Questao(this.texto); // constructor
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //  valor maximo do double
      margin: EdgeInsets.all(20),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
