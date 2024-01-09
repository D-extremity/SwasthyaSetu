import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserDetailsProvider extends ChangeNotifier {
  Map<String, dynamic>? _userDetailsMap;
  Map<String, dynamic> get getUserDetailsMap => _userDetailsMap!;

  getUserdetails() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final userDetailsSnap = await _firestore
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    _userDetailsMap = userDetailsSnap.data() as Map<String, dynamic>;
    // print(_userDetailsMap);
    notifyListeners();
  }
}

class DoctorDetailsProvider extends ChangeNotifier {
  Map<String, dynamic>? _DoctorDetailsMap;
  Map<String, dynamic> get getDoctorDetailsMap => _DoctorDetailsMap!;

  getDoctordetails() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final DoctorDetailsSnap = await _firestore
        .collection("Doctors")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    _DoctorDetailsMap = DoctorDetailsSnap.data() as Map<String, dynamic>;
    notifyListeners();
  }
}
