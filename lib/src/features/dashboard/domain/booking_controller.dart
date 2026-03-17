import 'package:nexus_english/src/features/dashboard/data/model/booking_model.dart';
import 'package:nexus_english/src/features/dashboard/data/service/mock_booking_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'booking_controller.g.dart';

@riverpod
class BookingController extends _$BookingController {
  final _service = MockBookingService();

  @override
  FutureOr<List<BookingModel>> build() async {
    return await _service.fetchBookings();
  }
}
