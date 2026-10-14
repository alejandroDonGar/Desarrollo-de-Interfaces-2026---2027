import 'package:flutter/material.dart';

void main() {
  runApp(const MisionMarte());
}

class MisionMarte extends StatelessWidget {
  const MisionMarte({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Misión Marte',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: const CentroControl(),
    );
  }
}

// Cada etapa es una pantalla independiente.
// Completa únicamente las seis instrucciones TODO.

// --------------------------------------------------
// PANTALLA 1: CENTRO DE CONTROL
// --------------------------------------------------
class CentroControl extends StatelessWidget {
  const CentroControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080F24),
      appBar: AppBar(
        title: const Text('MISIÓN MARTE', style: TextStyle(letterSpacing: 3, fontSize: 16)),
        centerTitle: true,
        backgroundColor: const Color(0xFF080F24),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.stars, color: Color(0xFF7388B4), size: 28),
                  const SizedBox(height: 18),
                  const Text(
                    'La misión comienza aquí',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13213C),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFF324765)),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.rocket_launch, size: 96, color: Color(0xFFFF8C5A)),
                        const SizedBox(height: 24),
                        const Text(
                          'CENTRO DE CONTROL',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Preparativos para el primer viaje tripulado a Marte.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFFD7E1F4)),
                        ),
                        const SizedBox(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Color(0xFF70D9CF), size: 18),
                            SizedBox(width: 8),
                            Text('SISTEMA OPERATIVO', style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 1, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8C5A),
                      foregroundColor: const Color(0xFF101729),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('INICIAR MISIÓN'),
                    onPressed: () {
                      // TODO 1: Abrir la pantalla Identificacion.
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'AGENCIA ESPACIAL · PROGRAMA ARES',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF7388B4), fontSize: 11, letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA 2: IDENTIFICACIÓN
// --------------------------------------------------
class Identificacion extends StatelessWidget {
  const Identificacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080F24),
      appBar: AppBar(
        title: const Text('MISIÓN MARTE', style: TextStyle(letterSpacing: 3, fontSize: 16)),
        centerTitle: true,
        backgroundColor: const Color(0xFF080F24),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.stars, color: Color(0xFF7388B4), size: 28),
                  const SizedBox(height: 18),
                  const Text(
                    'ETAPA 01 · TRIPULACIÓN',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13213C),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFF324765)),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.badge, size: 96, color: Color(0xFFFF8C5A)),
                        const SizedBox(height: 24),
                        const Text(
                          'IDENTIFICACIÓN',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Identidad verificada. La tripulación está lista para embarcar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFFD7E1F4)),
                        ),
                        const SizedBox(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Color(0xFF70D9CF), size: 18),
                            SizedBox(width: 8),
                            Text('SISTEMA OPERATIVO', style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 1, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8C5A),
                      foregroundColor: const Color(0xFF101729),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('CONTINUAR · COMBUSTIBLE'),
                    onPressed: () {
                      // TODO 2: Abrir la pantalla Combustible.
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'AGENCIA ESPACIAL · PROGRAMA ARES',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF7388B4), fontSize: 11, letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA 3: COMBUSTIBLE
// --------------------------------------------------
class Combustible extends StatelessWidget {
  const Combustible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080F24),
      appBar: AppBar(
        title: const Text('MISIÓN MARTE', style: TextStyle(letterSpacing: 3, fontSize: 16)),
        centerTitle: true,
        backgroundColor: const Color(0xFF080F24),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.stars, color: Color(0xFF7388B4), size: 28),
                  const SizedBox(height: 18),
                  const Text(
                    'ETAPA 02 · PROPULSIÓN',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13213C),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFF324765)),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.local_gas_station, size: 96, color: Color(0xFFFF8C5A)),
                        const SizedBox(height: 24),
                        const Text(
                          'COMBUSTIBLE',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Depósitos cargados al 100 %. Autonomía confirmada.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFFD7E1F4)),
                        ),
                        const SizedBox(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Color(0xFF70D9CF), size: 18),
                            SizedBox(width: 8),
                            Text('SISTEMA OPERATIVO', style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 1, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8C5A),
                      foregroundColor: const Color(0xFF101729),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('CONTINUAR · OXÍGENO'),
                    onPressed: () {
                      // TODO 3: Abrir la pantalla Oxigeno.
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'AGENCIA ESPACIAL · PROGRAMA ARES',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF7388B4), fontSize: 11, letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA 4: OXÍGENO
// --------------------------------------------------
class Oxigeno extends StatelessWidget {
  const Oxigeno({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080F24),
      appBar: AppBar(
        title: const Text('MISIÓN MARTE', style: TextStyle(letterSpacing: 3, fontSize: 16)),
        centerTitle: true,
        backgroundColor: const Color(0xFF080F24),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.stars, color: Color(0xFF7388B4), size: 28),
                  const SizedBox(height: 18),
                  const Text(
                    'ETAPA 03 · SOPORTE VITAL',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13213C),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFF324765)),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.air, size: 96, color: Color(0xFFFF8C5A)),
                        const SizedBox(height: 24),
                        const Text(
                          'OXÍGENO',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Suministro de oxígeno estable. Sistemas de soporte vital operativos.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFFD7E1F4)),
                        ),
                        const SizedBox(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Color(0xFF70D9CF), size: 18),
                            SizedBox(width: 8),
                            Text('SISTEMA OPERATIVO', style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 1, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8C5A),
                      foregroundColor: const Color(0xFF101729),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('CONTINUAR · MOTORES'),
                    onPressed: () {
                      // TODO 4: Abrir la pantalla Motores.
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'AGENCIA ESPACIAL · PROGRAMA ARES',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF7388B4), fontSize: 11, letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA 5: MOTORES
// --------------------------------------------------
class Motores extends StatelessWidget {
  const Motores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080F24),
      appBar: AppBar(
        title: const Text('MISIÓN MARTE', style: TextStyle(letterSpacing: 3, fontSize: 16)),
        centerTitle: true,
        backgroundColor: const Color(0xFF080F24),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.stars, color: Color(0xFF7388B4), size: 28),
                  const SizedBox(height: 18),
                  const Text(
                    'ETAPA 04 · SISTEMAS',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13213C),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFF324765)),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.settings, size: 96, color: Color(0xFFFF8C5A)),
                        const SizedBox(height: 24),
                        const Text(
                          'MOTORES',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Motores encendidos. Todos los indicadores están en verde.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFFD7E1F4)),
                        ),
                        const SizedBox(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Color(0xFF70D9CF), size: 18),
                            SizedBox(width: 8),
                            Text('SISTEMA OPERATIVO', style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 1, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8C5A),
                      foregroundColor: const Color(0xFF101729),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('INICIAR DESPEGUE'),
                    onPressed: () {
                      // TODO 5: Abrir la pantalla Despegue.
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'AGENCIA ESPACIAL · PROGRAMA ARES',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF7388B4), fontSize: 11, letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA 6: DESPEGUE
// --------------------------------------------------
class Despegue extends StatelessWidget {
  const Despegue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080F24),
      appBar: AppBar(
        title: const Text('MISIÓN MARTE', style: TextStyle(letterSpacing: 3, fontSize: 16)),
        centerTitle: true,
        backgroundColor: const Color(0xFF080F24),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.stars, color: Color(0xFF7388B4), size: 28),
                  const SizedBox(height: 18),
                  const Text(
                    'MISIÓN COMPLETADA',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13213C),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFF324765)),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.public, size: 96, color: Color(0xFFFF8C5A)),
                        const SizedBox(height: 24),
                        const Text(
                          'DESPEGUE',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '¡Despegue completado! Próximo destino: Marte.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFFD7E1F4)),
                        ),
                        const SizedBox(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Color(0xFF70D9CF), size: 18),
                            SizedBox(width: 8),
                            Text('SISTEMA OPERATIVO', style: TextStyle(color: Color(0xFF70D9CF), letterSpacing: 1, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8C5A),
                      foregroundColor: const Color(0xFF101729),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('INICIAR NUEVA MISIÓN'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'AGENCIA ESPACIAL · PROGRAMA ARES',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF7388B4), fontSize: 11, letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}