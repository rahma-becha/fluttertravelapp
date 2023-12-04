import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/User.dart';
import 'package:projetmobilev2/models/hotel.dart';

class Reservation {
  String id;
  String date;
  int nbrPersonne;
  Destination destination;
  Hotel hotel;
  User user;
  Reservation(
      {required this.id,
      required this.date,
      required this.nbrPersonne,
      required this.destination,
      required this.hotel,
      required this.user});
}
