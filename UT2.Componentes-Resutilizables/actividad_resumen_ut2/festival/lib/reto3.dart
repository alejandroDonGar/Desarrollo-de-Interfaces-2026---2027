import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosModel extends ChangeNotifier {
  final List<String> _favoritos = [];

  int get total => _favoritos.length;

  bool esFavorito(String artista) => _favoritos.contains(artista);

  void alternar(String artista) {
    if (!_favoritos.remove(artista)) {
      _favoritos.add(artista);
    }
    notifyListeners();
  }

  void vaciar() {
    _favoritos.clear();
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritosModel(),
      child: const FestivalApp(),
    ),
  );
}

class FestivalApp extends StatelessWidget {
  const FestivalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mis favoritos'),
          actions: const [ContadorFavoritos(), BotonVaciar()],
        ),
        body: ListView(
          children: const [
            FilaArtista(artista: 'Luna Norte'),
            FilaArtista(artista: 'Los Alisios'),
            FilaArtista(artista: 'Dúo Malpaís'),
          ],
        ),
      ),
    );
  }
}

class FilaArtista extends StatelessWidget {
  final String artista;

  const FilaArtista({super.key, required this.artista});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(artista),
      trailing: BotonFavorito(artista: artista),
    );
  }
}

class ContadorFavoritos extends StatelessWidget {
  const ContadorFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    final total = context.watch<FavoritosModel>().total;
    return Center(child: Text('⭐ $total'));
  }
}

class BotonFavorito extends StatelessWidget {
  final String artista;

  const BotonFavorito({super.key, required this.artista});

  @override
  Widget build(BuildContext context) {
    final esFavorito = context.watch<FavoritosModel>().esFavorito(artista);
    return IconButton(
      icon: Icon(esFavorito ? Icons.favorite : Icons.favorite_border),
      onPressed: () => context.read<FavoritosModel>().alternar(artista),
    );
  }
}

class BotonVaciar extends StatelessWidget {
  const BotonVaciar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_sweep),
      onPressed: () => context.read<FavoritosModel>().vaciar(),
    );
  }
}

//* Codigo Original:
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ✏️ 1. Completa el modelo
class FavoritosModel {
}

void main() {
  // ✏️ 2. Haz que el modelo llegue a toda la app
  runApp(const FestivalApp());
}

class FestivalApp extends StatelessWidget {
  const FestivalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mis favoritos'),
          actions: const [ContadorFavoritos(), BotonVaciar()],
        ),
        body: ListView(
          children: const [
            FilaArtista(artista: 'Luna Norte'),
            FilaArtista(artista: 'Los Alisios'),
            FilaArtista(artista: 'Dúo Malpaís'),
          ],
        ),
      ),
    );
  }
}

class FilaArtista extends StatelessWidget {
  final String artista;

  const FilaArtista({super.key, required this.artista});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(artista),
      trailing: BotonFavorito(artista: artista),
    );
  }
}

// ✏️ 3. Muestra cuántos favoritos hay
class ContadorFavoritos extends StatelessWidget {
  const ContadorFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    const total = 0;
    return const Center(child: Text('⭐ $total'));
  }
}

// ✏️ 4. Corazón lleno si el artista es favorito; al pulsarlo, lo añade o lo quita
class BotonFavorito extends StatelessWidget {
  final String artista;

  const BotonFavorito({super.key, required this.artista});

  @override
  Widget build(BuildContext context) {
    const esFavorito = false;
    return IconButton(
      icon: Icon(esFavorito ? Icons.favorite : Icons.favorite_border),
      onPressed: () {},
    );
  }
}

// ✏️ 5. Al pulsarlo, vacía la lista de favoritos
class BotonVaciar extends StatelessWidget {
  const BotonVaciar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_sweep),
      onPressed: () {},
    );
  }
}
*/
