import 'package:nexus_english/src/features/facility/data/model/request_facility_model.dart';

class MockRequestFacilityModelService {
  final List<RequestFacilityModel> _data = [
    RequestFacilityModel(
      id: '1',
      facilityName: 'Forest Meeting Room',
      userName: 'John Doe',
      dateTime: DateTime(2026, 10, 24, 9, 0),
      status: RequestStatus.pending,
    ),
    RequestFacilityModel(
      id: '2',
      facilityName: 'Ocean View Hall',
      userName: 'Alice Smith',
      dateTime: DateTime(2026, 10, 25, 14, 0),
      status: RequestStatus.approved,
    ),
    RequestFacilityModel(
      id: '3',
      facilityName: 'Mountain Conference Room',
      userName: 'David Lee',
      dateTime: DateTime(2026, 10, 26, 10, 30),
      status: RequestStatus.rejected,
    ),
    RequestFacilityModel(
      id: '4',
      facilityName: 'Forest Meeting Room',
      userName: 'Emma Brown',
      dateTime: DateTime(2026, 10, 27, 11, 0),
      status: RequestStatus.pending,
    ),
    RequestFacilityModel(
      id: '5',
      facilityName: 'City Center Hall',
      userName: 'Michael Johnson',
      dateTime: DateTime(2026, 10, 28, 15, 0),
      status: RequestStatus.approved,
    ),
    RequestFacilityModel(
      id: '6',
      facilityName: 'Ocean View Hall',
      userName: 'Chris Evans',
      dateTime: DateTime(2026, 10, 29, 16, 0),
      status: RequestStatus.pending,
    ),
    RequestFacilityModel(
      id: '7',
      facilityName: 'Forest Meeting Room',
      userName: 'Sophia Lee',
      dateTime: DateTime(2026, 10, 30, 8, 30),
      status: RequestStatus.rejected,
    ),
  ];

  Future<List<RequestFacilityModel>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _data;
  }
}
