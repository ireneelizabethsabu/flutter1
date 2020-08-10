import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar (
          title: Text('I AM RICH'),
          backgroundColor: Colors.black45,
        ),
        backgroundColor: Colors.redAccent,
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
