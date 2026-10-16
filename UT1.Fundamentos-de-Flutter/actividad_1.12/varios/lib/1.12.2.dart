import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntradaEvento(),
    ),
  );
}

class EntradaEvento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi entrada'),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.confirmation_number),
                SizedBox(height: 12),
                Text('TECH DAY 2026'),
                Text('Tu entrada al futuro'),
                SizedBox(
                  height: 16
                ),
                Image.network(
                  'https://picsum.photos/600/300',
                ),
                SizedBox(
                  height: 16
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    '18 de noviembre · 10:00 h',
                  ),
                ),
                SizedBox(
                  height: 16
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('CONFIRMAR ASISTENCIA'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}