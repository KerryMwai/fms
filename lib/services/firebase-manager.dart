import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fms/pages/home.dart';


class FirebaseManager extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  final Stream<QuerySnapshot> _departmetStream = FirebaseFirestore.instance
      .collection('departments')
      .orderBy("section_name", descending: false)
      .snapshots();

  List departments = [];
  String _wrongpassworderror = "";
  String _donotmatchpass = "";
  String _emailexist = "";

  String get emailexist => _emailexist;
  String get passworddonotmatch => _donotmatchpass;
  get departmentStream => _departmetStream;

  Future signinuser(String useremail, String userpassword, context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: useremail, password: userpassword)
          .then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (_) =>  HomePage())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _wrongpassworderror = "Wrong password provided for that user.";
        print(_wrongpassworderror);
      }
    }
    notifyListeners();
  }

  Future<void> signout(BuildContext context) {
    return _auth.signOut().then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  Future signupuser(String useremail, String userpassword,
      String confirmpassword, context) async {
    try {
      if (userpassword != confirmpassword) {
        _donotmatchpass = "Password don't match";
        return;
      } else {
        await _auth
            .createUserWithEmailAndPassword(
                email: useremail, password: userpassword)
            .then((value) => Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage())));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  testForPasswordMatch(String pass1, String pass2) {
    if (pass1 != pass2) {
      _donotmatchpass = "Password do not match";
    }
    notifyListeners();
  }

  getuserid() {
    if (user != null) {
      return user!.uid;
    }
  }

  Future<void> addsection(
      String secname, String description, BuildContext context) {
    CollectionReference departments =
        FirebaseFirestore.instance.collection("departments");
    return departments
        .add({
          'section_name': secname, // John Doe
          'section_description': description, 
          'subdepartments':[]// Stokes and Sons
          // 42
        })
        .then((value) => Navigator.pop(context))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> deleteDocument(context, String id) async {
    CollectionReference departments =
        FirebaseFirestore.instance.collection("departments");
    await departments.doc(id).delete().then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (context) {return const Text("");})));
    notifyListeners();
  }

  Future<void> addSubdepartment(
      context, docId, String title, String workers, String objective) async {
    DocumentReference docRef =
        firebaseFirestore.collection("departments").doc(docId);
    docRef
        .collection(title)
        .add({"title": title, "workers": workers, "objective": objective}).then(
            (value) => Navigator.pop(context));
  }

  getallSubdepartments(docid) async {
    final docRef =
        FirebaseFirestore.instance.collection('departments').doc(docid);
    return await docRef.snapshots();
  }

  Future<void> updatedsubDepartmets(String documentId, String collectionRef)async{
      CollectionReference collRef=firebaseFirestore.collection("departments");
      var documentRef=collRef.doc(documentId).collection(collectionRef);
      print(documentRef);
      
  }

}
