import 'package:myapp/models/tour_model.dart';

class Booking {
  int id;
  int tourId;
  String userId;
  String date;
  int numberPeople;
  double totalPrice;
  String status;
  Tour? tours;

  Booking(
      {required this.id,
      required this.tourId,
      required this.userId,
      required this.date,
      required this.numberPeople,
      required this.totalPrice,
      required this.status,
      this.tours});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
        id: json['id'],
        tourId: json['tour_id'],
        userId: json['user_id'],
        date: json['date'],
        numberPeople: json['num_people'],
        totalPrice: json['total_price'],
        status: json['status'],
        tours: json['tours'] != null ? Tour.fromJson(json['tours']) : null
        );
  }

  Map<String, dynamic> toJson(
      {id, tourId, userId, date, numberPeople, totalPrice, status}) {
    return {
      "id": id,
      "tourId": tourId,
      "userId": userId,
      "date": date,
      "numberPeople": numberPeople,
      'totalPrice': totalPrice,
      'status': status
    };
  }
}
