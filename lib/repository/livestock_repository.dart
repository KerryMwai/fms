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
  Stream<QuerySnapshot> getAllFeedSchedulesSnapshot()=>firestore.collection("feed-schedules").snapshots();
  Future<void> deleteFeedSchedule(id)=>firestore.collection("feed-schedules").doc(id).delete();

  // Breeding management
   Future<void> addBreedingInformation(breedinginformation)=>firestore.collection("breeding-information").add(breedinginformation);
  Future<void> updateBreedingInformation(id, feedchedule)=>firestore.collection("breeding-information").doc(id).update(feedchedule);
  Stream<QuerySnapshot> getAllBreedingInformationsSnapshots()=>firestore.collection("breeding-information").snapshots();
  Future<void> deleteBreedingInformation(id)=>firestore.collection("breeding-information").doc(id).delete();


  // Filtering data
  Future<void> fetchFilteredData(collection,filterfiled,fieltervalue, fieldtogroupby) async {
  final collectionReference = FirebaseFirestore.instance.collection(collection);

  // Apply filters
  final querySnapshot = await collectionReference
      .where(filterfiled, isEqualTo: fieltervalue)
      .get();

  // Group data based on a certain field
  final groupedData = <String, List<DocumentSnapshot>>{};
  for (var doc in querySnapshot.docs) {
    final fieldValue = doc.data()[fieldtogroupby];
    if (!groupedData.containsKey(fieldValue)) {
      groupedData[fieldValue] = [];
    }
    groupedData[fieldValue]!.add(doc);
  }

  // Access the grouped data
  groupedData.forEach((key, value) {
    print('Group: $key');
    value.forEach((doc) {
      print('Document: ${doc.data()}');
    });
  });
}

}