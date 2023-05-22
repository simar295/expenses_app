import 'package:flutter/material.dart';
import './expenses.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: expenses(),
    ),
  );
}
