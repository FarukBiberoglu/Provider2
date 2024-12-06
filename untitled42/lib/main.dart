import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled42/HomePage.dart';
import 'package:untitled42/proS%C4%B1n%C4%B1f%C4%B1.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:  Homepage(),
    );
  }
}
