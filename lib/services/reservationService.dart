import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetmobilev2/models/hotel.dart';
import 'package:projetmobilev2/models/reservation.dart';

import '../models/Destination.dart';
import '../models/Client.dart';
import 'authService.dart';

class ReservationService{
  Future<List<Reservation>> getAllReservationsByUser() async{
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
    final reservationsSnapshot = await FirebaseFirestore.instance.collection('reservations').orderBy(FieldPath.documentId,descending: true).where("client",isEqualTo: user.id).get();
    final List<Reservation> reservations=[];
    for(final DocumentSnapshot reservationDocument in reservationsSnapshot.docs){

      final destinationDocument = await FirebaseFirestore.instance
          .collection('destinations')
          .doc(reservationDocument.get("destination"))
          .get();
      final hotelDocument = await FirebaseFirestore.instance
          .collection('hotels')
          .doc(reservationDocument.get("hotel"))
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
      Hotel hotel=new Hotel(
          id: hotelDocument.id,
          name: hotelDocument.get("name"),
          nbrEtoile: hotelDocument.get("nbrEtoile"),
          photo: hotelDocument.get("photo"),
          prixParNuit: hotelDocument.get("prixParNuit"),
          description: hotelDocument.get("description"),
          destination: destination);
      Reservation reservation=new Reservation(
          id: reservationDocument.id,
          date: reservationDocument.get("date"),
          nbrJour:reservationDocument.get("nbrJour"),
          prix: reservationDocument.get("prix"),
          nbrPersonne: reservationDocument.get("nbrPersonne"),
          destination: destination,
          hotel: hotel,
          client: user);
      reservations.add(reservation);
    }
    return reservations;
  }

  void addReservation(String date,int nbrPersonne,int nbrJour,Destination d,Hotel h) async{
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
      'destination': d.id,
      'client':user.id,
      'hotel':h.id,
      "date":date,
      'nbrPersonne':nbrPersonne,
      "nbrJour":nbrJour,
      "prix": ((h.prixParNuit*nbrPersonne)+(d.prix*nbrPersonne))*nbrJour,
    };
    await FirebaseFirestore.instance.collection('reservations').add(data);
  }

  void deleteReservation(String reservation_id) async{
    await FirebaseFirestore.instance.collection('reservations').doc(reservation_id).delete();
  }
}