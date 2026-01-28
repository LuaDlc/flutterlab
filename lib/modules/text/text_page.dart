import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Texto', style: TextStyle(fontSize: 18)));
  }
}
