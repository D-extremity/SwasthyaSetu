import 'package:flutter/material.dart';

class DoctorAddress extends StatelessWidget {
  final String address;
  final Size size;
  const DoctorAddress({super.key, required this.address, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(address,
            maxLines: 2,
            softWrap: true,
            // overflow: TextOverflow.fade,
            style: TextStyle(
                fontSize: size.width / 30, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
