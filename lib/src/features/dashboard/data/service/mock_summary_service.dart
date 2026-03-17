import 'dart:async';
import '../model/summary_model.dart';

class MockSummaryService {
  static final SummaryModel _mockSummary = SummaryModel(
    totalBookings: '1,248',
    totalBookingsPercentage: '+12%',
    activeFacilities: '34',
    activeFacilitiesPercentage: '',
    registeredUsers: '8,192',
    registeredUsersPercentage: '+5.2%',
    pendingRequests: '12',
    pendingRequestsStatus: 'New',
  );

  Future<SummaryModel> fetchSummary() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockSummary;
  }
}
