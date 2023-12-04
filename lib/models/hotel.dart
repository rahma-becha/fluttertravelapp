import 'package:projetmobilev2/models/Destination.dart';

class Hotel{
  String id;
  String name;
  String nbrEtoile;
  String photo;
  int prixParNuit;
  String description;
  Destination destination;

  Hotel({
   required this.id,
   required this.name,
   required this.nbrEtoile,
   required this.photo,
   required this.prixParNuit,
    required this.description,
   required this.destination
  });
}