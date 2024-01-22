import 'package:flutter/material.dart';
import 'package:swasthya_setu/utils/colours.dart';

class WriteReportView extends StatelessWidget {
  final Map<String, dynamic> patientMap;
  const WriteReportView({super.key, required this.patientMap});

  @override
  Widget build(BuildContext context) {
    TextEditingController _getReport = TextEditingController();
    TextEditingController _getMedicine = TextEditingController();
    TextEditingController _getTest = TextEditingController();
    TextEditingController _getPrecaution = TextEditingController();
    _getMedicine.text = patientMap["medicine"];
    _getPrecaution.text = patientMap["precaution"];
    _getReport.text = patientMap["report"];
    _getTest.text = patientMap["test"];

    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.pending_actions,
              color: Colors.white,
              weight: 8,
              size: 40,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Report",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 30,
                fontFamily: 'Dosis',
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: maingreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Report/Comments",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: size.height * 0.035,
              fontFamily: 'Dosis',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: TextField(
              readOnly: true,
              autofocus: true,
              controller: _getReport,
              maxLines: 8,
              keyboardType: TextInputType.multiline, // this is change
              textInputAction: TextInputAction.newline, // this is change
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: size.width * 0.45,
                child: Column(
                  children: [
                    Text(
                      "Medicine(s)",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.height * 0.035,
                        fontFamily: 'Dosis',
                      ),
                    ),
                    SizedBox(
                      child: TextField(
                        readOnly: true,

                        autofocus: true,
                        controller: _getMedicine,
                        maxLines: 8,
                        keyboardType: TextInputType.multiline, // this is change
                        textInputAction:
                            TextInputAction.newline, // this is change
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.35,
                child: Column(
                  children: [
                    Text(
                      "Test(s)",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.height * 0.035,
                        fontFamily: 'Dosis',
                      ),
                    ),
                    SizedBox(
                      child: TextField(
                        readOnly: true,

                        autofocus: true,
                        controller: _getTest,
                        maxLines: 8,
                        keyboardType: TextInputType.multiline, // this is change
                        textInputAction:
                            TextInputAction.newline, // this is change
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            "Precaution(s)",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: size.height * 0.035,
              fontFamily: 'Dosis',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: TextField(
              readOnly: true,

              autofocus: true,
              controller: _getPrecaution,
              maxLines: 2,
              keyboardType: TextInputType.multiline, // this is change
              textInputAction: TextInputAction.newline, // this is change
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
