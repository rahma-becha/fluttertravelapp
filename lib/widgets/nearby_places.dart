import 'package:flutter/material.dart';

class NearbyPlaces extends StatelessWidget {
   NearbyPlaces({Key? key}) : super(key: key);
   var categories=[
     "Best Places",
     "Most Visited",
     "Favourities",
     "New Added",
     "Hotels",
     "Restaurents"
   ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(categories.length, (index) {
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

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/city${index+1}.jpg",
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
                            const Text(
                              "Sea of Peace",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text("Portic Team",style: TextStyle(fontSize: 18),),
                            const SizedBox(height: 10),
                            // DISTANCE WIDGET
                           // const Distance(),

                            const Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                  size: 30,
                                ),
                                const Text(
                                  "4.5",
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
                                      text: "\$22",
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