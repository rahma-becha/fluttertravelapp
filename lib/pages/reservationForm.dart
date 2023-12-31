import 'package:flutter/material.dart';
import 'package:projetmobilev2/models/hotel.dart';
import 'package:projetmobilev2/pages/choix_hotel.dart';
import 'package:projetmobilev2/services/hotelService.dart';

import '../models/Destination.dart';
import '../models/Client.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key, required this.destination});
  final Destination destination;
  @override
  State<ReservationForm> createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  TextEditingController date = new TextEditingController();
  TextEditingController nbrPersone = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController nbrJour=new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    date.dispose();
    nbrPersone.dispose();
    name.dispose();
    super.dispose();
  }

  addReservation() {}
  @override
  Widget build(BuildContext context) {
       name.text=widget.destination.name;
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Ajouter un réservation',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: double.maxFinite,
                      child:  ClipRRect(
                          borderRadius: BorderRadius.circular(10),

                          child:Image(image:AssetImage(widget.destination.photo),fit: BoxFit.cover,)
                      ),
                    ),


                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: name,

                        decoration: InputDecoration(
                          label: const Text(
                            'Nom du destination',
                            style: TextStyle(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFE65100),
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
                        controller: date,
                        keyboardType: TextInputType.datetime,
                        validator: (value){
                          if (value!.isEmpty == true) {
                            return "le champ date de réservation est obligatoire";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            'Date de réservation',
                            style: TextStyle(color: Colors.black),
                          ),
                          hintText: 'Date de réservation',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFE65100),
                          prefixIcon: Icon(
                            Icons.calendar_today,
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
                        controller: nbrJour,
                        keyboardType: TextInputType.number,
                        validator: (value){
                          if (value!.isEmpty == true) {
                            return "le champ nombre du jours est obligatoire";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            'Nombre du jours',
                            style: TextStyle(color: Colors.black),
                          ),
                          hintText: 'Entrer Nombre du jours',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFE65100),
                          prefixIcon: Icon(
                            Icons.numbers_outlined,
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
                        controller: nbrPersone,
                        keyboardType: TextInputType.number,
                        validator: (value){
                          if (value!.isEmpty == true) {
                            return "le champ nombre du personne est obligatoire";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            'Nombre de personne',
                            style: TextStyle(color: Colors.black),
                          ),
                          hintText: 'Entrer Nombre de personne',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hoverColor: Color(0xFFE65100),
                          prefixIcon: Icon(
                            Icons.numbers_outlined,
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


                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            bool? val=_formKey.currentState?.validate();
                            if(val.toString()=="true"){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChoixHotel(destination:widget.destination , date: date.text,nbrPersonne: nbrPersone.text,nbrJour: nbrJour.text,)));

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
                            "Suivant",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
