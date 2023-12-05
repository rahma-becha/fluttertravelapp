import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:projetmobilev2/pages/details_page.dart';
import 'package:projetmobilev2/services/destinationService.dart';

import '../models/Destination.dart';
class Recommandation extends StatefulWidget {
  const Recommandation({super.key});

  @override
  State<Recommandation> createState() => _RecommandationState();
}

class _RecommandationState extends State<Recommandation> {
  Future<List<Destination>> futureDestinations=DestinationService().getAllDestinations();
  @override
  Widget build(BuildContext context) {
   return FutureBuilder<List<Destination>>(
        future: futureDestinations,
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      }

      final destinations = snapshot.data!;
      return SizedBox(
      height: 235,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 220,
              child: Card(
                elevation: 0.4,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(destination:destinations[index],
                          ),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            destinations[index].photo,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              destinations[index].name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 18,
                            ),
                            Text(
                              destinations[index].rating.toString(),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xFFF65959),
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              destinations[index].location,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          itemCount: destinations.length),
    );});
  }
}

