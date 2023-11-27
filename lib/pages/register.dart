import 'package:flutter/material.dart';
import 'package:projetmobilev2/home_page.dart';
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
  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = email.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [


                  Image(image: AssetImage("assets/illustration.png"),height: 180,),

                  Container(
                    padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 20.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Form(
                     // key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Inscription',
                            style: TextStyle(
                              fontSize: 30.0,
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>HomePage()
                                    ));

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
                              child: const Text("Inscription",style: TextStyle(
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
