import 'package:flutter/material.dart';

class TarjetaAviso extends StatelessWidget { // Paso 1

  final String mensaje; // Paso 2
  final IconData icono; // Paso 2
  final Color color;    // Paso 2

  const TarjetaAviso({ // Paso 2 - Esta forma de hacer el constructor se llama por 'parametro nombreado'
    super.key,
    required this.mensaje,
    required this.icono,
    this.color = Colors.blue // Si no es 'required' se inicializa aquí
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono, color: color,), // Paso 2
            const SizedBox(width: 12), 
            Text(mensaje),              // Paso 2
          ],
        ),
      ),
    );
  }
}
