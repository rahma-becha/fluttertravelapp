import 'package:flutter/material.dart';
import 'package:projetmobilev2/pages/details_page.dart';
import 'package:projetmobilev2/services/whishlistService.dart';

import '../models/Destination.dart';
import '../services/destinationService.dart';
import '../widgets/HomeAppBar.dart';
import '../widgets/HomeBottomBar.dart';
class ViewAll extends StatefulWidget {

   const ViewAll({
     Key? key,
     required this.title,
   }) : super(key: key);
   final String title;
  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  Future<List<Destination>> futureDestinations=DestinationService().getAllDestinations();
  addToWhilslist(String destination_id){
    WhishListService().addToWhishList(destination_id);
  }
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
    return     Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child:HomeAppBar(title: "Travel App"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // second child
                Padding(padding: EdgeInsets.all(10),
                  child:Container(
                    alignment: Alignment.topLeft,
                    child:  Text(widget.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),) ,
                  ) ,),
                SizedBox(height: 10,),
                // third child
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: destinations.length,
                  itemBuilder: (context,index){
                    return Padding(padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(destination: destinations[index])));

                                },
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(destinations[index].photo),
                                          fit:BoxFit.cover
                                      )
                                  ),

                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top:10,bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(destinations[index].name,style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600
                                    ),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                    padding: const EdgeInsets.only(right: 2),
                                child: IconButton(
                                  onPressed: () {
                                    addToWhilslist(destinations[index].id);
                                  },
                                  iconSize: 20,
                                  icon: const Icon(Icons.favorite_outline,size: 30,),
                                ),
                              ),



                                      ],
                                    ),

                                  ],
                                ),

                              ),
                              SizedBox(height: 5,),
                              Column(
                                children: [

                                  Text(
                                    destinations[index].description.substring(0,151)+"...",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal
                                  ),textAlign: TextAlign.justify,),

                                  Padding(padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Text(
                                          destinations[index].rating.toString(),
                                          style: TextStyle(fontSize: 18),

                                        ),
                                        Icon(Icons.star,color:Colors.amber,size: 30,),

                                        Spacer(),
                                        RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFFF65959),
                                              ),

                                              text: destinations[index].prix.toString()+" TND",
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
                                    ),)

                                ],
                              )
                            ],
                          ),

                        ),
                      ),);
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(selectedIndex: "0",),
    );});
  }
}
