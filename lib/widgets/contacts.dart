import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  final IconData icon;
  final String value;
  final Size size;
  const Contacts({super.key, required this.icon, required this.value, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 2,),
        Text(
          value,
          style: TextStyle(
              fontSize: size.height * 0.02, fontWeight: FontWeight.w500,color: Colors.blue.shade700),
        )
      ],
    );
  }
}


