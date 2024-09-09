import 'package:flutter/material.dart';
import 'package:dev_track_app/pages/home.dart'; // Import your HomePage here
import 'package:dev_track_app/pages/splashscreen.dart'; // Import your Splash screen here

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
      debugShowCheckedModeBanner: false,
      home: const Splash(), // Set the initial home to the Splash screen
    );
  }
}
