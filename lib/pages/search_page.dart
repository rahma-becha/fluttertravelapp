 import 'package:flutter/material.dart';
import 'package:projetmobilev2/pages/details_page.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  List _locations = [
   "location 1",
    "location 2",
    "location 3",
    "location 4",
    "location 5"

  ];

  List _founded = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  onSearch(String search) {
    setState(() {
      _founded= _locations.where((loc) => loc.contains(search)).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(image: "assets/city${index+1}.jpg")));
                       },

                       child: Padding(
                         padding: EdgeInsets.all(8),
                         child: ListTile(
                             leading: ClipOval(
                               child: SizedBox.fromSize(
                                 //size: Size.fromRadius(50), // Image radius
                                 child: Image.asset('assets/city${index+1}.jpg', fit: BoxFit.cover , width:50,),
                               ),
                             ),
                             trailing:IconButton(
                               onPressed: (){},
                               icon: Icon(Icons.close),
                             ),
                             title: Text(_founded[index])),
                       )
                     );
                  }) : Center(child: Text("No result found", style: TextStyle(color: Colors.black),)),
            ),

          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(selectedIndex: "1",),
    );
  }
}
