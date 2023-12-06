import "dart:ffi";

import "package:curved_navigation_bar/curved_navigation_bar.dart";
import "package:flutter/material.dart";
import "package:projetmobilev2/home_page.dart";
import "package:projetmobilev2/pages/profile.dart";
import "package:projetmobilev2/pages/search_page.dart";
import "package:projetmobilev2/pages/whish_list_page.dart";
class HomeBottomBar extends StatefulWidget {
   HomeBottomBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);
  final String selectedIndex;
  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: int.parse(widget.selectedIndex),
        items:[
          Icon(Icons.home,size: 30,color: Color(0xFFE65100),),
          Icon(Icons.search_outlined,size: 30,color:  _selectedIndex == 1 ? Color(0xFFE65100) : Colors.black,),
          Icon(Icons.favorite_outline,size: 30,color:  _selectedIndex == 2 ? Color(0xFFE65100) : Colors.black,),
          Icon(Icons.person_outline,size: 30,color:  _selectedIndex == 3 ? Color(0xFFE65100) : Colors.black,)

    ],
      onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        if(index==1){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchView()));

        }
        if(index==2){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>WhishListPage()));

        }
        if(index==0){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

        }
        if(index==3){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));

        }

      },

    );
    }
}

