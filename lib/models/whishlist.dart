import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/User.dart';

class WhishList {
  String id;
  User user;
  Destination destination;
  WhishList({required this.id, required this.user, required this.destination});
  factory WhishList.fromMap(Map<String, dynamic> data) {
    return WhishList(
      id: data["id"],
      user: data['user'],
      destination: data['destination'],
    );
  }
}
