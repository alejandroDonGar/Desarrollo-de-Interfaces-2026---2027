import 'package:flutter/material.dart';

class CartelRecogida extends StatelessWidget {
  final String mensaje;

  const CartelRecogida({super.key, this.mensaje = 'Listo para recoger'});

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: const EdgeInsets.all(12),
      child: Text(mensaje),
    ));
  }
}