import 'package:cloud_firestore/cloud_firestore.dart';

class InventoriesRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addSeedInventory(seedInventory) async =>
      firestore.collection("seed-inventory").add(seedInventory);

  Future<void> editSeedInvetory(String id, seedInventory) async =>
      firestore.collection("seed-inventory").doc(id).update(seedInventory);

  Stream<QuerySnapshot> getSeedInventories() {
    return firestore.collection("seed-inventory").snapshots();
  }

  Future<void> deleteSeedInventory(String id) async {
    await firestore.collection("seed-inventory").doc(id).delete();
  }

  Future<void> storepurchsesendEmail(
      String selleremail, String subject, String body) async {
    CollectionReference seedpurchaseInfor =
        firestore.collection("seed-purchase-infor");
    seedpurchaseInfor.add({
      {
        "subject": subject,
        "body": body,
        "seller-email": selleremail,
        "delivered": false
      }
    });
  }



  // Fertilizer methods begins here
  Future<void> addFertlizer(fertilizer) async =>
      firestore.collection("fertilizer-inventory").add(fertilizer);

  Stream<QuerySnapshot> getFertilizerInventories() =>
      firestore.collection("fertilizer-inventory").snapshots();

  Future<void> editFertilizerInventory(String id, fertilizer) async =>
      firestore.collection("fertilizer-inventory").doc(id).update(fertilizer);

  Future<void> deleteFertilizerInventory(String id) async =>
      firestore.collection("fertilizer-inventory").doc(id).delete();




  // Equipment
  Future<void> addEquipment(equipmet) async =>
      firestore.collection("equipment-inventory").add(equipmet);


  Future<void> editEquipment(String id, equipment)=>firestore.collection("equipment-inventory").doc(id).update(equipment);

  Stream<QuerySnapshot> getEquipmentSnapshots()=>firestore.collection("equipment-inventory").snapshots();
  

  Future<void> deleteEquipment(String id) async =>
      firestore.collection("equipment-inventory").doc(id).delete();



// Assigned equipment only
// Stream<QuerySnapshot> getEquipmentAssignedSnapshots()=>firestore.collection("equipment-inventory").where("assigned", isEqualTo: true).snapshots();
Stream<QuerySnapshot> getEquipmentAssignedSnapshots()=>firestore.collection("equipment-inventory").snapshots();
}
