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
