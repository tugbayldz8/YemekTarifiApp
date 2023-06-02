import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/status.dart';

class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String mediaUrl = '';

  Future<Yemekler> addStatus(String tarif, String name) async {
    var ref = _firestore.collection("Yemekler");

    var documentRef = await ref.add({
      'tarif': tarif,
      'name': name,
    });
    return Yemekler(id: documentRef.id, tarif: tarif, name: name);
  }

  //status göstermek için
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("Yemekler").snapshots();

    return ref;
  }

  // status silmek için
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Yemekler").doc(docId).delete();
    return ref;
  }
}
