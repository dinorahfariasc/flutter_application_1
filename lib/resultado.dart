import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() reiniciarTeste;

  const Resultado(this.nota, this.reiniciarTeste, {Key? key}) : super(key: key);

  String get fraseResultado {
    if (nota < 8) {
      return 'quase nada em comun!';
    } else if (nota < 12) {
      return 'apenas o básico';
    } else if (nota < 16) {
      return 'bestie';
    } else {
      return 'sinergia de milhoes';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: reiniciarTeste,
          child: Text('Reiniciar?'),
        ),
      ],
    );
  }
}
