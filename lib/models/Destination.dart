import 'dart:ffi';

import 'package:projetmobilev2/models/Review.dart';

class Destination {
  String id;
  String name;
  String location;
  double lat;
  double long;
  String description;
  String photo;
  double rating;
  int prix;
  List<Review> reviews;
  Destination(
      {required this.id,
      required this.name,
      required this.lat,
      required this.long,
      required this.location,
      required this.description,
      required this.photo,
      required this.rating,
      required this.prix,
      required this.reviews});
  factory Destination.fromMap(Map<String, dynamic> data) {
    return Destination(
        id: data["id"],
        name: data['name'],
        lat: data['lat'],
        long: data["long"],
        location: data["location"],
        description: data["description"],
        photo: data["photo"],
        rating: data["rating"],
        prix: data["prix"],
        reviews: []);
  }
}
