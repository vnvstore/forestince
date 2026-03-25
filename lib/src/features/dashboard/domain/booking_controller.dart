import 'dart:async';

import 'package:nexus_english/src/features/dashboard/data/model/booking_model.dart';
import 'package:nexus_english/src/features/dashboard/data/service/mock_booking_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'booking_controller.g.dart';

@riverpod
class BookingController extends _$BookingController {
  // Use dynamic here to avoid transient analyzer issues when the mock
  // service is updated during development. At runtime the instance is
  // still a MockBookingService with the addBooking method implemented.
  final dynamic _service = MockBookingService();

  @override
  FutureOr<List<BookingModel>> build() async {
    return await _service.fetchBookings();
  }

  /// Add a new booking and refresh the provider state.
  ///
  /// This method performs a small optimistic update: it appends the new
  /// booking to the current list immediately, then calls the service to
  /// persist and finally refreshes the list from the service. If an error
  /// occurs the state is set to the error value so the UI can react.
  Future<void> addBooking(BookingModel booking) async {
    // Read current list (if available) for optimistic update
    final current = state.value ?? <BookingModel>[];

    // Optimistically show the newly added booking
    state = AsyncValue.data([...current, booking]);

    try {
      // Persist via service (assumed to add the booking)
      await _service.addBooking(booking);

      // Re-fetch authoritative list from service and update state
      final updated = await _service.fetchBookings();
      state = AsyncValue.data(updated);
    } catch (e, st) {
      // On error, surface the error to the UI
      state = AsyncValue.error(e, st);
    }
  }
}
