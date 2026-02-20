import 'package:flutter/material.dart';
import 'package:flutterlab/modules/text/widgets/dynamic_rich_text.dart';

class RichTextPage extends StatefulWidget {
  const RichTextPage({super.key});

  @override
  State<RichTextPage> createState() => _RichTextPageState();
}

class _RichTextPageState extends State<RichTextPage> {
  double _value = 120.50;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DynamicRichText(username: 'Luana', amount: _value),
            const SizedBox(height: 20),
            Slider(
              value: _value,
              min: -500,
              max: 500,
              divisions: 100,
              label: _value.toStringAsFixed(2),
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
