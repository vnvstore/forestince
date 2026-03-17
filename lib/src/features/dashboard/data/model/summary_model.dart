class SummaryModel {
  final String totalBookings;
  final String totalBookingsPercentage;
  final String activeFacilities;
  final String activeFacilitiesPercentage;

  final String registeredUsers;
  final String registeredUsersPercentage;
  final String pendingRequests;
  final String pendingRequestsStatus;

  SummaryModel({
    required this.totalBookings,
    required this.totalBookingsPercentage,
    required this.activeFacilities,
    required this.activeFacilitiesPercentage,
    required this.registeredUsers,
    required this.registeredUsersPercentage,
    required this.pendingRequests,
    required this.pendingRequestsStatus,
  });
}
