import 'package:flutter/material.dart';
import 'package:nexus_english/src/shared/widgets/media.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../shared/theme/app_theme.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      color: Colors.white,
      child: Row(
        children: [
          /// MENU ICON
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),

          const Spacer(),

          /// TITLE
          Text(
            AppLocalizations.of(context)!.appName,
            style: AppTheme.appBarTitle,
          ),

          const Spacer(),

          /// RIGHT ACTIONS
          Row(
            children: [
              /// NOTIFICATION
              Stack(
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 24,
                    color: Colors.black87,
                  ),

                  /// RED DOT
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 12),

              /// AVATAR
              buildAvatar(),
            ],
          ),
        ],
      ),
    );
  }
}
