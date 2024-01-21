import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colours.dart';

class UserReportPage extends StatefulWidget {
  const UserReportPage ({super.key});

  @override
  State<UserReportPage> createState() => _State();
}

class _State extends State<UserReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports"),
        centerTitle: true,
        backgroundColor: maingreen,
      ),
    );
  }
}
