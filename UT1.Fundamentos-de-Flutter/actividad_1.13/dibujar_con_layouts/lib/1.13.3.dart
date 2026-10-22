import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text('Diana')),
      body: Center(
        child:Center(
          child: Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Container(
              height: 240,
              width: 240,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(240),
                ),
              ),
              Container(
              height: 180,
              width: 180,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(180),
                ),
              ),
              Container(
              height: 120,
              width: 120,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(120),
                ),
              ),
              Container(
              height: 60,
              width: 60,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ],
          )
        )
      ),
    ),
  ));
}