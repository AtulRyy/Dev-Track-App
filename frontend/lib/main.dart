import 'package:dev_track_app/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev/Track',
      debugShowCheckedModeBanner: false,
      home:  HomePag(),
    );
  }
}
