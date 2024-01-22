import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/utils/toast.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;

class Appointments {
  final BuildContext context;
  Appointments(this.context);
  Future<bool> goActive(
      DateTime open, DateTime close, Map<String, dynamic> doctorDetails) async {
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

Stream<QuerySnapshot> activeDoctors() {
  return _firebasefirestore.collection("Active_Doctors").snapshots();
}

Future<void> bookAppointment(
    String docUid,
    String userUid,
    Map<String, dynamic> userDetails,
    BuildContext context,
    Map<String, dynamic> doctorDetails) async {
  try {
    final uniqueDocId = const Uuid().v1();
    final Map<String, dynamic> details = userDetails;
    details.addAll({"booking time": DateTime.now(), "docId": uniqueDocId});
    doctorDetails
        .addAll({"booking time": DateTime.now(), "docId": uniqueDocId});
    //! to show in appointment page of user
    await _firebasefirestore
        .collection("appointmentsHistory")
        .doc("history")
        .collection(userUid)
        .doc(uniqueDocId)
        .set(doctorDetails);
    //! to show in doctor timeline
    //! use unique uuid dependency to get set own doc id and store it also in that doc , so that it can be stored in history and can be deleted from doctors timeline once patient is checked
    await _firebasefirestore
        .collection("appointments")
        .doc("live")
        .collection(docUid)
        .doc(uniqueDocId)
        .set(details);
    // ignore: use_build_context_synchronously
    getScaffold("Appointment Booked Successfully", context, Colors.green);
  } catch (e) {
    // ignore: use_build_context_synchronously
    getScaffold("Failedto book appointment", context, Colors.red);
  }
}

Stream<QuerySnapshot> userAppointmentsHistory(String userUid) {
  return _firebasefirestore
      .collection("appointmentsHistory")
      .doc("history")
      .collection(userUid)
      .orderBy('booking time', descending: true)
      .snapshots();
}

Stream<QuerySnapshot> scheduledAppointments(String docUid) {
  return _firebasefirestore
      .collection("appointments")
      .doc("live")
      .collection(docUid)
      .orderBy('booking time', descending: true)
      .snapshots();
}

Future<void> attended(Map<String, dynamic> patient, Map<String, dynamic> doctor,
    BuildContext context, Size size) async {
  try {
    //docid is unique document id
    // to be shwon on doctor side
    await _firebasefirestore
        .collection("resolved doctor side")
        .doc("attended patients")
        .collection(doctor['uid'])
        .doc(patient["docId"])
        .set(patient);

// to be shown on user side
    await _firebasefirestore
        .collection("patient reports")
        .doc("history")
        .collection(patient['uid'])
        .doc(patient["docId"])
        .set(doctor);

    await _firebasefirestore
        .collection("appointments")
        .doc("live")
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc(patient["docId"])
        .delete();

    await _firebasefirestore
        .collection("appointmentsHistory")
        .doc("history")
        .collection(patient['uid'])
        .doc(patient["docId"])
        .delete();
    
    
    // ignore: use_build_context_synchronously
    getScaffold("Successful", context, maingreen);
  } catch (e) {
    // ignore: use_build_context_synchronously
    getScaffold("Some Error Occurred", context, Colors.red);
  }
}

Stream<QuerySnapshot> report(String docUid) {
  return  _firebasefirestore
        .collection("resolved doctor side")
        .doc("attended patients")
        .collection(docUid)
      .orderBy('booking time', descending: true)
      .snapshots();
}


Stream<QuerySnapshot> reportForUserPage(String patientUid) {
  return  _firebasefirestore
        .collection("patient reports")
        .doc("history")
        .collection(patientUid)
      .orderBy('attentedAt', descending: true)
      .snapshots();
}