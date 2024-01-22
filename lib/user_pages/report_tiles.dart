import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/pages/report_view.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/utils/gettime.dart';

Widget reportTile(DocumentSnapshot document) {
  Map<String, dynamic> doc = (document.data() as Map<String, dynamic>);
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) => Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: constraints.maxWidth,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: maingreen,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: constraints.maxHeight*0.02,),
              Text(
                doc['name'],
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: constraints.maxWidth * 0.045),
              ),
              //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              Text(
                "Attended on : ${getDateTimeText((doc["attentedAt"] as Timestamp).toDate())}",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w600,
                    fontSize: constraints.maxWidth * 0.04),
              ),
              //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              Text(
                "Booked on : ${getDateTimeText((doc['attentedAt'] as Timestamp).toDate())}",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: constraints.maxWidth * 0.04),
              ),

              RichText(
                  text: TextSpan(
                text: "Address : ${doc['address']}",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: constraints.maxWidth * 0.04),
              )),
              Row(
                children: [
                  Text(
                    "Check Report Details : ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: constraints.maxWidth * 0.04),
                  ),
                  CupertinoButton(
                      child: const Text("Click Here"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WriteReportView(
                                patientMap: doc,
                                )));
                      })
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
