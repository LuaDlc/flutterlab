import 'package:flutter/material.dart';
import 'package:flutterlab/app.dart';
import 'package:flutterlab/modules/dashboard/dashboard.dart';

void main() {
  runApp(const FlutterLabApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DashboardPage(),
    );
  }
}
