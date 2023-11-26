// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projetmobilev2/pages/reviews.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=34.7614464,10.5854442,12';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SizedBox(
              height: size.height * 0.38,
              width: double.maxFinite,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 20,
                            icon: const Icon(Ionicons.chevron_back),
                          ),
                          /*   IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: const Icon(Ionicons.heart_outline),
                          ),*/
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sea of Peace",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Portic Team 8km",
                      style: TextStyle(fontSize: 18),

                    )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: IconButton(
                    onPressed: () {},
                    iconSize: 20,
                    icon: const Icon(Icons.favorite_outline,size: 30,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>Reviews()
                          ));

                    },
                    iconSize: 20,
                    icon: const Icon(Ionicons.chatbubble_ellipses_outline,size: 30,),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "4.6",
                      style: TextStyle(fontSize: 18),

                    ),
                    Icon(
                      Ionicons.star,
                      color: Colors.yellow[800],
                      size: 20,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Text("Description",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
            ),),
            SizedBox(height: 8,),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Text("Activités",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
            ),),
            SizedBox(height: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for(int i=0; i<=5;i++)

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                        width: 10,
                        height: 10,
                      ),

                      Text("Activité ${i+1}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.justify,),
                    ],
                  )
              ],
            ),

            const SizedBox(height: 10),
            Text("Location",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
            ),),
            SizedBox(height: 8,),
            InkWell(
              onTap: (){
                launch(googleUrl);

              },
              child:Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  image: const DecorationImage(
                    image: AssetImage('assets/map1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            
            //const SizedBox(height: 15),
            //const Distance(),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color(0xFFF65959),
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 8.0,
                ),
              ),
              child: const Text("Join this tour",style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),),
            )
          ],
        ),
      ),
    );
  }
}

