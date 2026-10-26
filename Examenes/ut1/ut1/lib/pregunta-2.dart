import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaInicio(),
    ),
  );
}

// --------------------------------------------------
// PANTALLA DE INICIO
// --------------------------------------------------
class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizzería Flutterini'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.local_pizza, size: 120, color: Colors.orange),
            const Text(
              '¡Las pizzas más rápidas del widget tree!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const PantallaCarta()))
                );
              },
              child: const Text('Ver la carta'),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA DE LA CARTA
// --------------------------------------------------
class PantallaCarta extends StatelessWidget {
  const PantallaCarta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La carta'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.local_pizza, color: Colors.orange),
            title: const Text('Margarita Material'),
            subtitle: const Text('Tomate, mozzarella y mucho padding'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const PantallaHorno()))
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_pizza, color: Colors.orange),
            title: const Text('Cuatro Widgets'),
            subtitle: const Text('Row, Column, Stack y Wrap'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const PantallaHorno()))
              );
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Mejor otro día'),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA DEL HORNO
// --------------------------------------------------
class PantallaHorno extends StatelessWidget {
  const PantallaHorno({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('En el horno'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.local_fire_department, size: 120, color: Colors.deepOrange),
            const Text(
              'Tu pizza se está horneando a 400 grados...',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const PantallaEntrega()))
                );
              },
              child: const Text('¡Ya huele a pizza!'),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA DE ENTREGA
// --------------------------------------------------
class PantallaEntrega extends StatelessWidget {
  const PantallaEntrega({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Entregada!'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.delivery_dining, size: 120, color: Colors.green),
            const Text(
              '¡Que aproveche!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const PantallaInicio()))
                );
              },
              child: const Text('Hacer otro pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
