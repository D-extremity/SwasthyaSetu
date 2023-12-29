import 'package:flutter/material.dart';
import 'package:swasthya_setu/pages/signin_as_doctor.dart';

class GetCheckBox extends StatefulWidget {
  bool? isName;
  String name;
  GetCheckBox({super.key, required this.isName, required this.name});

  @override
  State<GetCheckBox> createState() => _GetCheckBoxState();
}

class _GetCheckBoxState extends State<GetCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.name),
        Checkbox(
            value: widget.isName,
            onChanged: (bool? value) {
              if (value == true) {
                specializations.add(widget.name);
              } else if (value == false) {
                specializations.remove(widget.name);
              }
              print(specializations);
              setState(() {
                widget.isName = value;
              });
            }),
      ],
    );
  }
}
