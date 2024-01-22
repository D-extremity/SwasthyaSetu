import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthya_setu/backend/appointment.dart';
import 'package:swasthya_setu/providers/details.dart';
import 'package:swasthya_setu/widgets/attendedpatient_tile.dart';

class Reports extends StatelessWidget {
  final String userUid;
  const Reports({super.key, required this.userUid});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userDetailsMap =
        Provider.of<DoctorDetailsProvider>(context, listen: true)
            .getDoctorDetailsMap;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appointments",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: report(userDetailsMap['uid']),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child:
                    Text("Some Error Occurred , Please try after some time"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading..."),
            );
          }else{
            return ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, int index) {
                return snapshot.data!.docs
                    .map((document) =>
                       patientTile(document,MediaQuery.of(context).size,))
                    .toList()[index];
              });
          }
        },
      ),
    ));
  }
}
