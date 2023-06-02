import 'package:cloud_firestore/cloud_firestore.dart';

class Yemekler {
  String id;
  String tarif;
  String name;

  Yemekler({required this.id, required this.tarif, required this.name});

  factory Yemekler.fromSnapshot(DocumentSnapshot snapshot) {
    return Yemekler(
      id: snapshot.id,
      tarif: snapshot["tarif"],
      name: snapshot["name"],
    );
  }
}
