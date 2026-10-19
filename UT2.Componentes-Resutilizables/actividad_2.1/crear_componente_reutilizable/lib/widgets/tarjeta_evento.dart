import 'package:flutter/material.dart';

class TarjetaEvento extends StatelessWidget { //* Pregunta 1

  final String titulo;         //* Pregunta 3
  final String fecha;          //* Pregunta 3
  final int plazasDisponibles; //* Pregunta 3

  const TarjetaEvento ({ //* Pregunta 3
    super.key,
    required this.titulo,
    required this.fecha,
    this.plazasDisponibles = 0
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), //* Pregunta 3
            SizedBox(height: 8),
            Text(fecha),                                                              //* Pregunta 3
            Text("Plazas disponibles: $plazasDisponibles"),                           //* Pregunta 3
          ],
        ),
      ),
    );
  }
}