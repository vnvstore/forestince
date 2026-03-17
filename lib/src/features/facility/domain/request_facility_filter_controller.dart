import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/model/request_facility_model.dart';

part 'request_facility_filter_controller.g.dart';

class RequestFacilityFilterState {
  final RequestStatus? status;
  final String keyword;

  const RequestFacilityFilterState({
    this.status,
    this.keyword = '',
  });

  RequestFacilityFilterState copyWith({
    RequestStatus? status,
    String? keyword,
  }) {
    return RequestFacilityFilterState(
      status: status ?? this.status,
      keyword: keyword ?? this.keyword,
    );
  }
}

@riverpod
class RequestFacilityFilterController
    extends _$RequestFacilityFilterController {
  @override
  RequestFacilityFilterState build() {
    /// ✅ DEFAULT = Pending
    return const RequestFacilityFilterState(
      status: RequestStatus.pending,
      keyword: '',
    );
  }

  void setStatus(RequestStatus? status) {
    // When user taps "All" we intentionally set status to null.
    // Using copyWith(status: null) would keep the previous non-null value
    // because copyWith treats null as "no change". Set the state
    // explicitly to allow clearing the filter.
    state = RequestFacilityFilterState(status: status, keyword: state.keyword);
  }

  void setKeyword(String keyword) {
    state = state.copyWith(keyword: keyword);
  }

  void clear() {
    state = const RequestFacilityFilterState(
      status: RequestStatus.pending,
      keyword: '',
    );
  }
}
