import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: PanelSala()),
  );
}

class PanelSala extends StatelessWidget {
const PanelSala({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de control'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CabeceraSala(),
              SizedBox(height: 12),
              ControlTemperatura(),
              SizedBox(height: 8),
              ControlOcupacion(),
              SizedBox(height: 8),
              ControlIluminacion(),
            ],
          ),
        ),
      ),
    );
  }
}

class CabeceraSala extends StatelessWidget {
const CabeceraSala({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(Icons.meeting_room, size: 40, color: Colors.blueGrey),
        SizedBox(
          height: 4
        ),
        Text(
          'SALA DE REUNIONES',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text('Planta 2', style: TextStyle(fontSize: 13)),
      ],
    );
  }
}

class ControlTemperatura extends StatelessWidget {
const ControlTemperatura({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text(
              'TEMPERATURA',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6
            ),
            Text('23 °C', style: const TextStyle(fontSize: 23)),
            const SizedBox(
              height: 6
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 8
                ),
                ElevatedButton(
                  onPressed: () {}, 
                  child: const Icon(Icons.add)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ControlOcupacion extends StatelessWidget {
const ControlOcupacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text(
              'PERSONAS EN LA SALA',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6
            ),
            Text('12 personas', style: const TextStyle(fontSize: 23)),
            const SizedBox(
              height: 6
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {}, 
                  child: const Text('Salida')
                ),
                const SizedBox(
                  width: 8
                ),
                ElevatedButton(
                  onPressed: () {}, 
                  child: const Text('Entrada')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ControlIluminacion extends StatelessWidget {
const ControlIluminacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text(
              'ILUMINACIÓN',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6
            ),
            Text('Encendida/Apagada', style: const TextStyle(fontSize: 19)),
            const SizedBox(
              height: 6
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Encender / Apagar'),
            ),
          ],
        ),
      ),
    );
  }
}