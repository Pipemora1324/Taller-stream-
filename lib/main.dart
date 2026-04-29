import 'package:flutter/material.dart';
import 'presentation/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Live Monitor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const DashboardScreen(),
    );
  }
}