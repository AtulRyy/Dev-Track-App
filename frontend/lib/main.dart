import 'package:flutter/material.dart';

import 'package:dev_track_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Track App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePag(),
    );
  }
}
