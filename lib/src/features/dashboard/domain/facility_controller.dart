import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/model/facility_model.dart';
import '../data/service/mock_facility_service.dart';

part 'facility_controller.g.dart';

@riverpod
class FacilityController extends _$FacilityController {
  final _service = MockFacilityService();

  @override
  FutureOr<List<FacilityModel>> build() async {
    return await _service.fetchFacilities();
  }
}
