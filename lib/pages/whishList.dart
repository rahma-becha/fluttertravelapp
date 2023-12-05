import 'package:flutter/material.dart';

import '../models/whishlist.dart';
import '../services/whishlistService.dart';
import 'details_page.dart';
class Whishlist extends StatefulWidget {
  const Whishlist({super.key});

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {
  Future<List<WhishList>> futureWhishList=WhishListService().getAllWhishList();
  delete(String id){
    WhishListService().deleteFromWhishList(id);
    setState(() {
      futureWhishList=WhishListService().getAllWhishList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WhishList>>(
        future: futureWhishList,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      }
      final whishlists = snapshot.data!;
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: whishlists.length,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(destination: whishlists[index].destination,)));

                      },
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(whishlists[index].destination.photo),
                                fit:BoxFit.cover
                            )
                        ),

                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(whishlists[index].destination.name,style: TextStyle(
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
                                    delete(whishlists[index].id);
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Destination est supprié du whishlist",style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,fontWeight: FontWeight.bold
                                      ),),
                                      backgroundColor: Colors.white,

                                    ))
                                    ;
                                  },
                                  iconSize: 20,
                                  icon: const Icon(Icons.favorite,size: 30,color: Colors.redAccent,),
                                ),
                              ),
/*                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: IconButton(
                                  onPressed: () {},
                                  iconSize: 20,
                                  icon: const Icon(Ionicons.chatbubble_ellipses_outline,size: 20,),
                                ),
                              ),*/


                            ],
                          ),

                        ],
                      ),

                    ),
                    SizedBox(height: 5,),
                    Column(
                      children: [

                        Text(
                          whishlists[index].destination.description.substring(1,151)+"...",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal
                          ),textAlign: TextAlign.justify,),

                        Padding(padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                whishlists[index].destination.rating.toString(),
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

                                    text: whishlists[index].destination.prix.toString()+" TND",
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
      );
    });
}}
