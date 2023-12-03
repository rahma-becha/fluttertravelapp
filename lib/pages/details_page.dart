import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/pages/reviews.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.destination,
  }) : super(key: key);
  final Destination destination;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final faker=new Faker();

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
                        image: AssetImage(widget.destination.photo),
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
                      widget.destination.name,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.destination.location,
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
                      showModalBottomSheet(
                          context: context,
                        builder: (BuildContext context) {
                          return ClipRRect(

                            borderRadius: BorderRadius.circular(30.0),

                            child: Container(
                              color: Colors.white,
                              child: Center(
                                child: Reviews(reviewList: widget.destination.reviews,)
                              ),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      );

                    },
                    iconSize: 20,
                    icon: const Icon(Ionicons.chatbubble_ellipses_outline,size: 30,),
                  ),
                ),
                Padding(padding: EdgeInsets.all(4),
                child:  InkWell(
                  onTap: (){
                    launch('https://www.google.com/maps/search/?api=1&query=${widget.destination.lat},${widget.destination.long}');

                  },
                  child:Image(image: AssetImage("assets/google-maps.png"),width: 30,)
                ),),

              ],
            ),
            SizedBox(height: 10,),
            Text("Description",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
            ),),
            SizedBox(height: 8,),
            Text(
              widget.destination.description,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.justify,
            ),

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

