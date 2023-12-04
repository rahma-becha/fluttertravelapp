import 'package:flutter/material.dart';
import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/pages/reservationForm.dart';

import '../widgets/HomeAppBar.dart';
import '../widgets/HomeBottomBar.dart';
class AddReservation extends StatefulWidget {
  const AddReservation({super.key,required this.destination});
  final Destination destination;
  @override
  State<AddReservation> createState() => _AddReservationState();
}

class _AddReservationState extends State<AddReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(title: "Réserver"),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: SingleChildScrollView(
            child: ReservationForm(destination: widget.destination,)
        ),
      ),
      bottomNavigationBar: HomeBottomBar(
        selectedIndex: "3",
      ),
    );
  }
}
