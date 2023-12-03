import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/User.dart';
import 'package:projetmobilev2/models/whishlist.dart';

class WhishListService {
  Future<List<WhishList>> getAllWhishList() async {
    final whishlistRef = FirebaseFirestore.instance.collection('wishlists');
    final querySnapshot = await whishlistRef.get();
    final List<WhishList> whishlist = [];
    for (final whishlistDoc in querySnapshot.docs) {
      final destinationRef =
          whishlistRef.doc(whishlistDoc.id).collection('destinations');
      final destinationSnapshot = await destinationRef.get();

      Destination destination = new Destination(
          id: destinationSnapshot.docs[0].id,
          name: destinationSnapshot.docs[0].get('name'),
          lat: destinationSnapshot.docs[0].get('lat'),
          long: destinationSnapshot.docs[0].get("long"),
          location: destinationSnapshot.docs[0].get("location"),
          description: destinationSnapshot.docs[0].get("description"),
          photo: destinationSnapshot.docs[0].get("photo"),
          rating: destinationSnapshot.docs[0].get("rating"),
          prix: destinationSnapshot.docs[0].get("prix"),
          reviews: []);

      final userRef = whishlistRef.doc(whishlistDoc.id).collection('users');
      final userSnapshot = await userRef.get();

      User user = new User(
          id: userSnapshot.docs[0].id,
          nom: userSnapshot.docs[0].get("nom"),
          prenom: userSnapshot.docs[0].get("prenom"),
          email: userSnapshot.docs[0].get("email"),
          tel: userSnapshot.docs[0].get("tel"),
          mdp: userSnapshot.docs[0].get("mdp"),
          photo: userSnapshot.docs[0].get("photo"));

      WhishList w = new WhishList(
          id: whishlistDoc.id, user: user, destination: destination);
      whishlist.add(w);
    }
    print(whishlist);
    return whishlist;
  }
}
