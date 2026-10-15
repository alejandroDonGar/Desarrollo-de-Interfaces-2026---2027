import 'package:flutter/material.dart';

void main() => runApp(const EscapeHogwarts());

class EscapeHogwarts extends StatelessWidget {
  const EscapeHogwarts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Escape de Hogwarts',

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB68B46),

          brightness: Brightness.dark,
        ),

        scaffoldBackgroundColor: const Color(0xFF101B2A),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF18273B),

          foregroundColor: Color(0xFFFFE5AE),

          centerTitle: true,
        ),
      ),

      home: const GranEscalera(),
    );
  }
}

// Diseño compartido de las escenas. No es necesario modificarlo.

class Escena extends StatelessWidget {
  const Escena({
    super.key,

    required this.titulo,

    required this.icono,

    required this.descripcion,

    required this.opciones,
  });

  final String titulo;

  final IconData icono;

  final String descripcion;

  final List<Widget> opciones;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),

      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),

            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Icon(icono, size: 94, color: const Color(0xFFFFD48B)),

                  const SizedBox(height: 20),

                  Text(
                    titulo,

                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 28,

                      fontWeight: FontWeight.bold,

                      color: Color(0xFFFFE5AE),
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    descripcion,

                    textAlign: TextAlign.center,

                    style: const TextStyle(fontSize: 17, height: 1.5),
                  ),

                  const SizedBox(height: 30),

                  ...opciones,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget boton(String texto, IconData icono, VoidCallback accion) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),

    child: ElevatedButton.icon(
      onPressed: accion,

      icon: Icon(icono),

      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),

        child: Text(texto, textAlign: TextAlign.center),
      ),

      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF344B67),

        foregroundColor: Colors.white,

        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
  );
}

class GranEscalera extends StatelessWidget {
  const GranEscalera({super.key});

  @override
  Widget build(BuildContext context) {
    return Escena(
      titulo: 'Gran Escalera',

      icono: Icons.castle_outlined,

      descripcion:
          'Es medianoche. Filch patrulla los pasillos. ¿Por dónde empezarás?',

      opciones: [
        boton('Entrar en la Biblioteca', Icons.menu_book, () {
          // TODO 1: Entra en la Biblioteca desde la Gran Escalera.
        }),

        boton('Bajar a las Mazmorras', Icons.science, () {
          // TODO 2: Baja a las Mazmorras desde la Gran Escalera.
        }),
      ],
    );
  }
}

class Biblioteca extends StatelessWidget {
  const Biblioteca({super.key});

  @override
  Widget build(BuildContext context) {
    return Escena(
      titulo: 'Biblioteca',

      icono: Icons.local_library,

      descripcion: 'Los libros susurran secretos. Uno está abierto y al fondo hay un pasadizo.',

      opciones: [
        boton('Examinar el Libro Prohibido', Icons.auto_stories, () {
          // TODO 3: Examina el Libro Prohibido. Debes poder regresar a la Biblioteca.
        }),

        boton('Atravesar el Pasadizo Secreto', Icons.door_front_door, () {
          // TODO 4: Atraviesa el Pasadizo Secreto. La Biblioteca desaparece de la pila.
        }),

        boton('Volver a la Gran Escalera', Icons.arrow_back, () {
          // TODO 5: Regresa de la Biblioteca a la Gran Escalera.
        }),
      ],
    );
  }
}

class LibroProhibido extends StatelessWidget {
  const LibroProhibido({super.key});

  @override
  Widget build(BuildContext context) {
    return Escena(
      titulo: 'Libro Prohibido',

      icono: Icons.auto_stories,

      descripcion: 'Encuentras una advertencia: «No todos los caminos tienen vuelta atrás».',

      opciones: [
        boton('Cerrar el libro', Icons.arrow_back, () {
          // TODO 6: Cierra el Libro Prohibido y regresa a la Biblioteca.
        }),
      ],
    );
  }
}

class PasadizoSecreto extends StatelessWidget {
  const PasadizoSecreto({super.key});

