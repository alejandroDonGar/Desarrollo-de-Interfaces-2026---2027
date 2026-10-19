import 'package:flutter/material.dart';
import 'package:primer_widget/screens/pantalla_avisos.dart';

//* Esta practica esta siguiendo 'UT 2 Componentes Reutilizables' desde el punto 1.2 'NUESTRO PRIMER WIDGET PRIPIO'
//* -----------------------------------------------------------------------------------------------------------------------
//* Paso 1 - Refacto 'Extract Widget' para sacar el 'card' y crear su propio funcion 'TarjetaAviso'
//* Paso 2 - Ahora creamos un *constructor* para 'TarjetaAviso' y declaramos propiedades
//* Paso 3 - Creampos esta estrcutura: 
//?                   ib/
//?                    ├── main.dart -> Importamos la nueva clase con la funcion del paso 4
//?                    ├── screens/
//?                    │ └── pantalla_avisos.dart -> Movemos la funcion del paso 4 aquí
//?                    └── widgets/
//?                     └── tarjeta_aviso.dart -> Movemos la funcion del paso 1 y 2 aquí
//* Paso 4 - Hacemos lo mismo que el paso 1 pero con 'schafold' y movemos la funcion a la nueva clase 'pantalla_avisos.dart'

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantallaAvisos(),
    );
  }
}

//* Codigo original
// 
// import 'package:flutter/material.dart';
// 
// void main() {
//   runApp(const MiAplicacion());
// }
// class MiAplicacion extends StatelessWidget {
//   const MiAplicacion({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//         title: const Text('Mis avisos'),
//         ),
//         body: Center(
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 Icon(Icons.info, color: Colors.blue),
//                 SizedBox(width: 12),
//                 Text('Recuerda guardar los cambios'),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

