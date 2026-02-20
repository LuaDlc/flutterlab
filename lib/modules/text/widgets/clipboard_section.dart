import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlab/l10n/app_localizations.dart';

class ClipboardSection extends StatefulWidget {
  const ClipboardSection({super.key});

  @override
  State<ClipboardSection> createState() => _ClipboardSectionState();
}

class _ClipboardSectionState extends State<ClipboardSection> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _copyText() async {
    if (_controller.text.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: _controller.text));

    if (!mounted) return;

    _controller.clear();

    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Texto copiado!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _pasteText() async {
    final data = await Clipboard.getData('text/plain');

    if (data != null && data.text != null) {
      _controller.text = data.text!;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.clipboardTitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Digite algo',
          ),
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            ElevatedButton(
              onPressed: _controller.text.isEmpty ? null : _copyText,
              child: Text(l10n.copy),
            ),
            const SizedBox(width: 12),
            ElevatedButton(onPressed: _pasteText, child: Text(l10n.paste)),
          ],
        ),
      ],
    );
  }
}
