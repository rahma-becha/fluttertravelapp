import 'package:flutter/material.dart';
import 'package:projetmobilev2/pages/reservations.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';

import '../models/reservation.dart';
import '../services/reservationService.dart';
import '../widgets/HomeAppBar.dart';

class Reservations extends StatefulWidget {
  const Reservations({super.key});

  @override
  State<Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(title: "Reservations"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
       child:SingleChildScrollView(
        child: Column(
          children:[
            ReservationsView()
          ]
        ),),
      ),
      bottomNavigationBar: HomeBottomBar(
        selectedIndex: "3",
      ),
    );

  }
}
