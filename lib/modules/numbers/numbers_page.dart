import 'package:flutter/material.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Numbers ')),
      body: const Center(
        child: Text('Numbers', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
