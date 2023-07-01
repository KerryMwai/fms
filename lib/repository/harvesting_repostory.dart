import 'package:cloud_firestore/cloud_firestore.dart';

class HarvestingRepository{
  final firestore=FirebaseFirestore.instance;

  //Harvesting method
  Future<void> addWorkforceFieldAssignment(workforcefieldassignment)=>firestore.collection("work-force-field-assignment").add(workforcefieldassignment);
  Future<void> updateWorkforceFieldAssignment(id,workforcefieldassignment)=>firestore.collection("work-force-field-assignment").doc(id).update(workforcefieldassignment);

  Stream<QuerySnapshot> getAllWorkforceFieldAssignmentSnapshots()=>firestore.collection("work-force-field-assignment").snapshots();

  Future<void> deleteWorkforceFieldAssignment(id)=>firestore.collection("work-force-field-assignment").doc(id).delete();

}