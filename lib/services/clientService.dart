import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetmobilev2/services/authService.dart';

import '../models/Client.dart';

class ClientService {
  Future<Client> login(String email, String password) async {
    final userSnapshot = await FirebaseFirestore.instance
        .collection("clients")
        .where("email", isEqualTo: email)
        .where("mdp", isEqualTo: password)
        .get();
    Client user = new Client(
        id: userSnapshot.docs[0].id,
        nom: userSnapshot.docs[0].get("nom"),
        prenom: userSnapshot.docs[0].get("prenom"),
        email: userSnapshot.docs[0].get("email"),
        tel: userSnapshot.docs[0].get("tel"),
        mdp: userSnapshot.docs[0].get("mdp"),
        photo: userSnapshot.docs[0].get("photo"));
    return user;
  }

  register(Client user) async {
    Map<String, dynamic> data = {
      "id": user.id,
      "nom": user.nom,
      "prenom": user.prenom,
      "email": user.email,
      "tel": user.tel,
      "mdp": user.mdp,
      "photo": "assets/person1.jpg"
    };
    await FirebaseFirestore.instance.collection('clients').add(data);
    AuthService().createUserWithEmailAndPassword(email: user.email, password: user.mdp);
  }

  Future<Client> getUserInfo() async{
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
    return user;
  }
  
  updateUser(Client user) async{
    Map<String, dynamic> data = {
      "id": user.id,
      "nom": user.nom,
      "prenom": user.prenom,
      "email": user.email,
      "tel": user.tel,
      "mdp": user.mdp,
      "photo": "assets/person1.jpg"
    };
    await FirebaseFirestore.instance.collection('clients').doc(user.id).update(data);
    AuthService().update_cridentials(user.email, user.mdp);
  }
}
