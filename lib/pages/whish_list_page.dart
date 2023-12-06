import 'package:flutter/material.dart';
import 'package:projetmobilev2/models/whishlist.dart';
import 'package:projetmobilev2/pages/details_page.dart';
import 'package:projetmobilev2/pages/whishList.dart';
import 'package:projetmobilev2/services/whishlistService.dart';
import 'package:projetmobilev2/widgets/HomeAppBar.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';

import '../models/Destination.dart';
class WhishListPage extends StatefulWidget {
  const WhishListPage({super.key});

  @override
  State<WhishListPage> createState() => _WhishListPageState();
}

class _WhishListPageState extends State<WhishListPage> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child:HomeAppBar(title: "Wishlist"),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Whishlist()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(selectedIndex: "2",),
    );
  }
}
