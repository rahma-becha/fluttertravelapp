import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/Review.dart';

import '../models/User.dart';

class DestinationService {
  Future<List<Destination>> getAllDestinations() async {
    final destinationsRef =
        FirebaseFirestore.instance.collection('destinations');
    final querySnapshot = await destinationsRef.get();
    final List<Destination> destinations = [];

    for (final DocumentSnapshot destinationDocument in querySnapshot.docs) {

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
      destinations.add(destination);
    }

    return destinations;
  }
}
