import 'package:projetmobilev2/models/User.dart';

class Review{
  String review;
  int rating;
  User user;
  Review({required this.review,required this.rating,required this.user});
}