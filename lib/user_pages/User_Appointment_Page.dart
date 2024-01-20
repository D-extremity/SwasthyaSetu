import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAppointmentPage extends StatefulWidget {
  const UserAppointmentPage ({super.key});

  @override
  State<UserAppointmentPage> createState() => _State();
}

class _State extends State<UserAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
    );
  }
}
