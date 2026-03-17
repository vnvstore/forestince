enum RequestStatus {
  pending,
  approved,
  rejected,
}

class RequestFacilityModel {
  final String id;
  final String facilityName;
  final String userName;
  final DateTime dateTime;
  final RequestStatus status;

  RequestFacilityModel({
    required this.id,
    required this.facilityName,
    required this.userName,
    required this.dateTime,
    required this.status,
  });
}
