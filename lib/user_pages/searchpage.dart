import 'package:flutter/material.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/widgets/doctorcard.dart';

class UserDoctorSearchPage extends StatelessWidget {
  List<Map<String, dynamic>> searchedList;
  String value;
  UserDoctorSearchPage(
      {super.key, required this.searchedList, required this.value});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                    weight: 8,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Searched Results for '$value'",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: 'Dosis',
                      overflow: TextOverflow.fade
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: maingreen,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: searchedList.length,
                      itemBuilder: (context, int index) {
                        return doctorCard(MediaQuery.of(context).size,
                            searchedList[index], context);
                      }),
                ),
              ],
            )));
  }
}