  @override
  Widget build(BuildContext context) {
    return Escena(
      titulo: 'Pasadizo Secreto',

      icono: Icons.door_sliding,

      descripcion: 'Has atravesado una puerta que se ha cerrado detrás de ti. Avanzas unos metros y descubres una escalera de emergencia que te devuelve a la Gran Escalera y una salida que no sabes a dónde te lleva.',

      opciones: [
        boton('Correr hacia la salida', Icons.celebration, () {
          // TODO 7: Corre hacia la salida desde el Pasadizo Secreto.
        }),

        boton('Subir las escaleras de emergencia', Icons.celebration, () {
          // TODO 8: Sube las escaleras de emergencia y vuelve a la Gran Escalera.
        }),
      ],
    );
  }
}

class Mazmorras extends StatelessWidget {
  const Mazmorras({super.key});

  @override
  Widget build(BuildContext context) {
    return Escena(
      titulo: 'Mazmorras',

      icono: Icons.science,

      descripcion: 'Las antorchas iluminan dos caminos: el despacho de Snape y una puerta brillante.',

      opciones: [
        boton('Entrar en el despacho de Snape', Icons.person_search, () {
          // TODO 9: Entra en el despacho de Snape desde las Mazmorras.
        }),

        boton('Cruzar la Puerta Misteriosa', Icons.door_front_door, () {
          // TODO 10: Cruza la Puerta Misteriosa. Las Mazmorras desaparecen de la pila.
        }),

        boton('Volver a la Gran Escalera', Icons.arrow_back, () {
          // TODO 11: Regresa de las Mazmorras a la Gran Escalera.
        }),
      ],
    );
  }
}

class DespachoSnape extends StatelessWidget {
  const DespachoSnape({super.key});

  @override
  Widget build(BuildContext context) {
    return Escena(
      titulo: 'Despacho de Snape',

      icono: Icons.psychology,

      descripcion: '¡Snape te descubre! Ya no hay escapatoria.',

      opciones: [
        boton('Aceptar tu destino', Icons.warning_amber, () {
          // TODO 12: Snape te ha descubierto: avanza al final «¡Atrapado!».
        }),
      ],
    );
  }
}

class PuertaMisteriosa extends StatelessWidget {
  const PuertaMisteriosa({super.key});

  @override
  Widget build(BuildContext context) {
    return Escena(
      titulo: 'Puerta Misteriosa',

      icono: Icons.blur_circular,

      descripcion: 'La puerta se cierra. Al otro lado hay una sala iluminada por una luz azul.',

      opciones: [
        boton('Entrar en la Sala Secreta', Icons.key, () {
          // TODO 13: Entra en la Sala Secreta desde la Puerta Misteriosa.
        }),
      ],
    );
  }
}

class SalaSecreta extends StatelessWidget {
  const SalaSecreta({super.key});

  @override
  Widget build(BuildContext context) {
    return Escena(
      titulo: 'Sala Secreta',

      icono: Icons.key,

      descripcion: 'Descubres una llave que abre una salida oculta.',

      opciones: [
        boton('Abrir la salida', Icons.celebration, () {
          // TODO 14: Abre la salida de la Sala Secreta y llega al final «¡Escapaste!».
        }),

        boton('Volver a la Puerta Misteriosa', Icons.arrow_back, () {
          // TODO 15: Regresa desde la Sala Secreta a la Puerta Misteriosa.
        }),
      ],
    );
  }
}

class Escapaste extends StatelessWidget {
  const Escapaste({super.key});

  @override
  Widget build(BuildContext context) {
    return Escena(
      titulo: '¡Escapaste!',

      icono: Icons.emoji_events,

      descripcion: '¡Lo has conseguido! Has salido del castillo antes de que Filch te encuentre.',

      opciones: [
        boton('Volver a jugar', Icons.restart_alt, () {
          // TODO 16: Reinicia desde «¡Escapaste!» y vuelve directamente a la Gran Escalera.
        }),
      ],
    );
  }
}

class Atrapado extends StatelessWidget {
  const Atrapado({super.key});

  @override
  Widget build(BuildContext context) {
    return Escena(
      titulo: '¡Atrapado!',

      icono: Icons.sentiment_very_dissatisfied,

      descripcion: 'Snape te ha descubierto. Tendrás que intentarlo de nuevo.',

      opciones: [
        boton('Volver a jugar', Icons.restart_alt, () {
          // TODO 17: Reinicia desde «¡Atrapado!» y vuelve directamente a la Gran Escalera.
        }),
      ],
    );
  }
}
