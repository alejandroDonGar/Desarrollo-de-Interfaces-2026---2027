import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.black87,
            alignment: Alignment.center,
            child: CartaAjuste(),
          ),
        ),
      ),
    ),
  );
}

class CartaAjuste extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 220,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(child: Container(color: Colors.white)),
                    Expanded(child: Container(color: Colors.yellow)),
                    Expanded(child: Container(color: Colors.cyan)),
                    Expanded(child: Container(color: Colors.green)),
                    Expanded(child: Container(color: Colors.purpleAccent)),
                    Expanded(child: Container(color: Colors.red)),
                    Expanded(child: Container(color: Colors.blue)),
                  ],
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    '2ºDAM TV'
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Center(
                child: Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  'SIN SEÑAL'
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
