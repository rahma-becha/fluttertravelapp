import 'package:flutter/material.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';

import '../widgets/HomeAppBar.dart';

class Reservations extends StatefulWidget {
  const Reservations({super.key});

  @override
  State<Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(title: "Reservations"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
       child:SingleChildScrollView(
        child: Column(
          children: List.generate(categories.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                height: 160,
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
                              "assets/city${index + 1}.jpg",
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Sea of Peace",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: Colors.redAccent,
                                    ),
                                  ],
                                ),


                                const Text(
                                  "Portic Team",
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),
                                const Text(
                                  "Date : 19-12-2023",
                                  style: TextStyle(fontSize: 18),
                                ),
                                const Text(
                                  "Nombre de personne : 5",
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
        ),),
      ),
      bottomNavigationBar: HomeBottomBar(
        selectedIndex: "3",
      ),
    );
  }
}
