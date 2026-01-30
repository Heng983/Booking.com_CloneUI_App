import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/button/CounterButton.dart';
import 'package:hotel_app/widgets/color.dart';

class CounterRow extends StatelessWidget {
  final String label;
  final String? subtitle;
  final int value;
  final int min;
  final ValueChanged<int> onChanged;

  const CounterRow({
    Key? key,
    required this.label,
    this.subtitle,
    required this.value,
    required this.onChanged,
    this.min = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = Colors.grey.shade400;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: const TextStyle(fontSize: 12, color: AppColors.grey2),
                ),
              ],
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CounterButton(
                icon: Icons.remove,
                enabled: value > min,
                onTap: () => onChanged(value - 1),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  '$value',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CounterButton(icon: Icons.add, onTap: () => onChanged(value + 1)),
            ],
          ),
        ),
      ],
    );
  }
}
