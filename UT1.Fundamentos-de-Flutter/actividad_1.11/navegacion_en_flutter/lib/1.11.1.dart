import 'package:flutter/material.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de películas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const PantallaCatalogo(),
    );
  }
}

// --------------------------------------------------
// PANTALLA 1: CATÁLOGO
// --------------------------------------------------

class PantallaCatalogo extends StatelessWidget {
  const PantallaCatalogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de películas'),
        backgroundColor: Colors.deepOrange.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.rocket_launch,
                size: 36,
                color: Colors.deepOrange,
              ),
              title: const Text('Interstellar'),
              subtitle: const Text('Ciencia ficción · 2014'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PantallaInterstellar(),
                  ),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.pets,
                size: 36,
                color: Colors.deepOrange,
              ),
              title: const Text('Jurassic Park'),
              subtitle: const Text('Aventura · 1993'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PantallaJurassicPark(),
                  ),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.music_note,
                size: 36,
                color: Colors.deepOrange,
              ),
              title: const Text('Coco'),
              subtitle: const Text('Animación · 2017'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PantallaCoco(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA 2: INTERSTELLAR
// --------------------------------------------------

class PantallaInterstellar extends StatelessWidget {
  const PantallaInterstellar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interstellar'),
        backgroundColor: Colors.deepOrange.shade100,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.rocket_launch, size: 90, color: Colors.deepOrange),
            const SizedBox(height: 24),

            const Text(
              'Interstellar',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text('Ciencia ficción · 2014', textAlign: TextAlign.center),

            const SizedBox(height: 32),

            const Text(
              'Sinopsis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              'Un grupo de astronautas emprende un viaje '
              'a través de un agujero de gusano en busca '
              'de un nuevo hogar para la humanidad.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 32),

            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver al catálogo'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA 3: JURASSIC PARK
// --------------------------------------------------

class PantallaJurassicPark extends StatelessWidget {
  const PantallaJurassicPark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jurassic Park'),
        backgroundColor: Colors.deepOrange.shade100,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.pets, size: 90, color: Colors.deepOrange),
            const SizedBox(height: 24),

            const Text(
              'Jurassic Park',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text('Aventura · 1993', textAlign: TextAlign.center),

            const SizedBox(height: 32),

            const Text(
              'Sinopsis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              'Un parque temático consigue devolver a '
              'la vida a los dinosaurios mediante ingeniería '
              'genética. Una visita emocionante se convierte '
              'en una lucha por sobrevivir.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 32),

            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver al catálogo'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// PANTALLA 4: COCO
// --------------------------------------------------

class PantallaCoco extends StatelessWidget {
  const PantallaCoco({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coco'),
        backgroundColor: Colors.deepOrange.shade100,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.music_note, size: 90, color: Colors.deepOrange),
            const SizedBox(height: 24),

            const Text(
              'Coco',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text('Animación · 2017', textAlign: TextAlign.center),

            const SizedBox(height: 32),

            const Text(
              'Sinopsis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              'Miguel sueña con convertirse en músico '
              'y viaja accidentalmente al mundo de los '
              'muertos, donde descubrirá secretos sobre '
              'su familia.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 32),

            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver al catálogo'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}