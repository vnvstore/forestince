class BookingModel {
  final String id;
  final String name;
  final String facility;
  final String time;
  final BookingStatus status;

  BookingModel(
      {required this.id,
      required this.name,
      required this.facility,
      required this.time,
      required this.status});
}

enum BookingStatus { confirmed, pending, completed }
