import 'package:flutter/material.dart';

void main() => runApp(const FestivalApp());

class FestivalApp extends StatelessWidget {
  const FestivalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PantallaCartel());
  }
}


class PantallaCartel extends StatelessWidget {
  const PantallaCartel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Festival Sonora')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TarjetaArtista(nombre: "Luna Norte", escenario: "Mar", hora: "22:30", destacado: true),
          TarjetaArtista(nombre: "Los Alisios", escenario: "Volcán", hora: "20:00"),
          TarjetaArtista(nombre: "Dúo Malpaís", escenario: "Mar")
        ],
      ),
    );
  }
}

class TarjetaArtista extends StatelessWidget {
  final String nombre;
  final String escenario;
  final String hora;
  final bool destacado;

  const TarjetaArtista({
    super.key,
    required this.nombre,
    required this.escenario,
    this.hora = "Hora por confirmar",
    this.destacado = false
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: destacado ? Colors.amber.shade100 : null,
      child: ListTile(
        leading: Icon(destacado ? Icons.star : Icons.music_note),
        title: Text(nombre),
        subtitle: Text('Escenario $escenario - $hora'),
      ),
    );
  }
}

//* Codigo Original:
/*
import 'package:flutter/material.dart';

void main() => runApp(const FestivalApp());

class FestivalApp extends StatelessWidget {
  const FestivalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PantallaCartel());
  }
}

class PantallaCartel extends StatelessWidget {
  const PantallaCartel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Festival Sonora')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.amber.shade100,
            child: const ListTile(
              leading: Icon(Icons.star),
              title: Text('Luna Norte'),
              subtitle: Text('Escenario Mar · 22:30'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Los Alisios'),
              subtitle: Text('Escenario Volcán · 20:00'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Dúo Malpaís'),
              subtitle: Text('Escenario Mar · Hora por confirmar'),
            ),
          ),
        ],
      ),
    );
  }
}
*/