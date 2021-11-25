import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/indicator.dart';
import '../models/userdata.dart';
import '../utils/utils.dart';

class FirestoreRepository {
  final firestoreInstance = FirebaseFirestore.instance;

  bool checkUserData() {
    return (FirebaseAuth.instance.currentUser?.displayName != null &&
        FirebaseAuth.instance.currentUser?.displayName != '');
  }

  Future<void> submitUserData(UserData userData) async {
    await firestoreInstance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('data')
        .set(
          userData.toMap(),
        )
        .then(
          (value) async => await FirebaseAuth.instance.currentUser
              ?.updateDisplayName(userData.name),
        );
  }

  Future<void> submitIndicatorData(Indicator indicator) async {
    await firestoreInstance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc(indicator.name)
        .collection('list')
        .add(
          toMapWithStringKeys(indicator.data),
        );
  }
}
