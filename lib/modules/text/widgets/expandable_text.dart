import 'package:flutter/material.dart';
import 'package:flutterlab/l10n/app_localizations.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  const ExpandableText({required this.text, this.maxLines = 6, super.key});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;
  bool _isOverflowing = false;

  @override
  void initState() {
    super.initState();
    _checkOverflow();
  }

  @override
  void didUpdateWidget(covariant ExpandableText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _expanded = false;
      _checkOverflow();
    }
  }

  void _checkOverflow() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final textSpan = TextSpan(
        text: widget.text,
        style: Theme.of(context).textTheme.bodyMedium,
      );

      final tp = TextPainter(
        text: textSpan,
        maxLines: widget.maxLines,
        textDirection: TextDirection.ltr,
      );

      tp.layout(
        maxWidth: context.size?.width ?? MediaQuery.of(context).size.width,
      );

      final isOverflowing = tp.didExceedMaxLines;

      if (mounted && isOverflowing != _isOverflowing) {
        setState(() {
          _isOverflowing = isOverflowing;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            maxLines: _expanded ? null : widget.maxLines,
            overflow: _expanded ? null : TextOverflow.ellipsis,
          ),
          if (_isOverflowing)
            GestureDetector(
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _expanded ? l10n.readLess : l10n.readMore,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
