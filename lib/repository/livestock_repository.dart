import 'package:cloud_firestore/cloud_firestore.dart';

class LivestockRepostory{
  final firestore=FirebaseFirestore.instance;

  // Adding feeds to firebase
  Future<void> addFeed(feed)=>firestore.collection("feeds").add(feed);
  Future<void> updateFeed(id, feed)=>firestore.collection("feed").doc(id).update(feed);
  Stream<QuerySnapshot> getAllFeedsSnapshot()=>firestore.collection("feed").snapshots();
  Future<void> deleteFeed(id)=>firestore.collection("feed").doc(id).delete();
}