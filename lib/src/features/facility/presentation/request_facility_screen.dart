import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_english/src/features/facility/domain/request_facility_filter_controller.dart';
import 'package:nexus_english/src/features/facility/domain/request_facility_controller.dart';
import 'package:nexus_english/src/features/facility/presentation/widget/request_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../shared/theme/app_theme.dart';
import '../data/model/request_facility_model.dart';

class RequestFacilityScreen extends ConsumerStatefulWidget {
  const RequestFacilityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      RequestFacilityScreenState();
}

class RequestFacilityScreenState extends ConsumerState<RequestFacilityScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  /// BACK BUTTON
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: theme.iconTheme.color ?? Colors.black87,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    tooltip: 'Back',
                  ),

                  /// TITLE
                  Text(
                    'Request Facility',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// BODY
          Expanded(
            child: Container(
              color: theme.scaffoldBackgroundColor,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  buildSearch(),
                  const SizedBox(height: 16),

                  buildFilter(context),

                  const SizedBox(height: 20),

                  /// LIST
                  Expanded(
                    child: buildRequestList(),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  /// REQUEST LIST
  buildRequestList() {
    final theme = Theme.of(context);
    return ref.watch(requestFacilityControllerProvider).when(
          data: (requests) {
            if (requests.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text('No requests found',
                      style: theme.textTheme.bodyMedium),
                ),
              );
            }

            return ListView.separated(
              itemCount: requests.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                RequestFacilityModel item = requests[index];
                return RequestCard(
                  data: item,
                );
              },
            );
          },
          loading: () => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          error: (err, stack) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.genericError,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.colorScheme.error),
              ),
            ),
          ),
        );
  }

  /// SEARCH
  Widget buildSearch() {
    return TextField(
      onChanged: (value) {
        ref
            .read(requestFacilityFilterControllerProvider.notifier)
            .setKeyword(value);
      },
      decoration: InputDecoration(
        hintText: 'Search facility...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.borderColor),
        ),
      ),
    );
  }

  /// FILTER
  Widget buildFilter(BuildContext ctx) {
    return Row(
      children: [
        buildChip(ref, 'All', null),
        const SizedBox(width: 8),
        buildChip(ref, 'Pending', RequestStatus.pending),
        const SizedBox(width: 8),
        buildChip(ref, 'Approved', RequestStatus.approved),
        const SizedBox(width: 8),
        buildChip(ref, 'Rejected', RequestStatus.rejected),
      ],
    );
  }

  Widget buildChip(
    WidgetRef ref,
    String text,
    RequestStatus? status,
  ) {
    final filter = ref.watch(requestFacilityFilterControllerProvider);
    final selected = filter.status == status;

    return GestureDetector(
      onTap: () {
        ref
            .read(requestFacilityFilterControllerProvider.notifier)
            .setStatus(status);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
