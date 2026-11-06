import 'dart:math'; // Random: números al azar

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ===== El notificador de cambios: las reglas del juego =====
// TODO 1: haz que Caldero sea un notificador de cambios.
class Caldero {
  int potencia = 0;
  int puntos = 0;
  bool explotado = false;

  void echarIngrediente() {
    // TODO 2: si ha explotado, no hagas nada.
    //         Si no, suma a la potencia un número al azar entre 1 y 3:
    //         Random().nextInt(3) + 1
    //         Si la potencia pasa de 10, el caldero explota.
    //         Al terminar, avisa.
  }

  void embotellar() {
    // TODO 3: si ha explotado, no hagas nada.
    //         Si no, suma la potencia a los puntos, vacía el caldero y avisa.
  }

  void limpiar() {
    // TODO 4: deja la potencia a 0, quita la explosión y avisa.
    //         (Los puntos no se tocan).
  }
}

void main() {
  // TODO 5: envuelve la aplicación con el proveedor del Caldero.
  runApp(const JuegoPociones());
}

class JuegoPociones extends StatelessWidget {
  const JuegoPociones({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('🧪 Clase de Pociones'),
          actions: const [MarcadorPuntos(), SizedBox(width: 16)],
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            Text('Echa ingredientes para que la poción sea más potente. ''Si pasa de 10... ¡BOOM! Embotella a tiempo para ganar ''puntos para tu casa.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            VistaCaldero(),
            SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [BotonIngrediente(), BotonEmbotellar(), BotonLimpiar()],
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Widgets que ESCUCHAN (watch) =====
class MarcadorPuntos extends StatelessWidget {
  const MarcadorPuntos({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO 6: escucha el caldero y muestra sus puntos.
    return const Chip(
      avatar: Icon(Icons.emoji_events, color: Colors.amber),
      label: Text('0 puntos'),
    );
  }
}

class VistaCaldero extends StatelessWidget {
  const VistaCaldero({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO 7: escucha el caldero y lee de él estos dos datos.
    const potencia = 0;
    const explotado = false;

    final color = explotado
        ? Colors.red
        : potencia <= 5
            ? Colors.green
            : potencia <= 8
                ? Colors.orange
                : Colors.deepOrange;

    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [color, Colors.black87]),
            boxShadow: [BoxShadow(color: color, blurRadius: 30)],
          ),
          child: Text(explotado ? '💥' : '🧪', style: const TextStyle(fontSize: 80)),
        ),
        const SizedBox(height: 16),
        Text(
          explotado ? '¡BOOM! La poción ha explotado' : 'Potencia: $potencia / 10',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: explotado ? 1 : potencia / 10,
          color: color,
          minHeight: 10,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }
}

// ===== Widgets que PROVOCAN cambios (read) =====
class BotonIngrediente extends StatelessWidget {
  const BotonIngrediente({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        // TODO 8: pide al caldero que ejecute echarIngrediente().
      },
      icon: const Icon(Icons.eco),
      label: const Text('Echar ingrediente'),
    );
  }
}

class BotonEmbotellar extends StatelessWidget {
  const BotonEmbotellar({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () {
        // TODO 8: pide al caldero que ejecute embotellar().
      },
      icon: const Icon(Icons.local_drink),
      label: const Text('Embotellar'),
    );
  }
}

class BotonLimpiar extends StatelessWidget {
  const BotonLimpiar({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        // TODO 8: pide al caldero que ejecute limpiar().
      },
      icon: const Icon(Icons.cleaning_services),
      label: const Text('Limpiar caldero'),
    );
  }
}

//* Codigo original
/*
import 'dart:math'; // Random: números al azar

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ===== El notificador de cambios: las reglas del juego =====
class Caldero {
  int potencia = 0;
  int puntos = 0;
  bool explotado = false;

  void echarIngrediente() {
    //         Si no, suma a la potencia un número al azar entre 1 y 3:
    //         Random().nextInt(3) + 1
    //         Si la potencia pasa de 10, el caldero explota.
    //         Al terminar, avisa.
  }

  void embotellar() {
    //         Si no, suma la potencia a los puntos, vacía el caldero y avisa.
  }

  void limpiar() {
    //         (Los puntos no se tocan).
  }
}

void main() {
  runApp(const JuegoPociones());
}

class JuegoPociones extends StatelessWidget {
  const JuegoPociones({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('🧪 Clase de Pociones'),
          actions: const [MarcadorPuntos(), SizedBox(width: 16)],
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            Text('Echa ingredientes para que la poción sea más potente. ''Si pasa de 10... ¡BOOM! Embotella a tiempo para ganar ''puntos para tu casa.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            VistaCaldero(),
            SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [BotonIngrediente(), BotonEmbotellar(), BotonLimpiar()],
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Widgets que ESCUCHAN (watch) =====
class MarcadorPuntos extends StatelessWidget {
  const MarcadorPuntos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Chip(
      avatar: Icon(Icons.emoji_events, color: Colors.amber),
      label: Text('0 puntos'),
    );
  }
}

class VistaCaldero extends StatelessWidget {
  const VistaCaldero({super.key});

  @override
  Widget build(BuildContext context) {
    const potencia = 0;
    const explotado = false;

    final color = explotado
        ? Colors.red
        : potencia <= 5
            ? Colors.green
            : potencia <= 8
                ? Colors.orange
                : Colors.deepOrange;

    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [color, Colors.black87]),
            boxShadow: [BoxShadow(color: color, blurRadius: 30)],
          ),
          child: Text(explotado ? '💥' : '🧪', style: const TextStyle(fontSize: 80)),
        ),
        const SizedBox(height: 16),
        Text(
          explotado ? '¡BOOM! La poción ha explotado' : 'Potencia: $potencia / 10',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: explotado ? 1 : potencia / 10,
          color: color,
          minHeight: 10,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }
}

// ===== Widgets que PROVOCAN cambios (read) =====
class BotonIngrediente extends StatelessWidget {
  const BotonIngrediente({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
      },
      icon: const Icon(Icons.eco),
      label: const Text('Echar ingrediente'),
    );
  }
}

class BotonEmbotellar extends StatelessWidget {
  const BotonEmbotellar({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () {
      },
      icon: const Icon(Icons.local_drink),
      label: const Text('Embotellar'),
    );
  }
}

class BotonLimpiar extends StatelessWidget {
  const BotonLimpiar({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
      },
      icon: const Icon(Icons.cleaning_services),
      label: const Text('Limpiar caldero'),
    );
  }
}
*/