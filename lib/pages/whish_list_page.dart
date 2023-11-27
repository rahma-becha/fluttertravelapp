import 'package:flutter/material.dart';
import 'package:projetmobilev2/pages/details_page.dart';
import 'package:projetmobilev2/widgets/HomeAppBar.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';
class WhishListPage extends StatefulWidget {
  const WhishListPage({super.key});

  @override
  State<WhishListPage> createState() => _WhishListPageState();
}

class _WhishListPageState extends State<WhishListPage> {
  var categories=[
    "Cities",
    "Places",
    "Hotels",
    "Restaurents",
    "Events",
    "Activities"
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child:HomeAppBar(title: "Favorites"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categories.length,
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(image: "assets/city${index+1}.jpg")));

                              },
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage("assets/city${index+1}.jpg"),
                                        fit:BoxFit.cover
                                    )
                                ),

                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top:10,bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("City Name",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                  ),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 2),
                                        child: IconButton(
                                          onPressed: () {},
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

                                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",                          style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal
                                    ),),

                                 Padding(padding: EdgeInsets.all(10),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     Text(
                                       "4.6",
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
      bottomNavigationBar: HomeBottomBar(selectedIndex: "2",),
    );
  }
}
