import 'package:flutter/material.dart';

import '../models/Client.dart';
import '../services/clientService.dart';
class CompteForm extends StatefulWidget {
  const CompteForm({super.key});

  @override
  State<CompteForm> createState() => _CompteFormState();
}

class _CompteFormState extends State<CompteForm> {
  Future<Client> futureUser=ClientService().getUserInfo();
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
  upadteUser(){
    Client userupdate=new Client(
        id: "user.id",
        nom: nom.text,
        prenom: prenom.text,
        email: email.text,
        tel: tel.text,
        mdp: mdp.text,
        photo: "assets/person1.png");
    ClientService().updateUser(userupdate);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Client>(
        future: futureUser,
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator(color: Colors.black,));
      }

      if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      }

      final user = snapshot.data!;
      nom.text=user.nom;
      prenom.text=user.prenom;
      email.text=user.email;
      tel.text=user.tel;
    return Column(
      children: [


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

                Image(image: AssetImage("assets/person2.png")),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: nom,

                  decoration: InputDecoration(
                    label: const Text('Nom',style: TextStyle(color: Colors.black),),
                    hintText: 'Entrer Nom',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hoverColor: Color(0xFFE65100),
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
                    hoverColor: Color(0xFFE65100),
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
                    hoverColor: Color(0xFFE65100),
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
                    hoverColor: Color(0xFFE65100),
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
                    hoverColor: Color(0xFFE65100),
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
                    hoverColor: Color(0xFFE65100),
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
                       upadteUser();
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                         content: Text("modifications est effectuée avec success",style: TextStyle(
                             color: Colors.black,
                             fontSize: 16,fontWeight: FontWeight.bold
                         ),),
                         backgroundColor: Colors.white,

                       ))
                       ;
                    },

                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color(0xFFE65100),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 8.0,
                      ),
                    ),
                    child: const Text("Valider",style: TextStyle(
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
    );});
  }
}
