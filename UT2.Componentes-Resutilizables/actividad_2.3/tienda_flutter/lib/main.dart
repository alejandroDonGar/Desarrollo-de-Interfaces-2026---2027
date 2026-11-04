import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Tienda()));
}

class TarjetaProducto extends StatelessWidget {
  final String nombre;
  final int precio;

  const TarjetaProducto({
    super.key,
    required this.nombre,
    required this.precio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(nombre), Text('$precio euros')],
        ),
      ),
    );
  }
}

class Tienda extends StatefulWidget {
  const Tienda({super.key});
  @override
  State<Tienda> createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  int saldo = 20;

  void comprar(int precio) {
    if (saldo >= precio) {
      setState(() {
        saldo -= precio;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('La tienda de clase')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Saldo: $saldo euros'),
            //* Pegatina ------------------------------------- */
            TarjetaProducto(nombre: "Pegatina", precio: 2),
            ElevatedButton(
              onPressed: () {
                comprar(2);
              },
              child: Text('Comprar pegatina'),
            ),

            //* Libreta -------------------------------------  */
            TarjetaProducto(nombre: "Libreta", precio: 5),
            ElevatedButton(
              onPressed: () {
                comprar(5);
              },
              child: Text('Comprar libreta'),
            ),

            //* Camisetas -------------------------------------  */
            TarjetaProducto(nombre: "Camiseta", precio: 12),
            ElevatedButton(
              onPressed: () {
                comprar(12);
              },
              child: Text('Comprar camiseta'),
            ),
          ],
        ),
      ),
    );
  }
}

//* Codigo original:
/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Tienda()));
}

class Tienda extends StatefulWidget {
  const Tienda({super.key});
  @override
  State<Tienda> createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  int saldo = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('La tienda de clase')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Saldo: $saldo euros'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [const Text('Pegatina'), const Text('2 euros')],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [const Text('Libreta'), const Text('5 euros')],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [const Text('Camiseta'), const Text('12 euros')],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
