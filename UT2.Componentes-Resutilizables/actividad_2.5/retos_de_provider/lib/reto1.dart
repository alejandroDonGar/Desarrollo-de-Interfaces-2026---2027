import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ===== El notificador de cambios: ya está hecho, no hace falta tocarlo =====
class CopaCasas extends ChangeNotifier {
  final Map<String, int> puntos = {
    'Gryffindor': 0,
    'Hufflepuff': 0,
    'Ravenclaw': 0,
    'Slytherin': 0,
  };

  void sumar(String casa) {
    puntos[casa] = puntos[casa]! + 10;
    notifyListeners();
  }

  void restar(String casa) {
    if (puntos[casa]! < 10) return; // los puntos no bajan de 0
    puntos[casa] = puntos[casa]! - 10;
    notifyListeners();
  }

  String lider() {
    var mejor = 'Nadie';
    var maximo = 0;
    puntos.forEach((casa, valor) {
      if (valor > maximo) {
        mejor = casa;
        maximo = valor;
      }
    });
    return mejor;
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CopaCasas(),
      child: const CopaApp(),
    ),
  );
}

class CopaApp extends StatelessWidget {
  const CopaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('🏆 Copa de las Casas'),
          actions: const [MarcadorLider(), SizedBox(width: 16)],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: const [
            TarjetaCasa(casa: 'Gryffindor', color: Color(0xFF7F0909)),
            TarjetaCasa(casa: 'Hufflepuff', color: Color(0xFFEEB939)),
            TarjetaCasa(casa: 'Ravenclaw', color: Color(0xFF0E1A40)),
            TarjetaCasa(casa: 'Slytherin', color: Color(0xFF1A472A)),
          ],
        ),
      ),
    );
  }
}

class MarcadorLider extends StatelessWidget {
  const MarcadorLider({super.key});

  @override
  Widget build(BuildContext context) {
    final copas = context.watch<CopaCasas>();
    return Chip(label: Text('Va ganando: ${copas.lider()}'));
  }
}

class TarjetaCasa extends StatelessWidget {
  final String casa;
  final Color color;


  const TarjetaCasa({super.key, required this.casa, required this.color});

  @override
  Widget build(BuildContext context) {
    final copas = context.watch<CopaCasas>();

    return Card(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(casa, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('${copas.puntos[casa]}', style: const TextStyle(color: Colors.white, fontSize: 36)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filledTonal(
                onPressed: () {
                  copas.restar(casa);
                },
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(width: 12),
              IconButton.filledTonal(
                onPressed: () {
                  copas.sumar(casa);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//* Codigo original
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ===== El notificador de cambios: ya está hecho, no hace falta tocarlo =====
class CopaCasas extends ChangeNotifier {
  final Map<String, int> puntos = {
    'Gryffindor': 0,
    'Hufflepuff': 0,
    'Ravenclaw': 0,
    'Slytherin': 0,
  };

  void sumar(String casa) {
    puntos[casa] = puntos[casa]! + 10;
    notifyListeners();
  }

  void restar(String casa) {
    if (puntos[casa]! < 10) return; // los puntos no bajan de 0
    puntos[casa] = puntos[casa]! - 10;
    notifyListeners();
  }

  String lider() {
    var mejor = 'Nadie';
    var maximo = 0;
    puntos.forEach((casa, valor) {
      if (valor > maximo) {
        mejor = casa;
        maximo = valor;
      }
    });
    return mejor;
  }
}

void main() {
  runApp(const CopaApp());
}

class CopaApp extends StatelessWidget {
  const CopaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('🏆 Copa de las Casas'),
          actions: const [MarcadorLider(), SizedBox(width: 16)],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: const [
            TarjetaCasa(casa: 'Gryffindor', color: Color(0xFF7F0909)),
            TarjetaCasa(casa: 'Hufflepuff', color: Color(0xFFEEB939)),
            TarjetaCasa(casa: 'Ravenclaw', color: Color(0xFF0E1A40)),
            TarjetaCasa(casa: 'Slytherin', color: Color(0xFF1A472A)),
          ],
        ),
      ),
    );
  }
}

class MarcadorLider extends StatelessWidget {
  const MarcadorLider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Chip(label: Text('Va ganando: Nadie'));
  }
}

class TarjetaCasa extends StatelessWidget {
  final String casa;
  final Color color;

  const TarjetaCasa({super.key, required this.casa, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(casa, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('0', style: const TextStyle(color: Colors.white, fontSize: 36)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(width: 12),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/