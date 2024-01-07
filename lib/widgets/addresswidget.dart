import 'package:flutter/material.dart';
import 'package:swasthya_setu/utils/getlocation.dart';

class AddressText extends StatefulWidget {
  const AddressText({super.key});

  @override
  State<AddressText> createState() => _AddressTextState();
}

String location = "Loading...";
Future<void> getAddress() async {
  location = await getLocation();
}

class _AddressTextState extends State<AddressText> {
  @override
  void initState() {
    getAddress();
    super.initState();
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
