import 'package:flutter/material.dart';
class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              'assets/map.png',
              width: 100,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Location",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Color(0xFFF65959),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "United States, New York",
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            )
          ],
        ),
      ),
    );;
  }
}
