import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projetmobilev2/home_page.dart';
import 'package:projetmobilev2/models/Client.dart';
import 'package:projetmobilev2/services/clientService.dart';
import 'package:projetmobilev2/welcome_screen.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nom=new TextEditingController();
  TextEditingController prenom=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController tel=new TextEditingController();
  TextEditingController mdp=new TextEditingController();
  TextEditingController cmdp=new TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  registerClient(){
    Client client =new Client(
        id: "id",
        nom: nom.text,
        prenom: prenom.text,
        email: email.text,
        tel: tel.text,
        mdp: mdp.text,
        photo: "assets/person1.jpg"
    );
    ClientService().register(client);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    decoration: const BoxDecoration(
                      color: Colors.white,

                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/logo.png"),
                            width: 270,
                            height: 270,
                          ),
                          Text(
                            'S\'inscrire',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: nom,
                            validator: (value){
                              if(value!.isEmpty==true){
                                return "le champ nom est obligatoire";
                              }
                              return null;
                            },
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
                            validator: (value){
                              if(value!.isEmpty==true){
                                return "le champ prenom est obligatoire";
                              }
                              return null;
                            },
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
                            validator: (value){
                              if(value!.isEmpty==true){
                                return "le champ email est obligatoire";
                              }
                              if(!value.contains("@")){
                                return "le champ email doit contenir le caractére @";
                              }
                              return null;
                            },
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
                            validator: (value){
                              if(value!.isEmpty==true){
                                return "le champ tel est obligatoire";
                              }
                              if(value.length<0 || value.length>8){
                                return "le champ tel doit contenir 8 caracteres";
                              }
                              return null;
                            },
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
                            validator: (value){
                              if(value!.isEmpty==true){
                                return "le champ mot de passe  est obligatoire";
                              }
                              if(value.length<8){
                                return "le champ mot de passe doit contenir au moins 8 caractéres";
                              }
                              return null;
                            },
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
                            validator: (value){
                              if(value!.isEmpty==true){
                                return "le champ confirmer mot de passe  est obligatoire";
                              }
                              if(value!=mdp.text){
                                return "le champ confirmer mot de passe doit être egale au champ mot de passe";
                              }
                              return null;
                            },
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
                                bool? val=_formKey.currentState?.validate();
                                  if(val.toString()=="true"){
                                    registerClient();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>WelcomeScreen()
                                        ));
                                  }





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
                              child: const Text("S'inscrire",style: TextStyle(
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
        )
    );
  }
}
