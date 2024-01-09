// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// import 'package:swasthya_setu/pages/signin_as_doctor.dart';

class GetCheckBox extends StatefulWidget {
  bool? isName;
  String name;
  List specializations;
  GetCheckBox({
    Key? key,
    this.isName,
    required this.name,
    required this.specializations,
  }) : super(key: key);

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
                widget.specializations.add(widget.name);
              } else if (value == false) {
                widget.specializations.remove(widget.name);
              }
              print(widget.specializations);
              setState(() {
                widget.isName = value;
              });
            }),
      ],
    );
  }
}
