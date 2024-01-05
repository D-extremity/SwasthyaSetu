import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/doctor_pages/doctor_home_page.dart';
import 'package:swasthya_setu/firebase_options.dart';
import 'package:swasthya_setu/pages/signinoption_page.dart';
import 'package:swasthya_setu/user_pages/user_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // FirebaseFirestore getData = FirebaseFirestore.instance;

          User getData = snapshot.data as User;
          if (getData.displayName == "User") {
            return const UserHomePage();
          }else if (getData.displayName == "Doctor") {
            return const DoctorHomePage();
          }
          // print(getData.displayName);
          return const SignInOptionPage();
        },
        // child: const SignInOptionPage()
      ),
    );
  }
}
