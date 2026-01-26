import 'package:flutter/material.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Media ')),
      body: const Center(child: Text('Media', style: TextStyle(fontSize: 18))),
    );
  }
}
