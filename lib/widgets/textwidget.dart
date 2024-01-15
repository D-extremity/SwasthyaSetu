import 'package:flutter/material.dart';

class DoctorAddress extends StatelessWidget {
  final String address;
  final Size size;
  const DoctorAddress({super.key, required this.address, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(address,
        maxLines: 4,
        softWrap: true,
        style: TextStyle(
            fontSize: size.width / 30, fontWeight: FontWeight.w400));
  }
}
