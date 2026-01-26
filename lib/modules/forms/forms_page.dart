import 'package:flutter/material.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forms ')),
      body: const Center(child: Text('Forms', style: TextStyle(fontSize: 18))),
    );
  }
}
