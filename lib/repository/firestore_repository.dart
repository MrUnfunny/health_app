import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants/constants.dart';
import '../models/home_screen_data.dart';

import '../models/indicator.dart';
import '../models/userdata.dart';
import '../utils/utils.dart';

class FirestoreRepository {
  final firestoreInstance = FirebaseFirestore.instance;

  bool checkUserData() {
    return (FirebaseAuth.instance.currentUser?.displayName != null &&
        FirebaseAuth.instance.currentUser?.displayName != '');
  }

  Future<HomeScreenData> getHomeScreenData() async {
    var cnt = 0;
    var m = <String, num>{};
    final data =
        firestoreInstance.collection(FirebaseAuth.instance.currentUser!.uid);

    for (var element in Constants.indicators) {
      var temp = 0.0;
      var doc = await data.doc(element.name).get();

      doc.data()?.entries.forEach((e) {
        if (DateTime.parse(e.key).day == DateTime.now().day) {
          temp += e.value;
          if (element.name.toLowerCase() == 'heart') {
            cnt++;
          }
        }
      });

      if (element.name.toLowerCase() == 'heart') {
        m[element.name.toLowerCase()] = temp / cnt;
      } else {
        m[element.name.toLowerCase()] = temp;
      }
    }
    return HomeScreenData.fromMap(m);
  }

  Future<HomeScreenData> updateHomeScreenData(
      HomeScreenData data, Indicator indicator) async {
    final doc = await firestoreInstance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc(indicator.name)
        .get();

    var temp = 0.0;
    doc.data()?.entries.forEach((element) {
      if (DateTime.parse(element.key).day == DateTime.now().day) {
        temp += element.value;
      }
    });

    var dataMap = data.toMap();
    dataMap[indicator.name] = temp;

    return HomeScreenData.fromMap(dataMap);
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
        .set(
          toMapWithStringKeys(indicator.data),
          SetOptions(merge: true),
        );
  }

  Future<Map<DateTime, double>> getIndicatorData(Indicator indicator) async {
    var m = <DateTime, double>{};
    final doc = await firestoreInstance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc(indicator.name)
        .get();
    doc.data()?.entries.forEach((element) {
      m[DateTime.parse(element.key)] = element.value as double;
    });

    m = parseDateTimeMap(m);

    return m;
  }
}
