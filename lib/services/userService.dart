import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetmobilev2/data/user.dart';

import '../models/User.dart';

class UserService {
  Future<User> login(String email, String password) async {
    final userSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .where("mdp", isEqualTo: password)
        .get();
    User user = new User(
        id: userSnapshot.docs[0].id,
        nom: userSnapshot.docs[0].get("nom"),
        prenom: userSnapshot.docs[0].get("prenom"),
        email: userSnapshot.docs[0].get("email"),
        tel: userSnapshot.docs[0].get("tel"),
        mdp: userSnapshot.docs[0].get("mdp"),
        photo: userSnapshot.docs[0].get("photo"));
    return user;
  }

  register(User user) async {
    Map<String, dynamic> data = {
      "id": user.id,
      "nom": user.nom,
      "prenom": user.prenom,
      "email": user.email,
      "tel": user.tel,
      "mdp": user.mdp,
      "photo": "assets/person1.jpg"
    };
    await FirebaseFirestore.instance.collection('users').add(data);
  }

  Future<User> getUserInfo() async{
    final userDocument = await FirebaseFirestore.instance
        .collection("users")
        .doc("NS8t8uRv9pAKWf4LGogj")
        .get();
    User user = new User(
        id: userDocument.id,
        nom: userDocument.get("nom"),
        prenom: userDocument.get("prenom"),
        email: userDocument.get("email"),
        tel: userDocument.get("tel"),
        mdp: userDocument.get("mdp"),
        photo: userDocument.get("photo"));
    return user;
  }
  
  updateUser(User user) async{
    Map<String, dynamic> data = {
      "id": user.id,
      "nom": user.nom,
      "prenom": user.prenom,
      "email": user.email,
      "tel": user.tel,
      "mdp": user.mdp,
      "photo": "assets/person1.jpg"
    };
    await FirebaseFirestore.instance.collection('users').doc(user.id).update(data);
  }
}
