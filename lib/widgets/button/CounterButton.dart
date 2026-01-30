import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const CounterButton({
    Key? key,
    required this.icon,
    this.enabled = true,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = enabled ? Color(0xFF0056B8) : Colors.grey.shade400;

    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        child: Icon(icon, size: 20, color: color),
      ),
    );
  }
}
