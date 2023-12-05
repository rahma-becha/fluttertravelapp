import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/Client.dart';
import 'package:projetmobilev2/models/whishlist.dart';

import 'authService.dart';

class WhishListService {
  Future<List<WhishList>> getAllWhishList() async {
    final userDocument = await FirebaseFirestore.instance
        .collection("clients")
        .where("email",isEqualTo: AuthService().currentUser?.email)
        .get();
    Client user = new Client(
        id: userDocument.docs[0].id,
        nom: userDocument.docs[0].get("nom"),
        prenom: userDocument.docs[0].get("prenom"),
        email: userDocument.docs[0].get("email"),
        tel: userDocument.docs[0].get("tel"),
        mdp: userDocument.docs[0].get("mdp"),
        photo: userDocument.docs[0].get("photo"));
    final querySnapshot = await FirebaseFirestore.instance.collection('wishlists').orderBy(FieldPath.documentId,descending: true).where("client",isEqualTo: user.id).get();
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



      WhishList w = new WhishList(
          id: whishlistDoc.id, client: user, destination: destination);
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
    final userDocument = await FirebaseFirestore.instance
        .collection("clients")
        .where("email",isEqualTo: AuthService().currentUser?.email)
        .get();
    Client user = new Client(
        id: userDocument.docs[0].id,
        nom: userDocument.docs[0].get("nom"),
        prenom: userDocument.docs[0].get("prenom"),
        email: userDocument.docs[0].get("email"),
        tel: userDocument.docs[0].get("tel"),
        mdp: userDocument.docs[0].get("mdp"),
        photo: userDocument.docs[0].get("photo"));
    Map<String, dynamic> data = {
      'destination': destination_id,
      'client':user.id,
    };
    await FirebaseFirestore.instance
        .collection('wishlists')
        .add(data);
  }
}
