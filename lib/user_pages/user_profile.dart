import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swasthya_setu/backend/authorization.dart';
import 'package:swasthya_setu/utils/customtextfield.dart';

class UserProfilePage extends StatefulWidget {
  final Size size;
  final String name;
  final String number;
  final String age;
  final String image;
  final String gender;
  final String mail;
  final String address;

  const UserProfilePage(
      {super.key,
      required this.size,
      required this.name,
      required this.number,
      required this.age,
      required this.image,
      required this.gender,
      required this.mail,
      required this.address});

  @override
  State<UserProfilePage> createState() => _SigninUserProfilePageState();
}

class _SigninUserProfilePageState extends State<UserProfilePage> {
  static List<String> item = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    String? dropDownvalue = widget.gender;
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
                Stack(children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.image),
                    radius: constraints.maxHeight * 0.1,
                  ),
                  Positioned(
                    bottom: constraints.maxHeight * 0.01,
                    right: constraints.maxWidth * 0.02,
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo,
                          size: constraints.maxHeight * 0.05),
                      onPressed: () async {
                        // Uint8List dp = await getImage(ImageSource.gallery);

                        // _imagedp = dp;
                        // setState(() {});
                      },
                    ),
                  ),
                ]),
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
                            child: getReadTextField("Age",
                                constraints.maxHeight * 0.05, widget.age),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.09,
                          ),
                          Expanded(
                              child: DropdownButton<String>(
                                  autofocus: true,
                                  focusColor: Colors.grey.shade200,
                                  dropdownColor: Colors.grey.shade200,
                                  value: dropDownvalue,
                                  items: item.map((String value) {
                                    return DropdownMenuItem(
                                      child: Text("$value"),
                                      value: value,
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    // setState(() {
                                    // dropDownvalue = value;
                                    // });
                                  }))
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
                      getReadTextField(
                          "Password", constraints.maxHeight * 0.05, "*****"),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      Text(
                        "Residential Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: constraints.maxHeight * 0.03),
                      ),
                      getReadTextField(
                          "", constraints.maxHeight * 0.07, widget.address),
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
      }),
    ));
  }
}
