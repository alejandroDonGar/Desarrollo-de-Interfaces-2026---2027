import 'package:flutter/material.dart';
import 'package:crear_componente_reutilizable/widgets/tarjeta_evento.dart';

class PantallaEventos extends StatelessWidget { //* Pregunta 2
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Próximos eventos')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TarjetaEvento(titulo: "Taller de flutter", fecha: "24 de octubre", plazasDisponibles: 15), //* Pregunta 3
            TarjetaEvento(titulo: "Introducción a Git", fecha: "30 de octubre", plazasDisponibles: 8), //* Pregunta 3
            TarjetaEvento(titulo: "Charla de ciberseguridad", fecha: "5 de noviembre") ,                //* Pregunta 3
            TarjetaEvento(titulo: "Diseño de interfaces", fecha: "12 de noviembre", plazasDisponibles: 20), //* Pregunta 4
          ],
        ),
      ),
    );
  }
}