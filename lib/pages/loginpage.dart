import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:swasthya_setu/backend/authorization.dart';
import 'package:swasthya_setu/doctor_pages/doctor_home_page.dart';
import 'package:swasthya_setu/user_pages/user_home_page.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/utils/customtextfield.dart';
import 'package:swasthya_setu/utils/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _getEmail = TextEditingController();
  TextEditingController _getPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: maingreen,
        title: Text(
          "Swasthya Setu",
          style: TextStyle(
              color: mainwhite,
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.05),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 199, 215, 180),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Lottie.asset("assets/medical.json"),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      getTextField("Email Address",
                          constraints.maxHeight * 0.05, _getEmail),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      getTextField("Password", constraints.maxHeight * 0.05,
                          _getPassword),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      CupertinoButton(
                        onPressed: () async {
                          if (_getEmail.text.isEmpty ||
                              _getPassword.text.isEmpty) {
                            getScaffold("Some Enteries are not filled", context,
                                Colors.red);
                          } else {
                            String? isLoggedin = await LoginMethod(
                                    context, FirebaseAuth.instance)
                                .loginUser(_getEmail.text.trim(),
                                    _getPassword.text.trim());
                            if (isLoggedin == "User") {
                              //! get type if type==user then show user ui otherwise show doctor ui
                              
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserHomePage(size: size)),(Route<dynamic> route) => false);
                            } else if (isLoggedin == "Doctor") {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DoctorHomePage(size: size)),(Route<dynamic> route) => false);
                            }
                          }
                        },
                        color: maingreen,
                        child: const Text("Login"),
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
