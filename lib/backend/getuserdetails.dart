// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// Future<Map<String, dynamic>> getUserdetails() async {
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final userDetailsSnap = await _firestore
//       .collection("Users")
//       .doc(FirebaseAuth.instance.currentUser?.uid)
//       .get();
//   return userDetailsSnap.data() as Map<String, dynamic>;
// }