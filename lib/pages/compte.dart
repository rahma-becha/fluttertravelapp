import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projetmobilev2/models/User.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';
import '../widgets/HomeAppBar.dart';
import 'package:projetmobilev2/data/user.dart';

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
  TextEditingController cmdp=new TextEditingController();

  @override
  void dispose(){
    nom.dispose();
    prenom.dispose();
    email.dispose();
    tel.dispose();
    mdp.dispose();
    cmdp.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(title: "Informations Personnelle"),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [


              Image(image: AssetImage("assets/person1.png")),

              Container(
                padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Form(
                  //key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Informations personnelle',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        controller: nom,

                        decoration: InputDecoration(
                          label: const Text('Nom',style: TextStyle(color: Colors.black),),
                          hintText: 'Entrer Nom',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFF65959),
                          prefixIcon: Icon(Icons.person_outline,color: Colors.black,),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                      ),

                      const SizedBox(
                        height: 25.0,
                      ),

                      TextFormField(
                        controller: prenom,
                        decoration: InputDecoration(
                          label: const Text('Prénom',style: TextStyle(color: Colors.black),),
                          hintText: 'Entrer Prénom',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFF65959),
                          prefixIcon: Icon(Icons.person_outlined,color: Colors.black,),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          label: const Text('Email',style: TextStyle(color: Colors.black),),
                          hintText: 'Entrer Email',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFF65959),
                          prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: tel,
                        decoration: InputDecoration(
                          label: const Text('Téléphone',style: TextStyle(color: Colors.black),),
                          hintText: 'Entrer Téléphone',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFF65959),
                          prefixIcon: Icon(Icons.phone_android,color: Colors.black,),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: mdp,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: const Text('Mot de Passe',style: TextStyle(color: Colors.black),),
                          hintText: 'Entrer Mot de passe',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFF65959),
                          prefixIcon: Icon(Icons.password_outlined,color: Colors.black,),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: cmdp,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: const Text('Confirmer Mot de Passe',style: TextStyle(color: Colors.black),),
                          hintText: 'Confirmer Mot de passe',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFF65959),
                          prefixIcon: Icon(Icons.password_outlined,color: Colors.black,),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child:             ElevatedButton(
                          onPressed: () {

                          },

                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xFFF65959),
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 8.0,
                            ),
                          ),
                          child: const Text("Connexion",style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

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
