import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/booking_button.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/booking_item.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/dashboard_header.dart';
import 'package:nexus_english/l10n/app_localizations.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/section_title.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/summary_row.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/usage_item.dart';
import 'package:nexus_english/src/shared/utils/media.dart';
import '../../../shared/constants/app_sizes.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/drawer.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
        appBar: null,
        drawer: CustomDrawer(),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: DashboardHeader(),
              ),
              Expanded(
                  child: Container(
                color: theme.scaffoldBackgroundColor,
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verDis10,

                      /// Summary Cards
                      SummaryRow(
                        title: AppLocalizations.of(context)!.totalBookings,
                        value: '1,248',
                        icon: buildTotalBookingsIcon(context),
                        percentage: "+12%",
                      ),

                      verDis12,

                      SummaryRow(
                        title: AppLocalizations.of(context)!.activeFacilities,
                        value: '34',
                        icon: buildActiveFacilitiesIcon(context),
                      ),

                      verDis12,

                      SummaryRow(
                        title: AppLocalizations.of(context)!.registeredUsers,
                        value: '8,192',
                        icon: buildRegisteredUsersIcon(context),
                        percentage: "+5.2%",
                      ),

                      verDis12,

                      SummaryRow(
                        title: AppLocalizations.of(context)!.pendingRequests,
                        value: '12',
                        icon: buildPendingRequestsIcon(context),
                        percentage: "New",
                      ),

                      verDis12,
                      verDis20,

                      /// 🔥 RECENT BOOKINGS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          sectionTitle(context,
                              AppLocalizations.of(context)!.recentBookings),
                          Spacer(),
                          BookingButton(onPressed: () {}),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            AppLocalizations.of(context)!.viewAll,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: cs.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      verDis12,

                      const BookingItem(
                        name: 'Birch Meditation Hut',
                        facility: 'Marcus Arvidson',
                        time: 'Oct 24, 09:00 AM',
                        status: Status.confirmed,
                      ),
                      verDis12,
                      const BookingItem(
                        name: 'Crystal Spring Bath',
                        facility: 'Sarah Jenkins',
                        time: 'Oct 24, 11:30 AM',
                        status: Status.pending,
                      ),
                      verDis12,
                      const BookingItem(
                        name: 'Old Oak Forest Trail',
                        facility: 'Erik Nilsson',
                        time: 'Oct 23, 02:00 PM',
                        status: Status.completed,
                      ),

                      const SizedBox(height: 24),

                      /// 🔥 FACILITY USAGE
                      Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppTheme.borderColor,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withValues(alpha: 0.05), // 5%
                                  offset: const Offset(0, 1), // X=0, Y=1
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sectionTitle(context,
                                  AppLocalizations.of(context)!.facilityUsage),
                              verDis20,
                              const UsageItem(
                                  title: 'Old Oak Forest Trail', percent: 0.84),
                              verDis20,
                              const UsageItem(
                                  title: 'Zen Garden Deck', percent: 0.72),
                              verDis20,
                              const UsageItem(
                                  title: 'Silent Retreat Pods', percent: 0.61),
                              verDis20,
                              const UsageItem(
                                  title: 'Crystal Spring', percent: 0.48),
                            ],
                          )),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}
