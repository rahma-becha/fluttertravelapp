import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projetmobilev2/services/reviewService.dart';

import '../models/Review.dart';
import '../widgets/HomeAppBar.dart';
import '../widgets/HomeBottomBar.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key,required this.destination_id});
  final String destination_id;
  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  TextEditingController review=new TextEditingController();
  @override
  void dispose(){
    review.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Review>>(
        future: ReviewService().getReviewByDestination(widget.destination_id),
        builder: (context, snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      }
      final reviews = snapshot.data!;
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
        child: reviews.length > 0
            ? ListView.builder(
                itemCount: reviews.length,
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
                            reviews[index].client.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(
                              reviews[index].client.nom+" "+reviews[index].client.prenom,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                            Spacer(),
                            Text(
                              reviews[index].rating.toString(),
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
                          reviews[index].review,
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
    );});
  }
}
