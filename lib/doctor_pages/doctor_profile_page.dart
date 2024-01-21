import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/backend/authorization.dart';
import 'package:swasthya_setu/utils/customtextfield.dart';

class DoctorProfilePage extends StatefulWidget {
  final Size size;
  final String name;
  final String number;
  final String age;
  final String image;
  final String gender;
  final String mail;
  final String address;

  const DoctorProfilePage({
    Key? key,
    required this.size,
    required this.name,
    required this.number,
    required this.age,
    required this.image,
    required this.gender,
    required this.mail,
    required this.address,
  }) : super(key: key);

  @override
  State<DoctorProfilePage> createState() => _SigninUserProfilePageState();
}

class _SigninUserProfilePageState extends State<DoctorProfilePage> {
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
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.image),
                          radius: constraints.maxHeight * 0.1,
                        ),
                        Positioned(
                          bottom: constraints.maxHeight * 0.01,
                          right: constraints.maxWidth * 0.02,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_a_photo,
                              size: constraints.maxHeight * 0.05,
                            ),
                            onPressed: () async {

                            },
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          getReadTextField(
                              "Name", constraints.maxHeight * 0.05, widget.name),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: getReadTextField(
                                    "Experience",
                                    constraints.maxHeight * 0.05,
                                    widget.age),
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
                          getReadTextField(
                              "Phone Number",
                              constraints.maxHeight * 0.05,
                              widget.number),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          getReadTextField(
                              "Email Address",
                              constraints.maxHeight * 0.05,
                              widget.mail),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          getReadTextField(
                              "Password",
                              constraints.maxHeight * 0.05,
                              "*****"),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          getReadTextField(
                              "Address",
                              constraints.maxHeight * 0.07,
                              widget.address),
                          SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                          CupertinoButton(
                            onPressed: () async {
                              await LoginMethod(context, FirebaseAuth.instance)
                                  .logout();
                            },
                            color: Colors.red,
                            child: const Text("Sign Out"),
                          ),
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

