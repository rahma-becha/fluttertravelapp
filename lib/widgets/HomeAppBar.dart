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
                   launch("https://www.facebook.com/");
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
