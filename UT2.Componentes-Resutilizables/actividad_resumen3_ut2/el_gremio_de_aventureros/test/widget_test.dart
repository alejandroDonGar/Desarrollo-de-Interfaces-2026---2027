import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:el_gremio_de_aventureros/complementos/marcador_vida_reto4.dart';

void main() {
  testWidgets('Muestra Vida: 40/100 por defecto', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MarcadorVida(vida: 40, onCurar: (valor) {}),
      ),
    );

    expect(find.text('Vida: 40/100'), findsOneWidget);
  });

  testWidgets('Al pulsar Curar avisa con 50', (tester) async {
    int? recibido;

    await tester.pumpWidget(
      MaterialApp(
        home: MarcadorVida(
          vida: 40,
          onCurar: (nuevaVida) {
            recibido = nuevaVida;
          },
        ),
      ),
    );

    await tester.tap(find.text('Curar'));
    await tester.pump();

    expect(recibido, 50);
  });

  testWidgets('Con vida al máximo no se puede curar', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MarcadorVida(vida: 100, onCurar: (valor) {}),
      ),
    );

    final boton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(boton.onPressed, isNull);
  });
}
