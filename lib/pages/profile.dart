import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projetmobilev2/pages/compte.dart';
import 'package:projetmobilev2/pages/reservations_list.dart';
import 'package:projetmobilev2/welcome_screen.dart';
import 'package:projetmobilev2/widgets/HomeAppBar.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child:HomeAppBar(title: "Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/person1.png",
                  fit: BoxFit.cover,
                ),
              ),

            SizedBox(height: 25,),
            Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
              ),
              child:Row(
                  children: [
                    Icon(Ionicons.person_outline),
                    SizedBox(width: 10,),
                    Text("Informatins Personelle",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.start,),
                    const Spacer(),

                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Compte()));

                      },
                      child: Icon(Ionicons.chevron_forward),
                    )

                  ],
                ),
            ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                ),
                child:Row(
                  children: [
                    Icon(Icons.card_travel_outlined),
                    SizedBox(width: 10,),
                    Text("Reservations",style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                      textAlign: TextAlign.start,),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Reservations()));

                      },
                      child: Icon(Ionicons.chevron_forward),
                    )

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                ),
                child:Row(
                  children: [
                    Icon(Icons.help_outline),
                    SizedBox(width: 10,),
                    Text("Aide",style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                      textAlign: TextAlign.start,),
                    const Spacer(),
                    InkWell(
                      onTap: (){},
                      child: Icon(Ionicons.chevron_forward),
                    )

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                ),
                child:Row(
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: 10,),
                    Text("A Propos",style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                      textAlign: TextAlign.start,),
                    const Spacer(),
                    InkWell(
                      onTap: (){},
                      child: Icon(Ionicons.chevron_forward),
                    )

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                ),
                child:Row(
                  children: [
                    Icon(Icons.logout_outlined),
                    Text("Deconnexion",style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                      textAlign: TextAlign.start,),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));

                      },
                      child: Icon(Ionicons.chevron_forward),
                    )

                  ],
                ),
              )
            ],
            ),
        ),
        ),
      bottomNavigationBar: HomeBottomBar(selectedIndex: "3",),
    );
  }
}
