import 'package:flutter/material.dart';

class UsageItem extends StatelessWidget {
  final String title;
  final double percent;

  const UsageItem({super.key, required this.title, required this.percent});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xff475569),
              ),
            )),
            Text(
              '${(percent * 100).round()}%',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Color(0xff0F172A),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: percent,
            minHeight: 10,
            backgroundColor: const Color(0xFFE5E7EB),
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
