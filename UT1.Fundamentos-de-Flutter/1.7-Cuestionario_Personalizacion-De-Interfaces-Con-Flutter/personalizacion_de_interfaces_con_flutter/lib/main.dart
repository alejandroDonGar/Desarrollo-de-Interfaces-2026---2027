import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff121212),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.headphones, size: 60, color: Color(0xffffb703)),
              SizedBox(height: 20),
              Text(
                'NIGHT DRIVE',
                style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)
              ),
              Text(
                'The Midnight Waves',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 30),
              Card(
                color: Color(0xff1e1e1e),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.skip_previous, size: 36, color: Colors.white),
                      Icon(Icons.play_circle, size: 64, color: Color(0xffffb703)),
                      Icon(Icons.skip_next, size: 36, color: Colors.white),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'AÑADIR A FAVORITOS',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}