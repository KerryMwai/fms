import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fms/controller/model/farm.dart';
import 'package:fms/controller/model/farm_user.dart';

class UserController extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  final firebaseInstance = FirebaseFirestore.instance;

  Future<bool> signInUser(FarmUser user) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      notifyListeners();
      return true;
    } catch (e) {
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUpUser(FarmUser user) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      return true;
    } catch (e) {
      notifyListeners();
      return false;
    }
  }

  Future<void> signOutUser() async {
    await _auth.signOut();
    notifyListeners();
  }

  // Department management
  Stream<QuerySnapshot> getalldepartments() {
    Stream<QuerySnapshot> departmentstream =
        firebaseInstance.collection('departments').snapshots();
    return departmentstream;
  }

  Stream<QuerySnapshot> getAllSubDepartments(String id, String name) {
    return firebaseInstance
        .collection("departments/$id/$name")
        .snapshots();
  }


  Future<void> createFarmDepartment(Farm farm) async {
    CollectionReference farmDepartment =
        firebaseInstance.collection('departments');
    await farmDepartment.add({
      "name": farm.name,
      "description": farm.description,
    });
  }


  Future<void> createFarmSubDepartment(Farm farm, String id, String name ) async {
    CollectionReference farmDepartment =
        firebaseInstance.collection('departments/$id/$name');
    await farmDepartment.add({
      "name": farm.name,
      "description": farm.description,
    });
  }

  Future<void> createFarmNestedSubDepartmet(Farm farm, String id1, String id2, String name1, String name2)async{
      CollectionReference farmDepartment =
        firebaseInstance.collection('departments/$id1/$name1/$id2/$name2');
    await farmDepartment.add({
      "name": farm.name,
      "description": farm.description,
    });
  }

  Future<void> deleteDepartment(String id)async{
    CollectionReference farmDepartment =
        firebaseInstance.collection('departments');
        await farmDepartment.doc(id).delete();
  }

}
