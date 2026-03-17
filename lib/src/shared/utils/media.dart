import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// region Summary Icons
Widget buildSummaryIcon(
  String assetPath, {
  Color? color,
  double width = 20, // fixWidth = 20
}) {
  return SvgPicture.asset(
    assetPath,
    width: width,
    fit: BoxFit.fitWidth,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}

Widget buildTotalBookingsIcon(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF2E7D32).withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    width: 48,
    height: 48,
    child: Center(
      child: buildSummaryIcon(
        'assets/images/icon_total_bookings.svg',
        color: Color(0xff2E7D32),
      ),
    ),
  );
}

Widget buildActiveFacilitiesIcon(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF2E7D32).withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    width: 48,
    height: 48,
    child: Center(
      child: buildSummaryIcon(
        'assets/images/icon_active_facilities.svg',
        color: Color(0xff2E7D32),
      ),
    ),
  );
}

Widget buildRegisteredUsersIcon(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF2E7D32).withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    width: 48,
    height: 48,
    child: Center(
      child: buildSummaryIcon(
        'assets/images/icon_registered_users.svg',
        color: Color(0xff2E7D32),
      ),
    ),
  );
}

Widget buildPendingRequestsIcon(BuildContext context) {
  return Container(
    color: Color(0xFFFEF3C7),
    width: 48,
    height: 48,
    child: Center(
      child: buildSummaryIcon(
        'assets/images/icon_pending_requests.svg',
        color: Color(0xffB45309),
      ),
    ),
  );
}
// endregion Summary Icons

// region Booking Icons

Widget buildBookingIcon(
  String assetPath, {
  Color? color,
  double height = 16,
}) {
  return SvgPicture.asset(
    assetPath,
    height: height,
    fit: BoxFit.fitHeight,
  );
}

Widget buildBookingIconConfirmed() {
  return buildBookingIcon(
    'assets/images/icon_book_confirmed.svg',
  );
}

Widget buildBookingIconPending() {
  return buildBookingIcon(
    'assets/images/icon_book_pending.svg',
  );
}

Widget buildBookingIconCompleted() {
  return buildBookingIcon(
    'assets/images/icon_book_completed.svg',
  );
}
