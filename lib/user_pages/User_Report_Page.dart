import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/backend/appointment.dart';
import 'package:swasthya_setu/user_pages/report_tiles.dart';
import 'package:swasthya_setu/utils/colours.dart';

class UserReportPage extends StatelessWidget {
  // final String userUid;
  const UserReportPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // print(userDetailsMap['uid']);
    // print(userDetailsMap['name']);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.pending_actions,
              color: Colors.white,
              weight: 8,
              size: 40,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Report",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 30,
                fontFamily: 'Dosis',
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: maingreen,
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: reportForUserPage(FirebaseAuth.instance.currentUser!.uid),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                    child: Text(
                        "Some Error Occurred , Please try after some time"));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text("Loading..."),
                );
              } else {
                // print(snapshot.data!.size);
                // print(userDetailsMap['uid']);
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.size,
                      itemBuilder: (context, int index) {
                        return snapshot.data!.docs
                            .map((document) => reportTile(document))
                            .toList()[index];
                      }),
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
