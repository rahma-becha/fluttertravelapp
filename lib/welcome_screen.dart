import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:projetmobilev2/home_page.dart';
import 'package:projetmobilev2/pages/register.dart';
import 'package:projetmobilev2/services/authService.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController mdp = new TextEditingController();
  String error_message = "";
  bool is_logged = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    mdp.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    try {
      await AuthService()
          .signInWithEmailAndPassword(email: email.text, password: mdp.text);
      is_logged = true;
    } on FirebaseAuthException catch (e) {
      setState(() {
        error_message = e.message.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 25,right: 25),
                height: MediaQuery.of(context).size.height * 1.4,
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
                        'Connexion',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),

                      Text(
                        error_message,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.red
                        ),
                      ),
                     SizedBox(height: 10,),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty == true) {
                            return "Entrer votre email";
                          }
                          if(!value!.contains("@")){
                            return "l'adresse email doit contenir @";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            'Email',
                            style: TextStyle(color: Colors.black),
                          ),
                          hintText: 'Entrer Email',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFE65100),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                          ),
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
                        validator: (value) {
                          if (value!.isEmpty == true) {
                            return "Entrer votre mot de passe";
                          }
                          if(value!.length<8){
                            return "mot de passe doit contenir au mois 8 caractéres";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            'Mot de passe',
                            style: TextStyle(color: Colors.black),
                          ),
                          hintText: 'Entrer mot de passe',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFE65100),
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            color: Colors.black,
                          ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Text(
                              'Mot de passe oublié?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                //    color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _formKey.currentState?.validate();
                            signIn();
                            if (AuthService().currentUser!=null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
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
                          child: const Text(
                            "Connexion",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Se connecter avec',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Image.asset("assets/facebook.png"),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset("assets/google.png"),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Image.asset("assets/instagram.png"),
                          )
                          //Logo(Logos.google),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Vous n\'avez pas de compte ? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => Register(),
                                ),
                              );
                            },
                            child: Text(
                              'S\'inscrire',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                //   color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

    ));
  }
}
