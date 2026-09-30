import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("LAYOUTS")),
        body: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.account_circle, size: 50),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Text("LAURA PÉREZ"),
                      Text("Desarrollo de Interfaces"),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text("2.ºDAM"),
                      Icon(Icons.settings),
                    ],
                  ),
                ],
              ),
              Card(
                child: SizedBox(
                  height: 90,
                  child: Center(
                    child: Text("MI PROGRESO")
                  ),
                ),
              ),
              Text("MIS MÓDULOS"),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child:Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.phone_android, size: 45),
                          Text("FLUTTER"),
                          Text("8 h"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.language, size: 45),
                          Text("WEB"),
                          Text("12 h"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                child: SizedBox(
                  height: 120,
                  child: Stack(
                    children: [
                      Card(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('RETO SEMANAL'),
                              SizedBox(height: 8),
                              Text('Layout Flutter'),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Icon(Icons.star, size: 28),
                      ),
                    ],
                  ),
                )
              ),
              Row(
                children: [
                  Text("ANTERIOR"),
                  Spacer(),
                  Text("SIGUIENTE"),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
