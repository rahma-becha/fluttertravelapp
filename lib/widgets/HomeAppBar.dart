import 'package:flutter/material.dart';
import 'package:projetmobilev2/pages/notifications_page.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAppBar extends StatelessWidget {
   const HomeAppBar({
     Key? key,
     required this.title,
   }) : super(key: key);
   final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              Text(title,
              style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),)
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsPage()));

                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6
                        )
                      ],
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(Icons.notifications_active_outlined, size: 30,),

                ),
              ),
              SizedBox(width: 10,),
              InkWell(
                onTap: (){
                   showDialog(context: context, builder: (BuildContext context){
                     return AlertDialog(
                       title: Text("Choisir une option"),
                       titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(20))
                       ),
                       content:Stack(
                         alignment: Alignment.center,
                         children: [
                           Container(
                             padding: EdgeInsets.zero,
                             margin: EdgeInsets.zero,
                             width: double.infinity,
                             height: 150,
                             child:  Column(
                               children: [
                                 InkWell(
                                   onTap: (){
                                     launch("https://www.messenger.com/?locale=fr_FR");
                                   },
                                   child: Row(
                                     children: [
                                       Image.asset("assets/messenger.png"),
                                       SizedBox(width: 10,),

                                       Text("Messenger",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                                     ],
                                   ),
                                 ),
                                 InkWell(
                                   onTap: (){
                                     launch("tel:123");
                                   },
                                   child: Row(
                                     children: [
                                       Image.asset("assets/phone.png"),
                                       SizedBox(width: 10,),

                                       Text("Phone",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600))
                                     ],
                                   ),
                                 ),
                                 InkWell(
                                   onTap: (){
                                   //  launch("https://gmail.com/");
                                     launchUrl(Uri(
                                       scheme: "mailto",
                                       path: "miniprojet708@gmail.com",
                                       query:"mmm"
                                     ));
                                   },
                                   child: Row(
                                     children: [
                                       Image.asset("assets/gmail.png"),
                                       SizedBox(width: 10,),
                                       Text("Email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600))
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ),

                         ],
                       ),
                       actions: [
                         IconButton(
                           onPressed: () {
                             Navigator.of(context).pop();
                           },
                           icon: const Icon(Icons.close),
                         ),
                       ],
                     );
                   });
                },
                child: Container(
                  padding: EdgeInsets.all(10),

                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6
                        )
                      ],
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Image.asset("assets/send.png",width: 30,),

                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
