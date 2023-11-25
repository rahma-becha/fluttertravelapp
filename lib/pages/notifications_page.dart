import 'package:flutter/material.dart';
import 'package:projetmobilev2/widgets/HomeAppBar.dart';
import 'package:projetmobilev2/widgets/HomeBottomBar.dart';
class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});
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
              return InkWell(
                onTap: (){},
                child: Padding(
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

                      title:  Text("Lorem Ipsum is simply dummy text of the printing and typesetting",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.justify,),
                      trailing:  Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ),
                ),
              );
            }) : Center(child: Text("No Notifications", style: TextStyle(color: Colors.black),)),
      ),
      bottomNavigationBar: HomeBottomBar(selectedIndex: "0",),
    );
  }
}
