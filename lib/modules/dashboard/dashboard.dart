import 'package:flutter/material.dart';
import '../../core/widgets/app_drawer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard - Lógica Dart')),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text(
          'Laboratório de Lógica (Dart Puro)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
