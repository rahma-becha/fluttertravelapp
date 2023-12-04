import 'package:projetmobilev2/models/User.dart';

import 'Destination.dart';

class Review{
  String id;
  String review;
  int rating;
  User user;
  Destination destination;
  Review({required this.id,required this.review,required this.rating,required this.user,required this.destination});

}