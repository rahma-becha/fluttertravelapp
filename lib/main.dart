import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetmobilev2/welcome_screen.dart';
import 'package:faker/faker.dart';

void main() {
  final faker = Faker();

  // Generate user profile data
  final userProfile = {
    'name': faker.person.firstName(),
    'lastName': faker.person.lastName(),
    'email': faker.internet.email(),
    'phone': faker.phoneNumber,
    'address': faker.address.streetAddress(),
    'city': faker.address.city(),
    'state': faker.address.state(),
    'zipCode': faker.address.zipCode(),
    'avatar': faker.image.image(),
  };

  // Generate destination data
  final destination = {
  'name': faker.address.city(),
  'location': faker.address.city(),
  'description': faker.lorem,
  'photos': [faker.image.image()],
  };

  // Generate booking data
  final booking = {
    'bookingDate': faker.date,
    'travelDates': [
      faker.date,
      faker.date,
    ],
   // 'numberTravelers': faker.randomGenerator({),
   /* 'totalPrice': faker.random.double(
      max: 1000.0,
      min: 0.0,
      fixedDigits: 2,
    ),*/
  };

  // Generate review data
  final review = {
    'reviewerName': faker.person.firstName(),
    //'rating': faker.random.number(between: 1, max: 5),
    'reviewText': faker.lorem,
  };

  // Generate flight data
/*  final flight = {
    //'flightNumber': faker.random.number(between: 1000, max: 9999),
    'airline': faker.company.name(),
    'departureTime': faker.date(min: DateTime.now(), max: DateTime.now().add(Duration(days: 365))),
    'arrivalTime': faker.dateTime(min: DateTime.now(), max: DateTime.now().add(Duration(days: 365))),
    'price': faker.random.double(
      max: 1000.0,
      min: 0.0,
      fixedDigits: 2,
    ),
  };*/

  // Generate hotel data
  /*final hotel = {
    'hotelName': faker.company.name(),
    'location': faker.address.city(),
    'description': faker.lorem,
    'price': faker.Random.double(
    max: 1000.0,
    min: 0.0,
    fixedDigits: 2,
    ),
  };*/
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEDF2F6),
    ),

    home: WelcomeScreen()
    );
  }
}

