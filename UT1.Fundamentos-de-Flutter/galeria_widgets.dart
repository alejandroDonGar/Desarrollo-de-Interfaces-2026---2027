// Galería de los widgets de la UT1.
// Cópialo entero en https://dartpad.dev (botón "Run") para ver cómo se renderiza cada widget.
// Cada tarjeta = un widget del temario con su nombre arriba.
// (Las imágenes de Apuntes-UT1.md se generan a partir de esta misma lista).

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Galería UT1 · Widgets')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        // ListView (aún no visto en clase) = una Column que hace scroll si no cabe.
        body: ListView(
          padding: EdgeInsets.all(12),
          // "for" dentro de la lista: crea una tarjeta por cada ejemplo.
          children: [
            for (final e in ejemplos().entries) seccion(e.key, e.value),
          ],
        ),
      ),
    ),
  );
}

// Nombre del widget → ejemplo de uso.
Map<String, Widget> ejemplos() => {
      'Text': Text('Harry Potter'),
      'Icon': Icon(Icons.school, size: 60),
      'Image.network': Image.network('https://picsum.photos/id/1015/400/150', height: 150),
      'ElevatedButton': ElevatedButton(onPressed: () {}, child: Text('ACEPTAR')),
      'ElevatedButton desactivado (onPressed: null)': ElevatedButton(onPressed: null, child: Text('ACEPTAR')),
      'IconButton': IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
      'CircleAvatar': CircleAvatar(child: Icon(Icons.person)),
      'Divider': Column(
        children: [
          Text('Datos personales'),
          Divider(),
          Text('Datos de contacto'),
        ],
      ),
      'Card': Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(Icons.person),
              Text('Harry Potter'),
              Text('Estudiante de DAM'),
            ],
          ),
        ),
      ),
      'ListTile': ListTile(
        leading: Icon(Icons.email),
        title: Text('Correo electrónico'),
        subtitle: Text('harry@email.com'),
      ),
      'Column': Column(
        children: [
          Icon(Icons.person),
          Text('Harry Potter'),
          Text('harry@email.com'),
        ],
      ),
      'Row': Row(
        children: [
          Icon(Icons.email),
          Text('harry@email.com'),
        ],
      ),
      'mainAxisAlignment start': fila(MainAxisAlignment.start),
      'mainAxisAlignment center': fila(MainAxisAlignment.center),
      'mainAxisAlignment end': fila(MainAxisAlignment.end),
      'mainAxisAlignment spaceBetween': fila(MainAxisAlignment.spaceBetween),
      'mainAxisAlignment spaceAround': fila(MainAxisAlignment.spaceAround),
      'mainAxisAlignment spaceEvenly': fila(MainAxisAlignment.spaceEvenly),
      'crossAxisAlignment start': Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Laura Pérez'),
          Text('2.º DAM'),
          Text('Desarrollo de Interfaces'),
        ],
      ),
      'Center': Container(
        height: 80,
        color: Colors.grey.shade200,
        child: Center(child: Text('Hola Flutter')),
      ),
      'Padding': Container(
        color: Colors.grey.shade200, // gris = el espacio del Padding
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(color: Colors.amber, child: Text('Hola Flutter')),
        ),
      ),
      'SizedBox hueco': Column(
        children: [
          Text('Nombre'),
          SizedBox(height: 20),
          Text('Correo'),
        ],
      ),
      'SizedBox tamaño fijo': SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(onPressed: () {}, child: Text('ENTRAR')),
      ),
      'Expanded flex': Row(
        children: [
          Expanded(flex: 1, child: caja('A  (flex: 1)', Colors.blue.shade200)),
          Expanded(flex: 2, child: caja('B  (flex: 2)', Colors.green.shade200)),
        ],
      ),
      'SizedBox vs Spacer': Column(
        children: [
          Row(children: [Text('Inicio'), SizedBox(width: 30), Text('Fin      (SizedBox de 30)')]),
          Divider(),
          Row(children: [Text('Inicio'), Spacer(), Text('Fin      (Spacer)')]),
        ],
      ),
      'Stack y Positioned': Stack(
        children: [
          // Capa de abajo: hace de "imagen"
          Container(height: 120, color: Colors.blueGrey.shade200, child: Center(child: Text('IMAGEN'))),
          // Capa de encima: 10 desde arriba y 10 desde la derecha
          Positioned(top: 10, right: 10, child: Icon(Icons.favorite, color: Colors.red)),
        ],
      ),
      'Wrap y Chip': Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final t in ['HTML', 'CSS', 'Flutter', 'Dart', 'Python', 'Java', 'Kotlin']) Chip(label: Text(t)),
        ],
      ),
      'Container': Container(
        color: Colors.grey.shade200, // gris = el margin
        child: Container(
          width: 250,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(16), // ámbar = el padding + el contenido
          color: Colors.amber,
          child: Text('Desarrollo de Interfaces'),
        ),
      ),
      'Ejemplo Hermione': hermione(),
    };

// Tarjeta con el nombre del widget arriba y el ejemplo debajo.
Widget seccion(String nombre, Widget ejemplo) {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nombre, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
          SizedBox(height: 8),
          ejemplo,
        ],
      ),
    ),
  );
}

// Tres cuadrados en una fila gris para comparar los valores de mainAxisAlignment.
Widget fila(MainAxisAlignment alineacion) {
  return Container(
    color: Colors.grey.shade200,
    child: Row(
      mainAxisAlignment: alineacion,
      children: [cuadrado(), cuadrado(), cuadrado()],
    ),
  );
}

Widget cuadrado() => Container(width: 30, height: 30, margin: EdgeInsets.all(4), color: Colors.indigo);

Widget caja(String texto, Color color) => Container(height: 40, color: color, child: Center(child: Text(texto)));

// La tarjeta de Hermione de la sesión 4 (árbol → código).
Widget hermione() {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(child: Icon(Icons.person)),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hermione Granger'),
                  Text('Estudiante de DAM'),
                ],
              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('hermione@hogwarts.edu'),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('VER PERFIL')),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            ],
          ),
        ],
      ),
    ),
  );
}
