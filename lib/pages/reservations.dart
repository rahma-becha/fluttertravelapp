import 'package:flutter/material.dart';
import 'package:projetmobilev2/models/reservation.dart';
import 'package:projetmobilev2/services/reservationService.dart';

class ReservationsView extends StatefulWidget {
  const ReservationsView({super.key});

  @override
  State<ReservationsView> createState() => _ReservationsViewState();
}

class _ReservationsViewState extends State<ReservationsView> {
  Future<List<Reservation>> futureReservationList =
      ReservationService().getAllReservationsByUser();
  deleteReservation(String id) {
    ReservationService().deleteReservation(id);
    setState(() {
      futureReservationList = ReservationService().getAllReservationsByUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Reservation>>(
        future: futureReservationList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.black,));
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final reservations = snapshot.data!;
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: reservations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    height: 194,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 0.4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  reservations[index].destination.photo,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          reservations[index].destination.name,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Supprimer Réservation"),
                                                    content: Container(
                                                      padding: EdgeInsets.zero,
                                                      margin: EdgeInsets.zero,
                                                      width: double.infinity,
                                                      height: 45,
                                                      child: Text(
                                                        "Vous êtes sure de supprimer cette réservation",
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            'Annuler'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          deleteReservation(
                                                              reservations[
                                                                      index]
                                                                  .id);
                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                            content: Text("Réservation Supprimé avec success",style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16,fontWeight: FontWeight.bold
                                                            ),),
                                                            backgroundColor: Colors.white,

                                                          ))
                                                          ;
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            'Confirmer'),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: Colors.redAccent,
                                          ),
                                        )
                                      ],
                                    ),

                                    Text(
                                      reservations[index].hotel.name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Date : " + reservations[index].date,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      "Nombre de personne : " +
                                          reservations[index]
                                              .nbrPersonne
                                              .toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      "Nombre du jour : " +
                                          reservations[index]
                                              .nbrJour
                                              .toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    // DISTANCE WIDGET
                                    // const Distance(),

                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFFE65100),
                                              ),
                                              text: reservations[index]
                                                      .prix
                                                      .toString(),
                                              children: const [
                                                TextSpan(
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black54,
                                                    ),
                                                    text: " TND")
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
              });
        });
  }
}
