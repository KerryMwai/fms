import 'package:cloud_firestore/cloud_firestore.dart';

class CropRepostory{
  FirebaseFirestore firestore=FirebaseFirestore.instance;
// Crop plans
  Future<void> addCropPlan(cropPlan)async=>firestore.collection("crop-plans").add(cropPlan);
  Future<void> updateCropPlan(String id, cropPlan)async=>firestore.collection("crop-plans").doc(id).update(cropPlan);
  Stream<QuerySnapshot> getCropPlanSnapshots()=>firestore.collection("crop-plans").snapshots();
  Future<void> deleteCropPlan(String id)async=>firestore.collection("crop-plans").doc(id).delete();


// Crop tracking
Future<void> addCropGrowthInfor(cropgrowthinfor)=>firestore.collection("crop-growth").add(cropgrowthinfor);
Stream<QuerySnapshot> getAllCropGrowthInforSnapshots()=>firestore.collection("crop-growth").snapshots();
Future<void> updateCropGrowthInfor(String id,cropgrowthinfor)=>firestore.collection("crop-growth").doc(id).update(cropgrowthinfor);
Future<void> deleteCropGrowthInfor(String id)=>firestore.collection("crop-growth").doc(id).delete();

}