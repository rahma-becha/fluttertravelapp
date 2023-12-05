import 'package:projetmobilev2/models/Destination.dart';
import 'package:projetmobilev2/models/Client.dart';

class WhishList {
  String id;
  Client client;
  Destination destination;
  WhishList({required this.id, required this.client, required this.destination});
}
