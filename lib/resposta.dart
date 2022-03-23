import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelect;

  const Resposta(this.texto, this.onSelect); // const

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue, primary: Colors.white),
          onPressed: onSelect, // tanto podemos usar uma funcao ja definida
          child: Text(texto)),
    );
  }
}
