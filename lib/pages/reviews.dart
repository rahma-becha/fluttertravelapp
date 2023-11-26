import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/HomeAppBar.dart';
import '../widgets/HomeBottomBar.dart';
class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  List locations = [
    "location 1",
    "location 2",
    "location 3",
    "location 4",
    "location 5"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child:  HomeAppBar(title: "Notifications")
      ),
      body: Container(
        color: Colors.transparent,
        child: locations.length > 0 ? ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.all(8),

                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                          child: Text("Not")
                      ),

                      title:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Description",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20
                          ),),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),

                      trailing:  Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ),
              );
            }) : Center(child: Text("No Notifications", style: TextStyle(color: Colors.black),)),
      ),
      bottomNavigationBar: HomeBottomBar(selectedIndex: "0",),
    );  }
}
