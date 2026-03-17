import 'dart:async';
import 'package:nexus_english/src/features/dashboard/data/model/booking_model.dart';

class MockBookingService {
  // Updated mock data to match the design (Screenshot 2026-03-17)
  static final List<BookingModel> _mockBookings = [
    BookingModel(
      id: '1',
      name: 'Birch Meditation Hut',
      facility: 'Marcus Arvidson',
      time: 'Oct 24, 09:00 AM',
      status: BookingStatus.confirmed,
    ),
    BookingModel(
      id: '2',
      name: 'Crystal Spring Bath',
      facility: 'Sarah Jenkins',
      time: 'Oct 24, 11:30 AM',
      status: BookingStatus.pending,
    ),
    BookingModel(
      id: '3',
      name: 'Old Oak Forest Trail',
      facility: 'Erik Nilsson',
      time: 'Oct 23, 02:00 PM',
      status: BookingStatus.completed,
    ),
  ];

  /// Fetches the list of recent bookings with a simulated network delay.
  Future<List<BookingModel>> fetchBookings() async {
    // Simulate network latency to demonstrate loading states (SpinKit)
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockBookings;
  }
}
