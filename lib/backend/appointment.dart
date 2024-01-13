import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/utils/toast.dart';

class Appointments {
  Map<String, dynamic> doctorDetails;
  final BuildContext context;
  Appointments(this.doctorDetails, this.context);
  final FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;
  Future<bool> goActive(DateTime open, DateTime close) async {
    try {
      doctorDetails.addAll({"open": open, "close": close});
      await _firebasefirestore
        .collection("Doctors")
        .doc(doctorDetails['uid'])
        .set(doctorDetails);
      await _firebasefirestore
          .collection("Active_Doctors")
          .doc(doctorDetails['uid'])
          .set(doctorDetails);
      // ignore: use_build_context_synchronously
      getScaffold(
          "You Will be Active At Your Scheduled Time", context, maingreen);
      return true;
    } catch (e) {
      // ignore: use_build_context_synchronously
      getScaffold("Some Error Occurred", context, Colors.red);
      return false;
    }
  }
}
