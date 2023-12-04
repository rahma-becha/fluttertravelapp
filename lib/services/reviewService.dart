import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetmobilev2/models/Review.dart';

import '../models/Destination.dart';
import '../models/User.dart';

class ReviewService {
  Future<List<Review>> getReviewByDestination(String destination_id) async {
    final List<Review> reviews = [];
    final reviewsSnapshot = await FirebaseFirestore.instance
        .collection('reviews')
        .where("destination", isEqualTo: destination_id)
        .get();
    final destinationDocument = await FirebaseFirestore.instance
        .collection("destinations")
        .doc(destination_id)
        .get();
    Destination destination = new Destination(
        id: destinationDocument.id,
        name: destinationDocument.get('name'),
        lat: destinationDocument.get('lat'),
        long: destinationDocument.get("long"),
        location: destinationDocument.get("location"),
        description: destinationDocument.get("description"),
        photo: destinationDocument.get("photo"),
        rating: destinationDocument.get("rating"),
        prix: destinationDocument.get("prix"),
        reviews: []);
    for (final DocumentSnapshot reviewDocument in reviewsSnapshot.docs) {
      final userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(reviewDocument.get("user"))
          .get();
      User user = new User(
          id: userSnapshot.id,
          nom: userSnapshot.get("nom"),
          prenom: userSnapshot.get("prenom"),
          email: userSnapshot.get("email"),
          tel: userSnapshot.get("tel"),
          mdp: userSnapshot.get("mdp"),
          photo: userSnapshot.get("photo"));
      Review review = new Review(
          id: reviewDocument.id,
          review: reviewDocument.get("review"),
          rating: reviewDocument.get("rating"),
          user: user,
          destination: destination);
      reviews.add(review);
    }
    return reviews;
  }
}
