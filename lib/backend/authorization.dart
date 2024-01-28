import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/backend/cloudstorage.dart';
import 'package:swasthya_setu/backend/userdetails.dart';
import 'package:swasthya_setu/doctor_pages/doctor_home_page.dart';
import 'package:swasthya_setu/pages/signinoption_page.dart';
import 'package:swasthya_setu/providers/details.dart';
import 'package:swasthya_setu/user_pages/user_home_page.dart';
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
  final Size size;
  final String number;

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
      this.context,
      this.size,
      this.number);
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
          number,
          "Doctor");
      await _storage.uploadDoctorData(doctor, cred);
      await cred.user?.updateDisplayName("Doctor");
      await cred.user?.updatePhotoURL(photoURL);
      // ignore: use_build_context_synchronously
      getScaffold("Account Created Successfully", context, Colors.green);
      await DoctorDetailsProvider().getDoctordetails();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DoctorHomePage(size: size)),(Route<dynamic> route) => false);
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
  final Size size;
  final String number;

  UserAuthorization(
      this._auth,
      this.uid,
      this.age,
      this.address,
      this.email,
      this.photourl,
      this.name,
      this.gender,
      this.password,
      this.context,
      this.size,
      this.number);
  Future<void> signUpWithEmail(Uint8List file) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      StorageMethods _storage = StorageMethods(_auth);
      String photoURL = await _storage.uploadImage(file);

      UserDetails user = UserDetails(cred.user!.uid, age, address, email,
          photoURL, name, gender, password, "User", number);
      await _storage.uploadUserData(user, cred);
      await cred.user?.updateDisplayName("User");
      await cred.user?.updatePhotoURL(photoURL);
      getScaffold("Account Created Successfully", context, Colors.green);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => UserHomePage(size: size)),(Route<dynamic> route) => false);
    } catch (e) {
      print(e);
      getScaffold(e.toString(), context, Colors.red);
    }
  }
}

class LoginMethod {
  final BuildContext context;
  final FirebaseAuth _auth;
  LoginMethod(this.context, this._auth);
  Future<String?> loginUser(String mail, String pass) async {
    try {
      UserCredential cred =
          await _auth.signInWithEmailAndPassword(email: mail, password: pass);
      getScaffold("Logged In Successfully", context, Colors.green);
      String? displayName = cred.user!.displayName;
      displayName == "User"
          ? await UserDetailsProvider().getUserdetails()
          : await DoctorDetailsProvider().getDoctordetails();
      return displayName;
    } catch (e) {
      getScaffold("Login Failed", context, Colors.red);
      return "false";
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => const SignInOptionPage()),(Route<dynamic> route) => false);
          getScaffold("Logged Out", context, Colors.green);
    } catch (e) {
      getScaffold("Try After Some Time", context, Colors.red);
    }
  }
}
