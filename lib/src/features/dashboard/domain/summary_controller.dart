import 'package:nexus_english/src/features/dashboard/data/model/summary_model.dart';
import 'package:nexus_english/src/features/dashboard/data/service/mock_summary_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'summary_controller.g.dart';

@riverpod
class SummaryController extends _$SummaryController {
  final _service = MockSummaryService();

  @override
  FutureOr<SummaryModel> build() async {
    return await _service.fetchSummary();
  }
}
