import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/User.dart';

class FBHelper {
  FBHelper._();

  static FBHelper fp = FBHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
  // FirebaseFirestore firestore = FirebaseFirestore.instanceFor(app: secondaryApp);

  Future<bool> addUser(UserModel user) async {
    bool boo = false;
    // firestore.collection("Users").doc(user.Id).set(user.toMap())
    //     .then((value) => print("User Added"))
    //     .catchError((error) => print("Failed to add user: $error"));

    Future<bool> future = firestore
        .collection("Users")
        .add(user.toMap())
        .then((value) => true)
        .catchError((error) => false);

    return future;
  }

  updateUser(UserModel user) async {}

  deleteUser(String id) async {}

  getUser(String id) async {
    firestore.collection("Users").doc(id).get();
  }

  getAllUser() async {}
}
