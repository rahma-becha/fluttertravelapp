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
  TextEditingController review=new TextEditingController();
  List locations = [
    "location 1",
    "location 2",
    "location 3",
    "location 4",
    "location 5"
  ];
  @override
  void dispose(){
    review.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.remove,
              size: 18,
            ),
          )),
      body: Container(
        color: Colors.transparent,
        child: locations.length > 0
            ? ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/person1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(
                              "User User",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                            Spacer(),
                            Text(
                              "4.6",
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 30,
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                        subtitle: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: Text(
                "No Reviews",
                style: TextStyle(color: Colors.black),
              )),
      ),
    );
  }
}
