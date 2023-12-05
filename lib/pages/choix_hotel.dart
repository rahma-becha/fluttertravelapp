import 'package:flutter/material.dart';
import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/hotel.dart';
import 'package:projetmobilev2/models/reservation.dart';
import 'package:projetmobilev2/pages/reservations_list.dart';
import 'package:projetmobilev2/services/hotelService.dart';
import 'package:projetmobilev2/services/reservationService.dart';

import '../widgets/HomeAppBar.dart';
import '../widgets/HomeBottomBar.dart';

class ChoixHotel extends StatefulWidget {
  const ChoixHotel(
      {super.key,
      required this.destination,
      required this.date,
      required this.nbrPersonne,
      required this.nbrJour});
  final Destination destination;
  final String date;
  final String nbrPersonne;
  final String nbrJour;
  @override
  State<ChoixHotel> createState() => _ChoixHotelState();
}

class _ChoixHotelState extends State<ChoixHotel> {
  addReservation(String date, String nbrPersonne,String nbrJour,Destination d,Hotel h){
    ReservationService().addReservation(date,int.parse(nbrPersonne),int.parse(nbrJour),d,h);
  }
  showPrix(Destination d,String nbrPersoone,String nbrJour,Hotel h){
    int nbrp=int.parse(nbrPersoone);
    int nbrj=int.parse(nbrJour);
    return (((d.prix*nbrp)+(h.prixParNuit*nbrp))*nbrj).toString();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Hotel>>(
        future: HotelService().getHotelsByDestination(widget.destination),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final hotels = snapshot.data!;
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90.0),
              child: HomeAppBar(title: "Reservations"),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(hotels.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: 150,
                        width: double.maxFinite,
                        child: Card(
                          elevation: 0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {

    showDialog(context: context, builder: (BuildContext context) {
                               return  AlertDialog(
                                   title: Text("Confirmer Réservation"),
                                   content: Container(
                                     padding: EdgeInsets.zero,
                                     margin: EdgeInsets.zero,
                                     width: double.infinity,
                                     height: 115,
                                     child: Column(
                                       children: [
                                         Text("Destination : " +
                                             widget.destination.name),
                                         Text("Date : " + widget.date),
                                         Text("Nombre de personne : " +
                                             widget.nbrPersonne),
                                         Text("Nombre de jour : " +
                                             widget.nbrJour),
                                         Text("Hotel : " + hotels[index].name),
                                         Text("Prix :"+showPrix(widget.destination,widget.nbrPersonne,widget.nbrJour,hotels[index])+" TND")
                                       ],
                                     ),
                                   ),
                                   actions: [
                                     TextButton(
                                       onPressed: () {
                                         Navigator.pop(context);
                                       },
                                       child: const Text('Annuler'),
                                     ),
                                     TextButton(
                                       onPressed: () {

                                         addReservation(widget.date, widget.nbrPersonne,widget.nbrJour, widget.destination, hotels[index]);
                                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                           content: Text("Réservation ajouté avec success",style: TextStyle(
                                               color: Colors.black,
                                               fontSize: 16,fontWeight: FontWeight.bold
                                           ),),
                                           backgroundColor: Colors.white,

                                         ))
                                         ;
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Reservations()));

                                       },
                                       child: const Text('Confirmer'),
                                     ),
                                   ],
                                 );
                               },);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      hotels[index].photo,
                                      height: double.maxFinite,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hotels[index].name,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Text(
                                          hotels[index].description.substring(0,75),
                                          style: TextStyle(fontSize: 18),
                                          textAlign: TextAlign.justify,
                                        ),

                                        const SizedBox(height: 10),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow.shade700,
                                              size: 30,
                                            ),
                                            Text(
                                              hotels[index].nbrEtoile.toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            const Spacer(),
                                            RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xFFF65959),
                                                  ),
                                                  text: hotels[index].prixParNuit.toString()+" TND",
                                                  children: const [
                                                    TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black54,
                                                        ),
                                                        text: "/ Personne")
                                                  ]),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ),
              ),
            ),
            bottomNavigationBar: HomeBottomBar(
              selectedIndex: "3",
            ),
          );
        });
  }
}
