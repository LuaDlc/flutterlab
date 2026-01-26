import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Texto')),
      body: const Center(child: Text('Texto', style: TextStyle(fontSize: 18))),
    );
  }
}
