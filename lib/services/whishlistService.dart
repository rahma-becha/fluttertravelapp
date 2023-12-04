import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetmobilev2/data/user.dart';
import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/User.dart';
import 'package:projetmobilev2/models/whishlist.dart';

class WhishListService {
  Future<List<WhishList>> getAllWhishList() async {
    final whishlistRef = FirebaseFirestore.instance.collection('wishlists');
    final querySnapshot = await whishlistRef.get();
    final List<WhishList> whishlist = [];
    for (final whishlistDoc in querySnapshot.docs) {

      final  destinationSnapshot = await FirebaseFirestore.instance.collection('destinations').doc(whishlistDoc.get("destination")).get();

      Destination destination = new Destination(
          id: destinationSnapshot.id,
          name: destinationSnapshot.get('name'),
          lat: destinationSnapshot.get('lat'),
          long: destinationSnapshot.get("long"),
          location: destinationSnapshot.get("location"),
          description: destinationSnapshot.get("description"),
          photo: destinationSnapshot.get("photo"),
          rating: destinationSnapshot.get("rating"),
          prix: destinationSnapshot.get("prix"),
          reviews: []);

      final userSnapshot = await FirebaseFirestore.instance.collection('users').doc(whishlistDoc.get("user")).get();

      User user = new User(
          id: userSnapshot.id,
          nom: userSnapshot.get("nom"),
          prenom: userSnapshot.get("prenom"),
          email: userSnapshot.get("email"),
          tel: userSnapshot.get("tel"),
          mdp: userSnapshot.get("mdp"),
          photo: userSnapshot.get("photo"));

      WhishList w = new WhishList(
          id: whishlistDoc.id, user: user, destination: destination);
      whishlist.add(w);
    }
    return whishlist;
  }


  void deleteFromWhishList(String whishlits_id) async {
    await FirebaseFirestore.instance
        .collection('wishlists')
        .doc(whishlits_id)
        .delete();
  }

  void addToWhishList(String destination_id) async {
    Map<String, dynamic> data = {
      'destination': destination_id,
      'user':user.id,
    };
    await FirebaseFirestore.instance
        .collection('wishlists')
        .add(data);
  }
}
