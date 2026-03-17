import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text(AppLocalizations.of(context)!.appName)),
          ListTile(title: Text(AppLocalizations.of(context)!.dashboardTitle)),
          ListTile(title: Text(AppLocalizations.of(context)!.facilityTitle)),
          ListTile(title: Text(AppLocalizations.of(context)!.userTitle)),
          ListTile(title: Text(AppLocalizations.of(context)!.reportTitle)),
        ],
      ),
    );
  }
}
