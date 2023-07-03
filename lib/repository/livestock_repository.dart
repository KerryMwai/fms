import 'package:cloud_firestore/cloud_firestore.dart';

class LivestockRepostory{
  final firestore=FirebaseFirestore.instance;

  // Adding feeds to firebase
  Future<void> addFeed(feed)=>firestore.collection("feeds").add(feed);
  Future<void> updateFeed(id, feed)=>firestore.collection("feeds").doc(id).update(feed);
  Stream<QuerySnapshot> getAllFeedsSnapshot()=>firestore.collection("feeds").snapshots();
  Future<void> deleteFeed(id)=>firestore.collection("feeds").doc(id).delete();

  // Livestock feeding schedule
  Future<void> addFeedSchedule(feedschedule)=>firestore.collection("feed-schedules").add(feedschedule);
  Future<void> updateFeedSchedule(id, feedchedule)=>firestore.collection("feed-schedules").doc(id).update(feedchedule);
  Stream<QuerySnapshot> getAllFeedSchedulesSnapshot()=>firestore.collection("feedschedules").snapshots();
  Future<void> deleteFeedSchedule(id)=>firestore.collection("feed-schedules").doc(id).delete();
}