import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/Client.dart';
import 'package:projetmobilev2/models/hotel.dart';

class Reservation {
  String id;
  String date;
  int nbrPersonne;
  int nbrJour;
  int prix;
  Destination destination;
  Hotel hotel;
  Client client;
  Reservation(
      {required this.id,
      required this.date,
      required this.nbrPersonne,
        required this.nbrJour,
        required this.prix,
      required this.destination,
      required this.hotel,
      required this.client});
}
