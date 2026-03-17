import 'package:flutter/material.dart';
import 'package:nexus_english/src/shared/utils/media.dart';

class BookingItem extends StatelessWidget {
  final String name;
  final String facility;
  final String time;
  final Status status;

  const BookingItem({
    super.key,
    required this.name,
    required this.facility,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05), // 5%
                offset: const Offset(0, 1), // X=0, Y=1
                blurRadius: 2,
                spreadRadius: 0,
              ),
            ]),
        child: Column(
          children: [
            Row(
              children: [
                //icon
                StatusIcon(status: status),

                const SizedBox(width: 8),

                /// Name
                Expanded(
                  child: Text(
                    name,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),

                /// status
                StatusBadge(status: status),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// facility + time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        facility,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Color(0xFF64748B),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        time,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Color(0xFF64748B),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ));
  }
}

/// ================= STATUS BADGE =================
enum Status { confirmed, pending, completed }

class StatusIcon extends StatelessWidget {
  final Status status;

  const StatusIcon({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.confirmed:
        return buildBookingIconConfirmed();
      case Status.pending:
        return buildBookingIconPending();
      default:
        return buildBookingIconCompleted();
    }
  }
}

class StatusBadge extends StatelessWidget {
  final Status status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color text;

    switch (status) {
      case Status.confirmed:
        bg = const Color(0xFFDCFCE7);
        text = const Color(0xFF15803D);
        break;
      case Status.pending:
        bg = const Color(0xFFFEF3C7);
        text = const Color(0xFFB45309);
        break;
      case Status.completed:
        bg = const Color(0xFFDBEAFE);
        text = const Color(0xFF1D4ED8);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: TextStyle(
          color: text,
          fontWeight: FontWeight.w700,
          fontSize: 10,
        ),
      ),
    );
  }
}
