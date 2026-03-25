import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_english/src/features/dashboard/domain/booking_controller.dart';
import 'package:nexus_english/src/features/dashboard/domain/facility_controller.dart';
import 'package:nexus_english/src/features/dashboard/domain/summary_controller.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/booking_button.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/booking_item.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/dashboard_header.dart';
import 'package:nexus_english/l10n/app_localizations.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/section_title.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/summary_row.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/usage_item.dart';
import 'package:nexus_english/src/shared/constants/media.dart';
import 'package:nexus_english/src/shared/utils/media.dart';
import '../../../routing/app_router.dart';
import '../../../shared/constants/app_sizes.dart';
import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/drawer.dart';
import '../../booking/presentation/add_booking_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => DashboardScreenState();
}

class DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                      buildSummarySection(),

                      verDis12,
                      verDis20,

                      /// 🔥 RECENT BOOKINGS
                      buildRecentBookingsSection(context),

                      const SizedBox(height: 24),

                      /// 🔥 FACILITY USAGE
                      buildFacilitiesSection(context),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ));
  }

  // region Widget Builders

  Widget buildSummarySection() {
    final theme = Theme.of(context);
    return ref.watch(summaryControllerProvider).when(
          data: (summary) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SummaryRow(
                title: AppLocalizations.of(context)!.totalBookings,
                value: summary.totalBookings,
                icon: buildTotalBookingsIcon(context),
                percentage: summary.totalBookingsPercentage,
              ),
              verDis12,
              SummaryRow(
                title: AppLocalizations.of(context)!.activeFacilities,
                value: summary.activeFacilities,
                icon: buildActiveFacilitiesIcon(context),
              ),
              verDis12,
              SummaryRow(
                title: AppLocalizations.of(context)!.registeredUsers,
                value: summary.registeredUsers,
                icon: buildRegisteredUsersIcon(context),
                percentage: summary.registeredUsersPercentage,
              ),
              verDis12,
              InkWell(
                onTap: () {
                  context.pushNamed(AppRoute.requestFacility.name);
                },
                child: SummaryRow(
                  title: AppLocalizations.of(context)!.pendingRequests,
                  value: summary.pendingRequests,
                  icon: buildPendingRequestsIcon(context),
                  percentage: summary.pendingRequestsStatus,
                ),
              )
            ],
          ),
          loading: () => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: spinKit,
            ),
          ),
          error: (err, stack) => Center(
            child: Text(
              AppLocalizations.of(context)!.errorLoadingFacilities,
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ),
        );
  }

  Widget buildRecentBookingsSection(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            sectionTitle(context, AppLocalizations.of(context)!.recentBookings),
            Spacer(),
            BookingButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddBookingScreen()),
              );
            }),
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
        ref.watch(bookingControllerProvider).when(
              data: (bookings) => Column(
                children: bookings
                    .map((booking) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: BookingItem(
                            booking: booking,
                          ),
                        ))
                    .toList(),
              ),
              loading: () => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: spinKit,
                ),
              ),
              error: (err, stack) => Center(
                child: Text(
                  AppLocalizations.of(context)!.errorLoadingFacilities,
                  style: TextStyle(color: theme.colorScheme.error),
                ),
              ),
            ),
      ],
    );
  }

  Widget buildFacilitiesSection(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
                color: Colors.black.withValues(alpha: 0.05),
                offset: const Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 0,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle(context, AppLocalizations.of(context)!.facilityUsage),
            verDis20,
            ref.watch(facilityControllerProvider).when(
                  data: (facilities) => Column(
                    children: facilities
                        .map((facility) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: UsageItem(
                                title: facility.name,
                                percent: facility.usagePercentage,
                              ),
                            ))
                        .toList(),
                  ),
                  loading: () => Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: spinKit,
                    ),
                  ),
                  error: (err, stack) => Center(
                    child: Text(
                      AppLocalizations.of(context)!.errorLoadingFacilities,
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ),
                ),
          ],
        ));
  }
// endregion
}
