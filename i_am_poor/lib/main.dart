import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text('I AM POOR'),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/cover_2.jpeg'),
          ),
        ),
      ),
    ),
  );
}
