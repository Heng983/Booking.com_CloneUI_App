import 'package:flutter/material.dart';

class ExpanDableText extends StatefulWidget {
  const ExpanDableText({
    super.key,
    required this.text,
    this.trimLines = 4,
  });

  final String text;
  final int trimLines;

  @override
  State<ExpanDableText> createState() => _ExpanDableTextState();
}

class _ExpanDableTextState extends State<ExpanDableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = theme.colorScheme.onSurface;
    final linkColor = theme.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _expanded ? null : widget.trimLines,
          overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 15,
            height: 1.5,
            color: textColor,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Text(
            _expanded ? "Read less" : "Read more",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: linkColor,
            ),
          ),
        ),
      ],
    );
  }
}
