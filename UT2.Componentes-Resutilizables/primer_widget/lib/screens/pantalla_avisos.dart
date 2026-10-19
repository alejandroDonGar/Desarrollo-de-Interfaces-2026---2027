import 'package:flutter/material.dart';
import 'package:primer_widget/widgets/tarjeta_aviso.dart';

class PantallaAvisos extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis avisos')),
      body: Center(
        child: TarjetaAviso(           // Paso 2
          mensaje: "Error al cargar",  // Como es required los setteamos aquí y lo 'nombramos' -> mensaje:
          icono: Icons.info,           // Como es required los setteamos aquí y lo 'nombramos' -> icono:
          ),
      ),
    );
  }
}