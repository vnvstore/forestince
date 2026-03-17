import 'package:flutter/material.dart';

import '../../../../shared/theme/app_theme.dart';
import '../../data/model/request_facility_model.dart';

class RequestCard extends StatelessWidget {
  final RequestFacilityModel data;

  const RequestCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Human friendly date + time
    final dt = data.dateTime.toLocal();
    const _months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final month = _months[dt.month - 1];
    final day = dt.day;
    final timeStr = TimeOfDay.fromDateTime(dt).format(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          /// ICON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.meeting_room,
              color: theme.primaryColor,
            ),
          ),

          const SizedBox(width: 12),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.facilityName,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${data.userName} • $month $day, $timeStr',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),

          /// STATUS + ARROW
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildStatus(context, data.status),
              const SizedBox(height: 8),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          )
        ],
      ),
    );
  }

  Widget buildStatus(BuildContext context, RequestStatus status) {
    final theme = Theme.of(context);
    Color color;
    String label;

    switch (status) {
      case RequestStatus.approved:
        color = theme.colorScheme.primary; // use primary (forest green)
        label = 'Approved';
        break;
      case RequestStatus.rejected:
        color = theme.colorScheme.error; // use theme error color
        label = 'Rejected';
        break;
      case RequestStatus.pending:
        color = const Color(0xFFB45309); // amber/orange tone
        label = 'Pending';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
