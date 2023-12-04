import 'package:flutter/material.dart';
import 'package:projetmobilev2/data/user.dart';
import 'package:projetmobilev2/models/User.dart';
import 'package:projetmobilev2/pages/compteForm.dart';
import 'package:projetmobilev2/services/userService.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';
import '../widgets/HomeAppBar.dart';

class Compte extends StatefulWidget {
  const Compte({super.key});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {

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
          child: CompteForm()
        ),
      ),
      bottomNavigationBar: HomeBottomBar(
        selectedIndex: "3",
      ),
    );
  }
}
