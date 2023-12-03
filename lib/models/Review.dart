import 'package:projetmobilev2/models/User.dart';

class Review{
  String id;
  String review;
  int rating;
  User user;
  Review({required this.id,required this.review,required this.rating,required this.user});
  factory Review.fromMap(Map<String, dynamic> data) {
    return Review(
      id: data["id"],
      review: data['review'],
      rating: data['rating'],
      user:data["user"]
    );
  }
}