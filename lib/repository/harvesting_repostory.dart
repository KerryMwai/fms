import 'package:cloud_firestore/cloud_firestore.dart';

class HarvestingRepository{
  final firestore=FirebaseFirestore.instance;

  //Harvesting workforce workload methods
  Future<void> addWorkforceFieldAssignment(workforcefieldassignment)=>firestore.collection("work-force-field-assignment").add(workforcefieldassignment);
  Future<void> updateWorkforceFieldAssignment(id,workforcefieldassignment)=>firestore.collection("work-force-field-assignment").doc(id).update(workforcefieldassignment);

  Stream<QuerySnapshot> getAllWorkforceFieldAssignmentSnapshots()=>firestore.collection("work-force-field-assignment").snapshots();

  Future<void> deleteWorkforceFieldAssignment(id)=>firestore.collection("work-force-field-assignment").doc(id).delete();

  // Harvesting information on plans
  Future<void> addHarvestingPlans(plan)=>firestore.collection("harvesting-plans").add(plan);
  Future<void> updateHarvestingPlan(id, plan)=>firestore.collection("harvesting-plans").doc(id).update(plan);
  Stream<QuerySnapshot> getAllharvestingplansSnapshots()=>firestore.collection("harvesting-plans").snapshots();

  Future<void> deleteHarvestingPlan(id)=>firestore.collection("harvesting-plans").doc(id).delete();

}