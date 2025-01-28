import 'package:flutter/material.dart';
import 'Views/help_center_view.dart';
//import 'views/help_center_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fabrica Fashion',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const HelpCenterView(),
    );
  }
}
