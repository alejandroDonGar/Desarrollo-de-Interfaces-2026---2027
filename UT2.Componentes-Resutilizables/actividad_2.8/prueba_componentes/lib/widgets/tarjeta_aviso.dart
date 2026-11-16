import 'package:flutter/material.dart';

class TarjetaAviso extends StatelessWidget {
  final String mensaje;
  final IconData icono;
  final Color color;
  final VoidCallback? alCerrar;

  const TarjetaAviso({
    super.key,
    required this.mensaje,
    this.icono = Icons.info,
    this.color = Colors.blue,
    this.alCerrar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icono, color: color),
            const SizedBox(width: 12),
            Expanded(child: Text(mensaje)),
            if (alCerrar != null)
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: alCerrar,
              ),
          ],
        ),
      ),
    );
  }
}