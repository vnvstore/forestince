import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_english/src/features/dashboard/presentation/widget/dashboard_header.dart';
import '../../../shared/widgets/drawer.dart';

class ReportScreen extends ConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            ],
          ),
        ));
  }
}
