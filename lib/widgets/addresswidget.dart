import 'package:flutter/material.dart';
import 'package:swasthya_setu/utils/colours.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(children: [
          const Text("Refresh"),
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: maingreen,
            ),
            onPressed: () async {
              // String add = await getLocation();
              _location = await getLocation();
              if (_location.substring(0, 9) == "Throttled") {
                _location = "Please Refresh ";
              }
              print(_location);
              setState(() {
                // _location = add;
              });
            },
          )
        ]),
        Text(
          _location,
          softWrap: true,
          style: TextStyle(color: Colors.blue, fontSize: 10),
        ),
      ],
    );
  }
}
