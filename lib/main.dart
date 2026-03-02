import 'package:flutter/material.dart';
import 'package:qltechin_app/design_system/design_system.dart';
import 'package:qltechin_app/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QLTech - Enterprise Solutions',
      theme: DesignSystem.getThemeData(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}