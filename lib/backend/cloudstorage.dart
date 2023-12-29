import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:swasthya_setu/backend/userdetails.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth;
  StorageMethods(this._auth);

  Future<String> uploadImage(Uint8List file) async {
    Reference ref =
        _storage.ref().child("profilepicture").child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }

  Future<void> uploadDoctorData(
      DoctorDetails doctorDetails, UserCredential cred) async {
    await _firestore
        .collection("Doctors")
        .doc(cred.user?.uid)
        .set(doctorDetails.getDetailsMap());
  }


  Future<void> uploadUserData(
      UserDetails userDetails, UserCredential cred) async {
    await _firestore
        .collection("Users")
        .doc(cred.user?.uid)
        .set(userDetails.getDetailsMap());
  }
}
