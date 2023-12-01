import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:projetmobilev2/data/destination.dart';
import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/Review.dart';

class NearbyPlaces extends StatefulWidget {
  const NearbyPlaces({super.key});

  @override
  State<NearbyPlaces> createState() => _NearbyPlacesState();
}

class _NearbyPlacesState extends State<NearbyPlaces> {
  List<Destination> dataList = destinationList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(dataList.length, (index) {
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
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          dataList[index].photo,
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
                              dataList[index].name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Color(0xFFF65959),
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                 Text(
                                  dataList[index].location,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                             Text(
                              dataList[index].description,
                              style: TextStyle(fontSize: 18),
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
                                  dataList[index].rating.toString(),
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
                                      text: dataList[index].prix.toString()+" TND",
                                      children: const [
                                        TextSpan(
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black54,
                                            ),
                                            text: "/ Person")
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
      }),
    );
  }
}
