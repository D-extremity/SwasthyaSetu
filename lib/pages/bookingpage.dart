import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/utils/gettime.dart';
import 'package:swasthya_setu/widgets/bulletin.dart';
import 'package:swasthya_setu/widgets/contacts.dart';
import 'package:swasthya_setu/widgets/textwidget.dart';

class AppointmentBookingPage extends StatelessWidget {
  final Size size;
  final String name;
  final String pfpLink;
  final String address;
  final String mail;
  final String phoneNumber;
  final String bio;
  final String exp;
  final String close;
  final String open;
  final List specialization;
  final String qualification;

  const AppointmentBookingPage(
      {super.key,
      required this.size,
      required this.name,
      required this.pfpLink,
      required this.address,
      required this.mail,
      required this.phoneNumber,
      required this.bio,
      required this.exp,
      required this.close,
      required this.open,
      required this.specialization,
      required this.qualification});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade50,
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.chevron_left_rounded,
                    size: size.width * 0.09,
                  )),
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(pfpLink),
                  radius: size.width / 4,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.height * 0.05)),
              Text("$exp yr Exp. || $qualification || $bio"),
              SizedBox(
                height: size.height * 0.03,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.orange.shade100,
                      child: Row(
                        children: [
                          DoctorAddress(address: "OPEN :    ", size: size),
                          DoctorAddress(address: open, size: size),
                        ],
                      ),
                    ),
                  ]),
              Container(
                color: Colors.orange.shade200,
                child: Row(
                  children: [
                    DoctorAddress(address: "CLOSE :   ", size: size),
                    DoctorAddress(address: close, size: size),
                  ],
                ),
              ),
              Container(
                  color: Colors.green.shade100,
                  child: Text(
                    " SPECIALIZATION ",
                    style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              for (int i = 0; i < specialization.length; i++)
                Bulletin(value: specialization[i].toString(), size: size),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                  color: Colors.green.shade100,
                  child: Text(
                    " Contacts ",
                    style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              Column(
                children: [
                  Contacts(
                    icon: Icons.mail,
                    value: mail,
                    size: size,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Contacts(
                    icon: Icons.phone,
                    value: phoneNumber,
                    size: size,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                  color: Colors.green.shade100,
                  child: Text(
                    " ADDRESS ",
                    style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                address,
                style: TextStyle(
                    fontSize: size.height * 0.02, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: maingreen,
                          fixedSize: Size(double.infinity, size.height * 0.07)),
                      onPressed: () {},
                      icon: Icon(
                        Icons.handshake,
                        color: Colors.black,
                        size: size.height * 0.03,
                      ),
                      label: Text(
                        "Book Appointment",
                        style: TextStyle(
                            color: Colors.black, fontSize: size.height * 0.02),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
