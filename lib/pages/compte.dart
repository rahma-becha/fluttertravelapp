import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projetmobilev2/models/User.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';

import '../widgets/HomeAppBar.dart';

class Compte extends StatefulWidget {
  const Compte({super.key});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  TextEditingController nom=new TextEditingController();
  TextEditingController prenom=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController tel=new TextEditingController();
  TextEditingController mdp=new TextEditingController();
  @override
  void dispose(){
    nom.dispose();
    prenom.dispose();
    email.dispose();
    tel.dispose();
    mdp.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(title: "Informations Personnelle"),
      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/Profile.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child:   TextField(
                  controller: nom,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none
                      ),
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500
                      ),
                      hintText: "Nom"
                  ),
                ),

              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child:   TextField(
                  controller: prenom,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none
                      ),
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500
                      ),
                      hintText: "Prénom"
                  ),
                ),

              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child:   TextField(
                  controller: email,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none
                      ),
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500
                      ),
                      hintText: "Email"
                  ),
                ),

              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child:   TextField(
                  controller: tel,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none
                      ),
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500
                      ),
                      hintText: "Téléphone"
                  ),
                ),

              ),

              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child:   TextField(
                  obscureText: true,
                  controller: mdp,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none
                      ),
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500
                      ),
                      hintText: "Mot de passe"
                  ),
                ),

              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color(0xFFF65959),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Text("Valider",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),),
              )



            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(
        selectedIndex: "3",
      ),
    );
  }
}
