import 'package:projetmobilev2/models/Client.dart';

import 'Destination.dart';

class Review{
  String id;
  String review;
  int rating;
  Client client;
  Destination destination;
  Review({required this.id,required this.review,required this.rating,required this.client,required this.destination});

}