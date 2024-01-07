import 'package:flutter/material.dart';
import 'package:swasthya_setu/utils/getlocation.dart';

class AddressText extends StatefulWidget {
  const AddressText({super.key});

  @override
  State<AddressText> createState() => _AddressTextState();
}


class _AddressTextState extends State<AddressText> {
  String location = "Loading...";
getAddress(BuildContext context) async {
  location = await getLocation();
  setState(() {
    
  });
}

  @override
  void initState() {
    super.initState();
    getAddress(context);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$location",
      softWrap: true,
      style: TextStyle(color: Colors.blue),
    );
  }
}
