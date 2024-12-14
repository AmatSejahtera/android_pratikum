import 'package:flutter/material.dart';
import 'scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 01',
      home: StudiKasus01(),
    ); // MaterialApp
  }
}
