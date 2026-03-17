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

  @override
  String get totalBookings => 'Total Bookings';

  @override
  String get activeFacilities => 'Active Facilities';

  @override
  String get registeredUsers => 'Registered Users';

  @override
  String get pendingRequests => 'Pending Requests';

  @override
  String get recentBookings => 'Recent Bookings';

  @override
  String get viewAll => 'View All';

  @override
  String get addBooking => '+ Booking';

  @override
  String get statusConfirmed => 'Confirmed';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusNew => 'New';

  @override
  String get facilityUsage => 'Facility Usage';

  @override
  String get bookingBy => 'Booked by';

  @override
  String get bookingTime => 'Booking Time';
}
