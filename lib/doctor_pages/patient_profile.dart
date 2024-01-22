import 'package:flutter/material.dart';
import 'package:swasthya_setu/doctor_pages/write_report.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/utils/customtextfield.dart';

class PatientProfilePage extends StatefulWidget {
  final Size size;
  final String name;
  final String number;
  final String age;
  final String image;
  final String gender;
  final String mail;
  final String address;
  final Map<String, dynamic> patientMap;

  const PatientProfilePage({
    Key? key,
    required this.size,
    required this.name,
    required this.number,
    required this.age,
    required this.image,
    required this.gender,
    required this.mail,
    required this.address,
    required this.patientMap,
  }) : super(key: key);

  @override
  State<PatientProfilePage> createState() => _SigninUserProfilePageState();
}

class _SigninUserProfilePageState extends State<PatientProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 199, 215, 180),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.image),
                      radius: constraints.maxHeight * 0.1,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          getReadTextField("Name", constraints.maxHeight * 0.05,
                              widget.name),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: getReadTextField("Age",
                                    constraints.maxHeight * 0.05, widget.age),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.09,
                              ),
                              Expanded(
                                child: getReadTextField(
                                  "Gender",
                                  constraints.maxHeight * 0.05,
                                  widget.gender,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          getReadTextField("Phone Number",
                              constraints.maxHeight * 0.05, widget.number),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          getReadTextField("Email Address",
                              constraints.maxHeight * 0.05, widget.mail),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          getReadTextField("Address",
                              constraints.maxHeight * 0.07, widget.address),
                          SizedBox(
                            height: constraints.maxHeight * 0.015,
                          ),
                          Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: maingreen,
                                      fixedSize: Size(double.infinity,
                                          widget.size.height * 0.07)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WriteReportPage(
                                                    patientMap:
                                                        widget.patientMap)));
                                  },
                                  icon: Icon(
                                    Icons.handshake,
                                    color: Colors.black,
                                    size: widget.size.height * 0.03,
                                  ),
                                  label: Text(
                                    "Attended",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: widget.size.height * 0.02),
                                  )))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
