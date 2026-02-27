import 'package:flutter/material.dart';
import 'package:flutterlab/modules/text/widgets/clipboard_section.dart';
import 'package:flutterlab/modules/text/widgets/dynamic_rich_text.dart';
import 'package:flutterlab/modules/text/widgets/expandable_text.dart';

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
            Padding(
              padding: const EdgeInsets.all(20),
              child: ClipboardSection(),
            ),
            SizedBox(height: 20),
            ExpandableText(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
