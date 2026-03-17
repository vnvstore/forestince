class BookingRequest {
  final String facilityName;
  final DateTime date;
  final int peopleCount;
  final String notes;

  BookingRequest({
    required this.facilityName,
    required this.date,
    required this.peopleCount,
    required this.notes,
  });
}
