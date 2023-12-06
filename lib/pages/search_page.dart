 import 'package:flutter/material.dart';
import 'package:projetmobilev2/pages/details_page.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';

import '../models/Destination.dart';
import '../services/destinationService.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Destination> destinations = [];
  Future<List<Destination>> futureDestinations=DestinationService().getAllDestinations();


  List _founded = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  onSearch(String search) {
    setState(() {
      _founded= destinations.where((loc) => loc.name.contains(search)).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Destination>>(
        future: futureDestinations,
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator(color: Colors.black,));
      }

      if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      }

       destinations = snapshot.data!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              title: Container(
                height: 50,
                child: TextField(
                  onChanged: (value)=>{ onSearch(value)},
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(Icons.search,color: Colors.black45,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none
                      ),
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade500
                      ),
                    hintText: "Search..."
                  ),
                ),
              ),
            ),
            body: Container(
              color: Colors.transparent,
              child: _founded.length > 0 ? ListView.builder(
                  itemCount: _founded.length,
                  itemBuilder: (context, index) {
                     return InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(destination: _founded[index],)));
                       },

                       child: Padding(
                         padding: EdgeInsets.all(8),
                         child: ListTile(
                             leading: ClipOval(
                               child: SizedBox.fromSize(
                                 //size: Size.fromRadius(50), // Image radius
                                 child: Image.asset(_founded[index].photo, fit: BoxFit.cover , width:50,),
                               ),
                             ),

                             title: Text(_founded[index].name)),
                       )
                     );
                  }) : Center(child: Text("No result found", style: TextStyle(color: Colors.black),)),
            ),

          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(selectedIndex: "1",),
    );});
  }
}

