import 'package:flutter/material.dart';

import '../../../../shared/theme/app_theme.dart';

class SummaryRow extends StatelessWidget {
  final Widget icon;
  final String title;
  final String value;
  final String? percentage;

  const SummaryRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppTheme.borderColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05), // 5%
              offset: const Offset(0, 1), // X=0, Y=1
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ICON
          icon,

          const SizedBox(width: 12),

          /// TEXT + BADGE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Title
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Color(0xff64748B),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 6),

                /// VALUE
                Text(
                  value,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0F172A),
                  ),
                ),
              ],
            ),
          ),

          //percentage badge
          if (percentage != null)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: percentage == "New"
                    ? Color(0xFFFEF3C7)
                    : Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                percentage!,
                style: TextStyle(
                  color: percentage == "New"
                      ? Color(0xffB45309)
                      : Color(0xff16A34A),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
