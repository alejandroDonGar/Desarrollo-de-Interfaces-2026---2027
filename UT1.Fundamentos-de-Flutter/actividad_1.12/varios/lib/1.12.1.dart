import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JornadaTecnologica(),
    ),
  );
}

class JornadaTecnologica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jornada tecnológica'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Programa de actividades"
                ),
                Icon(Icons.info_outline),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Image.network(
            "https://picsum.photos/800/300",
            width: 300,
            height: 160,
            fit: BoxFit.cover,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Charlas"),
                    )
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Talleres"),
                    )
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16
            ),
            SizedBox(
              width: 240,
              height: 80,
              child: Card( 
                child: Center(
                  child: Text("Próxima Actividad: 10:30"),
                ),
              ),
            ),
            SizedBox(
              height: 16
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(label: Text("Programación")),
                Chip(label: Text("Robótica")),
                Chip(label: Text("Ciberseguridad")),
                Chip(label: Text("Inteligencia artificial")),
                Chip(label: Text("Videojuegos")),
                Chip(label: Text("Redes")),
              ],
            ),
            SizedBox(
              height: 16
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(top: 8, bottom: 8),
              color: Colors.grey.shade200,
              child: Text("Inscrpcion graturita hasta completar el aforo"),
            ),
            SizedBox(
              height: 16
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {}, 
                  child: Text("Consultar programa")
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {}, 
                  child: Text("Inscribirse")
                ),
              ],
            ),
          ]
        ),
      )
    );
  }
}