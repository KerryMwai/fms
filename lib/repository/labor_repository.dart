import 'package:cloud_firestore/cloud_firestore.dart';

class LaborRepository{
  final firestore=FirebaseFirestore.instance;

  Future<void> addLaborInfor(laborinfor)=>firestore.collection("labor-information").add(laborinfor);
  Future<void> updateLaborInfor(id, laborInfor)=>firestore.collection("labor-information").doc(id).update(laborInfor);

  Stream<QuerySnapshot> getAllLaborSnapshots()=>firestore.collection("labor-information").snapshots();

  Future<void> deleteLaborInfor(id)=>firestore.collection("labor-information").doc(id).delete();
}