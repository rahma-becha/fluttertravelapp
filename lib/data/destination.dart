import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:projetmobilev2/data/review.dart';
import '../models/Destination.dart';
import 'dart:math';
final faker = new Faker();
List<Destination> destinationList = [
  Destination(
      id: "1",
      name: faker.address.city(),
      location: "Sit amet nisl suscipit",
      lat: faker.geo.latitude(),
      long: faker.geo.longitude(),
      description: "Sit amet nisl suscipit adipiscing",
      photo: "assets/city1.jpg",
      rating: new Random().nextInt(5) + 1,
      prix: 55,
       reviews: reviewList
  ),
  Destination(
      id: "2",
      name: faker.address.city(),
      location: "Sit amet nisl suscipit",
      lat: faker.geo.latitude(),
      long: faker.geo.longitude(),
      description: "Sit amet nisl suscipit adipiscing",
      photo: "assets/city2.jpg",
      rating: new Random().nextInt(5) + 1,
      prix: 55,
      reviews: reviewList),
  Destination(
      id: "3",
      name: faker.address.city(),
      location: "Sit amet nisl suscipit",
      lat: faker.geo.latitude(),
      long: faker.geo.longitude(),
      description: "Sit amet nisl suscipit adipiscing",
      photo: "assets/city3.jpg",
      rating: new Random().nextInt(5) + 1,
      prix: 55,
      reviews: reviewList),
  Destination(
      id: "4",
      name: faker.address.city(),
      location: "Sit amet nisl suscipit",
      lat: faker.geo.latitude(),
      long: faker.geo.longitude(),
      description: "Sit amet nisl suscipit adipiscing",
      photo: "assets/city4.jpg",
      rating: new Random().nextInt(5) + 1,
      prix: 55,
      reviews: reviewList),
  Destination(
      id: "5",
      name: faker.address.city(),
      location: "Sit amet nisl suscipit",
      lat: faker.geo.latitude(),
      long: faker.geo.longitude(),
      description: "Sit amet nisl suscipit adipiscing",
      photo: "assets/city5.jpg",
      rating: new Random().nextInt(5) + 1,
      prix: 55,
      reviews: reviewList),
  Destination(
      id: "6",
      name: faker.address.city(),
      location: "Sit amet nisl suscipit",
      lat: faker.geo.latitude(),
      long: faker.geo.longitude(),
      description: "Sit amet nisl suscipit adipiscing",
      photo: "assets/city6.jpg",
      rating: new Random().nextInt(5) + 1,
      prix: 55,
      reviews: reviewList)

];
