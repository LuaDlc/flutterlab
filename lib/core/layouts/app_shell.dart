import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: const AppDrawer(), body: child);
  }
}
