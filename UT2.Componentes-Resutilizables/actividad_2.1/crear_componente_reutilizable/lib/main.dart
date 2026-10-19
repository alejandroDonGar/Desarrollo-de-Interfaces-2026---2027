import 'package:flutter/material.dart';
import 'package:crear_componente_reutilizable/screens/pantalla_eventos.dart';


//* Cuestionario 2.1: Crear componentes reutilizables
//*-------------------------------------------------

//? Pregunta 1: 
//      Sin modificar el aspecto de la aplicación, extrae la tarjeta repetida a un widget 
//      TarjetaEvento  ¡de tipo StatelessWidget y guárdalo en lib/widgets/tarjeta_evento.dart.
//      Modifica lib/main.dart para importar el componente y utilizarlo tres veces. 
//      Mantén el Scaffold en main.dart en esta fase.

//? Pregunta 2: 
//      Partiendo del resultado anterior, mueve el Scaffold a una nueva clase PantallaEventos 
//      en lib/screens/pantalla_eventos.dart. Deja main.dart encargado únicamente del arranque 
//      y de configurar MaterialApp con home: PantallaEventos(). El archivo del componente 
//       se mantiene.

//? Pregunta 3: 
//      Haz que cada tarjeta muestre un evento diferente. Añade a TarjetaEvento tres propiedades:

//          titulo (String): obligatoria.
//          fecha (String): obligatoria.
//          plazasDisponibles (int): opcional, con valor por defecto 0.

//      Declara las propiedades con final, configura el constructor y muestra sus valores en l
//      a tarjeta. En la pantalla crea estos tres eventos: Taller de Flutter (24 de octubre, 15 plazas), 
//      Introducción a Git (30 de octubre, 8 plazas) y Charla de ciberseguridad (5 de noviembre, 
//      sin indicar plazas para comprobar el valor por defecto).

//? Pretuna 4: 
//      Sin modificar tarjeta_evento.dart ni main.dart, añade una cuarta tarjeta en PantallaEventos 
//      con estos datos:

//          Título: Diseño de interfaces
//          Fecha: 12 de noviembre
//          Plazas disponibles: 20

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaEventos(),
    );
  }
}



