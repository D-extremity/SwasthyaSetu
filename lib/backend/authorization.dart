import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/backend/cloudstorage.dart';
import 'package:swasthya_setu/backend/userdetails.dart';
import 'package:swasthya_setu/utils/toast.dart';

class Authorization {
  final FirebaseAuth _auth;

  final String uid;
  final String age;
  final String address;
  final String email;
  final String photourl;
  final String name;
  final String gender;
  final String bio;
  final String qualification;
  final String password;
  final List specializations;
  final BuildContext context;

  Authorization(
      this._auth,
      this.uid,
      this.age,
      this.address,
      this.email,
      this.photourl,
      this.name,
      this.gender,
      this.bio,
      this.qualification,
      this.password,
      this.specializations,
      this.context);
  Future<void> signUpWithEmail(Uint8List file) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      StorageMethods _storage = StorageMethods(_auth);
      String photoURL = await _storage.uploadImage(file);

      DoctorDetails doctor = DoctorDetails(
          cred.user!.uid,
          age,
          address,
          email,
          photoURL,
          name,
          gender,
          bio,
          qualification,
          password,
          specializations,
          "Doctor");
      await _storage.uploadDoctorData(doctor, cred);
      await cred.user?.updateDisplayName("Doctor");
      await cred.user?.updatePhotoURL(photoURL);
      getScaffold("Account Created Successfully", context, Colors.green);
      Navigator.of(context).pop();
    } catch (e) {
      // print(e);
      getScaffold(e.toString(), context, Colors.red);
    }
  }
}

class UserAuthorization {
  final FirebaseAuth _auth;
  final String uid;
  final String age;
  final String address;
  final String email;
  final String photourl;
  final String name;
  final String gender;
  final String password;
  final BuildContext context;

  UserAuthorization(this._auth, this.uid, this.age, this.address, this.email,
      this.photourl, this.name, this.gender, this.password, this.context);
  Future<void> signUpWithEmail(Uint8List file) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      StorageMethods _storage = StorageMethods(_auth);
      String photoURL = await _storage.uploadImage(file);

      UserDetails user = UserDetails(cred.user!.uid, age, address, email,
          photoURL, name, gender, password, "User");
      await _storage.uploadUserData(user, cred);
      await cred.user?.updateDisplayName("User");
      await cred.user?.updatePhotoURL(photoURL);
      getScaffold("Account Created Successfully", context, Colors.green);
      Navigator.of(context).pop();
    } catch (e) {
      // print(e);
      getScaffold(e.toString(), context, Colors.red);
    }
  }
}

class LoginMethod {
  final BuildContext context;
  final FirebaseAuth _auth;
  LoginMethod(this.context, this._auth);
  Future<bool> loginUser(String mail, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: mail, password: pass);
      getScaffold("Logged In Successfully", context, Colors.green);
      return true;
    } catch (e) {
      getScaffold("Login Failed", context, Colors.red);
      return false;
    }
  }
}
