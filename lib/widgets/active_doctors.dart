import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/backend/appointment.dart';
import 'package:swasthya_setu/widgets/doctorcard.dart';

List<Map<String, dynamic>> searchedListByUser = [{}];

class ActiveDoctorList extends StatelessWidget {
  final Size size;
  const ActiveDoctorList({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: activeDoctors(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Loading...\nNetwork is Slow"),
          );
        } else if (snapshot.hasData) {
          // print("*******");
          // print(snapshot.data!.docs
          //     .map((document) => (document.data() as Map<String,dynamic>))
          //     .toList());
          // print("*******");
          List<Map<String, dynamic>> allDoctors = snapshot.data!.docs
              .map((document) => (document.data() as Map<String, dynamic>))
              .toList();
          searchedListByUser = allDoctors;
          return ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, int index) {
                return snapshot.data!.docs
                    .map((document) =>
                        doctorCard(size, searchedListByUser[index], context))
                    .toList()[index];
              });
        } else if (snapshot.hasError) {
          return Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Text("Error Occurred\n${snapshot.error}"),
            ),
          );
        }
        return const Center(
          child: SizedBox(
            height: 150,
            width: 150,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
