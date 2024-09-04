import 'package:flutter/material.dart';

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Horizon',
);

const bottomSheetContainerDecoration =  BoxDecoration(
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(15), topLeft: Radius.circular(15)),
    gradient: LinearGradient(
        colors: [Colors.tealAccent, Colors.blueAccent],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter)
);