import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:projetmobilev2/home_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>{
TextEditingController email=new TextEditingController();
TextEditingController mdp=new TextEditingController();
final _formKey = GlobalKey<FormState>();

@override
void dispose(){
  email.dispose();
  mdp.dispose();
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
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Connexion',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          TextFormField(
                            controller: email,
                            validator: (value){
                              if(value!.isEmpty==true){
                                return "Entrer votre email";
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
                            controller: mdp,
                            obscureText: true,
                            decoration: InputDecoration(
                              label: const Text('Mot de passe',style: TextStyle(color: Colors.black),),
                              hintText: 'Entrer mot de passe',
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
                              child: const Text("Connexion",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),),
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
                                  'Sign up with',
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
                                onTap: (){},

                                child: Image.asset("assets/facebook.png"),
                              ),
                              InkWell(
                                onTap: (){},

                                child: Image.asset("assets/google.png"),
                              ),
                              InkWell(
                                onTap: (){},

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
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (e) =>  HomePage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign up',
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
          ),
        )
    );
  }
}

