import 'package:flutter/material.dart';
import 'package:swasthya_setu/utils/getlocation.dart';

class AddressText extends StatefulWidget {
  const AddressText({super.key});

  @override
  State<AddressText> createState() => _AddressTextState();
}

class _AddressTextState extends State<AddressText> {
  String _location = "Loading...";
  getAddress(BuildContext context) async {
    _location = await getLocation();
    if (_location.substring(0, 9) == "Throttled") {
      _location = "Please Refresh ";
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAddress(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        height: 30,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(shape: const BeveledRectangleBorder()),
            onPressed: () async {
              // String add = await getLocation();
              _location = await getLocation();
              if (_location.substring(0, 9) == "Throttled") {
                _location = "Please Refresh ";
              }
              // print(_location);
              setState(() {
             
              });
            },
            child: const Text("Locate Again",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'DosisRegular',
                    color: Colors.cyan))),
      ),
      const SizedBox(height: 8,),
      Center(
        child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: Colors.green.shade100),
          child: Text(
          "  $_location ",
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      )
    ]);
  }
}
