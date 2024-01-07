import 'package:flutter/material.dart';

class DoctorHomePage extends StatelessWidget {
  final Size size;
  const DoctorHomePage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text("Doctor"));
  }
}
