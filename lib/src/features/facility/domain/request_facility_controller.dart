import 'package:nexus_english/src/features/facility/data/model/request_facility_model.dart';
import 'package:nexus_english/src/features/facility/data/service/mock_request_facility_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'request_facility_filter_controller.dart';

part 'request_facility_controller.g.dart';

@riverpod
Future<List<RequestFacilityModel>> requestFacilityController(
  Ref ref,
) async {
  final service = MockRequestFacilityModelService();
  final data = await service.fetchAll();

  final filter = ref.watch(requestFacilityFilterControllerProvider);

  return data.where((item) {
    /// FILTER STATUS
    final matchStatus = filter.status == null || item.status == filter.status;

    /// SEARCH
    final keyword = filter.keyword.toLowerCase();

    final matchKeyword = keyword.isEmpty ||
        item.facilityName.toLowerCase().contains(keyword) ||
        item.userName.toLowerCase().contains(keyword);

    return matchStatus && matchKeyword;
  }).toList();
}
