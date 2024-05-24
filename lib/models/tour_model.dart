import 'package:intl/intl.dart';

class Tour {
  String name = '';
  String description = '';
  String image = '';
  double price;
  String currency = '';
  String date = '';
  String location = '';
  String duration = '';

  int id;

  Tour(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.currency,
      required this.date,
      required this.location,
      required this.duration,});

  static fromJson(json) {
    return Tour(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        price: json['price'],
        currency: json['currency'],
        date: json['date'],
        location: json['location'],
        duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'currency': currency,
      'name': name,
      'image': image,
      'date': DateFormat('yyyy-MM-dd').format(DateTime.parse(date)),
      'description': description,
      'duration': duration,
      'location': location,
      'price': price,
    };
  }
}
