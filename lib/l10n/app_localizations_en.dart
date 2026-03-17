// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appUpdateRequiredTitle => 'App Update Required';

  @override
  String get appUpdateRequiredContent =>
      'Please update to continue using the app.';

  @override
  String get genericError => 'An error occurred';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get facilityTitle => 'Facilities';

  @override
  String get userTitle => 'Users';

  @override
  String get reportTitle => 'Reports';
}
