import "package:flutter/material.dart";
import "package:projetmobilev2/pages/view_all.dart";
import "package:projetmobilev2/widgets/HomeAppBar.dart";
import "package:projetmobilev2/widgets/HomeBottomBar.dart";
import "package:projetmobilev2/widgets/location_card.dart";
import "package:projetmobilev2/widgets/nearby_places.dart";
import "package:projetmobilev2/widgets/places.dart";
import "package:projetmobilev2/widgets/recommandations.dart";

class HomePage extends StatelessWidget {
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
    return  Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: HomeAppBar(title: "Travel App"),
        ),
      body: SafeArea(
         child: Padding(
           padding: EdgeInsets.symmetric(vertical: 20),
           child: SingleChildScrollView(
             child: Column(
               children: [
                   LocationCard(),
                   SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(padding: EdgeInsets.all(10),
                       child:Container(
                         alignment: Alignment.topLeft,
                         child:  Text("Nouvelles",
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20
                           ),) ,
                       ) ,),
                     TextButton(onPressed: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) =>ViewAll(title: "Recommandations",)
                           ));
                     }, child: Text('Voir Plus',style: TextStyle(color: Colors.redAccent,fontSize: 18),))

                   ],
                 ),

                 Recommandation(),
                   SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(padding: EdgeInsets.all(10),
                       child:Container(
                         alignment: Alignment.topLeft,
                         child:  Text("Most Visited",
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20
                           ),) ,
                       ) ,),
                     TextButton(onPressed: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) =>ViewAll(title: "Nearby Places",)
                           ));
                     }, child: Text('Voir Plus',style: TextStyle(color: Colors.redAccent,fontSize: 18),))

                   ],
                 ),
                 NearbyPlaces()
               ],
             ),
           ),
         ),
      ),
      bottomNavigationBar: HomeBottomBar(selectedIndex: "0",),
    );
  }
}
