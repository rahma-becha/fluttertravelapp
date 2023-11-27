import 'package:flutter/material.dart';
class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child:  Image.asset(
          'assets/travel-promo.png',
        ),
      );
  }
}
