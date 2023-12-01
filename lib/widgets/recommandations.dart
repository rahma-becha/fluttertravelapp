import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:projetmobilev2/pages/details_page.dart';

import '../data/destination.dart';
import '../models/Destination.dart';
class Recemandations extends StatelessWidget {
   Recemandations({super.key});
   List<Destination> dataList = destinationList;

   @override
  Widget build(BuildContext context) {
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
                          builder: (context) => DetailsPage(destination:dataList[index],
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
                            dataList[index].photo,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                             Text(
                              dataList[index].name,
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
                              dataList[index].rating.toString(),
                              style: TextStyle(
                                fontSize: 12,
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
                              dataList[index].location,
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
          itemCount: dataList.length),
    );
  }
}
