import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: PantallaCombate()));

class PantallaCombate extends StatefulWidget {
  const PantallaCombate({super.key});

  @override
  State<PantallaCombate> createState() => _PantallaCombateState();
}

class _PantallaCombateState extends State<PantallaCombate> {
  int vida = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('¡Un dragón!')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BarraVida(vida: vida),
            const SizedBox(height: 24),
            PanelAcciones(
              derrotado: vida == 0,
              onAtacar: () {
                setState(() {
                  vida = (vida - 20).clamp(
                    0,
                    100,
                  ); // Limita el resultado a un minimo y maximo personalizados
                });
              },
              onCurar: () {
                setState(() {
                  vida = (vida + 15).clamp(
                    0,
                    100,
                  ); // Limita el resultado a un minimo y maximo personalizados
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BarraVida extends StatelessWidget {
  final int vida;

  const BarraVida({super.key, required this.vida});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Vida: $vida / 100'),
        LinearProgressIndicator(value: vida / 100),
        if (vida == 0) const Text('¡Derrotado!'),
      ],
    );
  }
}

class PanelAcciones extends StatelessWidget {
  final bool derrotado;
  final VoidCallback onAtacar;
  final VoidCallback onCurar;

  const PanelAcciones({
    super.key,
    required this.derrotado,
    required this.onAtacar,
    required this.onCurar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: derrotado ? null : onAtacar,
          child: const Text('Atacar'),
        ),
        const SizedBox(width: 12),
        ElevatedButton(onPressed: onCurar, child: const Text('Curar')),
      ],
    );
  }
}

//* Código original:
/*
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: PantallaCombate()));

class PantallaCombate extends StatefulWidget {
  const PantallaCombate({super.key});

  @override
  State<PantallaCombate> createState() => _PantallaCombateState();
}

class _PantallaCombateState extends State<PantallaCombate> {
  int vida = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('¡Un dragón!')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // ✏️ Pasa a cada hermano lo que necesita
            BarraVida(),
            SizedBox(height: 24),
            PanelAcciones(),
          ],
        ),
      ),
    );
  }
}

class BarraVida extends StatelessWidget {
  const BarraVida({super.key});

  @override
  Widget build(BuildContext context) {
    // ✏️ Muestra la vida que recibe
    return const Column(
      children: [
        Text('Vida: 100 / 100'),
        LinearProgressIndicator(value: 1),
      ],
    );
  }
}

class PanelAcciones extends StatelessWidget {
  const PanelAcciones({super.key});

  @override
  Widget build(BuildContext context) {
    // ✏️ Avisa a la pantalla al pulsar cada botón
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text('Atacar')),
        const SizedBox(width: 12),
        ElevatedButton(onPressed: () {}, child: const Text('Curar')),
      ],
    );
  }
}
*/
