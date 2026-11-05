import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Tienda()));
}

class TarjetaProducto extends StatelessWidget {
  final String nombre;
  final int precio;
  final bool Function(int) onComprar;

  const TarjetaProducto({
    super.key,
    required this.nombre,
    required this.precio,
    required this.onComprar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(nombre), 
            Text('$precio euros'),
            ElevatedButton(
              onPressed: () {
                if(onComprar(precio)) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Compra realizada")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Saldo insuficiente")));
                }
              },
              child: Text("Comprar")
            )
          ],
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

  bool comprar(int precio) {
    if (saldo<precio) {
      return false;
    } else {
      setState(() {
        saldo -= precio;
      });
      return true;
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
            TarjetaProducto(
              nombre: "Pegatina", 
              precio: 2, 
              onComprar: comprar
            ),

            //* Libreta -------------------------------------  */
            TarjetaProducto(
              nombre: "Libreta", 
              precio: 5, 
              onComprar: comprar
            ),

            //* Camisetas -------------------------------------  */
            TarjetaProducto(
              nombre: "Camiseta", 
              precio: 12, 
              onComprar: comprar
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

//* Respuesta de la pregunta 1:
/*
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
    required this.precio});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('La tienda de clase')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Saldo: $saldo euros'),
            TarjetaProducto(nombre: "Pegatina", precio: 2),
            TarjetaProducto(nombre: "Libreta", precio: 5),
            TarjetaProducto(nombre: "Camiseta", precio: 12)
          ],
        ),
      ),
    );
  }
}
 */

//* Respuesta de la pregunta 2:
/*
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

  void comprarPegatina() {
    if (saldo >= 2) {
      setState(() {
        saldo -= 2;
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
            TarjetaProducto(nombre: "Pegatina", precio: 2),
            TarjetaProducto(nombre: "Libreta", precio: 5),
            TarjetaProducto(nombre: "Camiseta", precio: 12),
            ElevatedButton(
              onPressed: comprarPegatina,
              child: Text('Comprar pegatina'),
            ),
          ],
        ),
      ),
    );
  }
}
 */

//* Respuesta de la pregunta 3:
/*
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
    if(saldo<precio) {
      return;
    }
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
 */

//* Respuesta de la pregunta 4:
/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Tienda()));
}

class TarjetaProducto extends StatelessWidget {
  final String nombre;
  final int precio;
  final VoidCallback onComprar;

  const TarjetaProducto({
    super.key,
    required this.nombre,
    required this.precio,
    required this.onComprar
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(nombre), 
            Text('$precio euros'),
            ElevatedButton(
              onPressed: onComprar,
              child: Text("Comprar")
            )
          ],
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
    if(saldo<precio) {
      return;
    }
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
            TarjetaProducto(nombre: "Pegatina", precio: 2, onComprar: () {
              comprar(2);
            },),

            //* Libreta -------------------------------------  */
            TarjetaProducto(nombre: "Libreta", precio: 5, onComprar: () {
              comprar(5);
            },),

            //* Camisetas -------------------------------------  */
            TarjetaProducto(nombre: "Camiseta", precio: 12, onComprar: () {
              comprar(12);
            },),
          ],
        ),
      ),
    );
  }
}
 */

//* Respuesta de la pregunta 5:
/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Tienda()));
}

class TarjetaProducto extends StatelessWidget {
  final String nombre;
  final int precio;
  final void Function(int) onComprar;

  const TarjetaProducto({
    super.key,
    required this.nombre,
    required this.precio,
    required this.onComprar
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(nombre), 
            Text('$precio euros'),
            ElevatedButton(
              onPressed: () {
                onComprar(precio);
              },
              child: Text("Comprar")
            )
          ],
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
    if(saldo<precio) {
      return;
    }
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
            TarjetaProducto(
              nombre: "Pegatina", 
              precio: 2, 
              onComprar: comprar
            ),

            //* Libreta -------------------------------------  */
            TarjetaProducto(
              nombre: "Libreta", 
              precio: 5, 
              onComprar: comprar
            ),

            //* Camisetas -------------------------------------  */
            TarjetaProducto(
              nombre: "Camiseta", 
              precio: 12, 
              onComprar: comprar
            ),
          ],
        ),
      ),
    );
  }
}
 */

//* Respuesta de la pregunta 6:
/*
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Tienda()));
}

class TarjetaProducto extends StatelessWidget {
  final String nombre;
  final int precio;
  final bool Function(int) onComprar;

  const TarjetaProducto({
    super.key,
    required this.nombre,
    required this.precio,
    required this.onComprar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(nombre), 
            Text('$precio euros'),
            ElevatedButton(
              onPressed: () {
                if(onComprar(precio)) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Compra realizada")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Saldo insuficiente")));
                }
              },
              child: Text("Comprar")
            )
          ],
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

  bool comprar(int precio) {
    if (saldo<precio) {
      return false;
    } else {
      setState(() {
        saldo -= precio;
      });
      return true;
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
            TarjetaProducto(
              nombre: "Pegatina", 
              precio: 2, 
              onComprar: comprar
            ),

            //* Libreta -------------------------------------  */
            TarjetaProducto(
              nombre: "Libreta", 
              precio: 5, 
              onComprar: comprar
            ),

            //* Camisetas -------------------------------------  */
            TarjetaProducto(
              nombre: "Camiseta", 
              precio: 12, 
              onComprar: comprar
            ),
          ],
        ),
      ),
    );
  }
}
 */
