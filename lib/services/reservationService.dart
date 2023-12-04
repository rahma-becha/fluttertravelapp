import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetmobilev2/data/user.dart';
import 'package:projetmobilev2/models/hotel.dart';
import 'package:projetmobilev2/models/reservation.dart';

import '../models/Destination.dart';
import '../models/User.dart';

class ReservationService{
  Future<List<Reservation>> getAllReservationsByUser() async{
    final reservationsSnapshot = await FirebaseFirestore.instance.collection('reservations').where("user",isEqualTo: user.id).get();
    final List<Reservation> reservations=[];
    for(final DocumentSnapshot reservationDocument in reservationsSnapshot.docs){
      final userDocument = await FirebaseFirestore.instance
          .collection('users')
          .doc(reservationDocument.get("user"))
          .get();
      final destinationDocument = await FirebaseFirestore.instance
          .collection('destinations')
          .doc(reservationDocument.get("destination"))
          .get();
      final hotelDocument = await FirebaseFirestore.instance
          .collection('hotels')
          .doc(reservationDocument.get("hotel"))
          .get();
      User user = new User(
          id: userDocument.id,
          nom: userDocument.get("nom"),
          prenom: userDocument.get("prenom"),
          email: userDocument.get("email"),
          tel: userDocument.get("tel"),
          mdp: userDocument.get("mdp"),
          photo: userDocument.get("photo"));
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
          nbrPersonne: reservationDocument.get("nbrPersonne"),
          destination: destination,
          hotel: hotel,
          user: user);
      reservations.add(reservation);
    }
    return reservations;
  }

  void addReservation(Reservation reservation) async{
    Map<String, dynamic> data = {
      'destination': reservation.destination.id,
      'user':reservation.user.id,
      'hotel':reservation.hotel.id,
      "date":reservation.date,
      'nbrPersonne':reservation.nbrPersonne
    };
    await FirebaseFirestore.instance.collection('reservations').add(data);
  }

  void deleteReservation(String reservation_id) async{
    await FirebaseFirestore.instance.collection('reservations').doc(reservation_id).delete();
  }
}