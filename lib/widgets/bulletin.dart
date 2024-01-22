import 'package:flutter/material.dart';

class Bulletin extends StatelessWidget {
  final String value;
  final Size size;
  const Bulletin({super.key, required this.value, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle_rounded,color: Colors.black87,),
        SizedBox(width: size.width*0.03,),
        Text(
          value,
          style: TextStyle(
              fontSize: size.height * 0.02, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}