import 'package:flutter/material.dart';

class CircleLogo extends StatelessWidget {
  final Widget child;
  const CircleLogo({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Container(
      height: 28,
      width: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: cs.surface,
        shape: BoxShape.circle,
        border: Border.all(
          color: cs.onSurface.withOpacity(0.12),
        ),
      ),
      child: child,
    );
  }
}
