import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/hotel.dart';

class HotelService{
  Future<List<Hotel>> getHotelsByDestination(Destination destination) async{
    final hotelsSnapshot=await FirebaseFirestore.instance.collection("hotels").where("destination",isEqualTo: destination.id).get();
    final List<Hotel> hotels=[];
    for(final DocumentSnapshot hotelDocument in hotelsSnapshot.docs){
      Hotel hotel=new Hotel(
          id: hotelDocument.id, 
          name: hotelDocument.get("name"), 
          nbrEtoile: hotelDocument.get("nbrEtoile"), 
          photo: hotelDocument.get("photo"), 
          prixParNuit: hotelDocument.get("prixParNuit"),
          description: hotelDocument.get("description"),
          destination: destination
      );
      hotels.add(hotel);
    }
    return hotels;
  }
}