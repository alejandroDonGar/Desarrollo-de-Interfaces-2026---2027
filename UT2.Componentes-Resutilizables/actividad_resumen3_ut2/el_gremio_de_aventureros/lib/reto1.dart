import 'package:flutter/material.dart';

void main() => runApp(const GremioApp());

class GremioApp extends StatelessWidget {
  const GremioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PantallaLogros());
  }
}

class MedallaLogro extends StatelessWidget {
  final String titulo;
  final Widget icono;
  final Color color;
  final bool bloquedada;

  const MedallaLogro({
    super.key,
    required this.titulo,
    required this.icono,
    this.color = Colors.amber,
    this.bloquedada = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: bloquedada ? Colors.grey.shade300 : color,
          child: bloquedada ? Icon(Icons.lock, size: 36) : icono,
        ),
        SizedBox(height: 4),
        Text(titulo),
      ],
    );
  }
}

class PantallaLogros extends StatelessWidget {
  const PantallaLogros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logros del gremio')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 24,
          runSpacing: 16,
          children: [
            MedallaLogro(
              titulo: "Primer dragón", 
              icono: Icon(Icons.whatshot)
            ),
            MedallaLogro(
              titulo: "Explorador",
              icono: Icon(Icons.explore),
              color: Colors.teal,
            ),
            Stack(
              children: [
                MedallaLogro(
                  titulo: "Leyenda",
                  icono: Icon(Icons.star),
                  bloquedada: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
