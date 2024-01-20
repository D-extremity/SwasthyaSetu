import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/backend/appointment.dart';
import 'package:swasthya_setu/widgets/appointmenthistorywidget.dart';

class AppointmentHistory extends StatelessWidget {
  final String userUid;
  const AppointmentHistory({super.key, required this.userUid});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appointments",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: userAppointmentsHistory(userUid),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child:
                    Text("Some Error Occurred , Please try after some time"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading..."),
            );
          }else{
            return ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, int index) {
                return snapshot.data!.docs
                    .map((document) =>
                       appointmentHistoryTile(document))
                    .toList()[index];
              });
          }
        },
      ),
    ));
  }
}
