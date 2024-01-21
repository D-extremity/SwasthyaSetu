import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:swasthya_setu/backend/appointment.dart';
import 'package:swasthya_setu/doctor_pages/scheduledappointments.dart';
import 'package:swasthya_setu/providers/details.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/utils/customcheckbox.dart';
import 'package:swasthya_setu/utils/gettime.dart';
import 'package:swasthya_setu/widgets/sidebar_doctor.dart';

import '../widgets/sidebar.dart';
import 'doctor_profile_page.dart';

class DoctorHomePage extends StatefulWidget {
  final Size size;
  const DoctorHomePage({super.key, required this.size});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

bool? isLive = false;

class _DoctorHomePageState extends State<DoctorHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorDetailsProvider>().getDoctordetails();
  }

  DateTime opendatetime = DateTime.now();
  DateTime closedatetime = DateTime.now();
  String open = "Nill";
  String close = "Nill";

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userDetailsMap =
        Provider.of<DoctorDetailsProvider>(context, listen: true)
            .getDoctorDetailsMap;
    String message = "Your Clinic/Hospital is CLOSE Currently";

    if (open == userDetailsMap['open']) {
    } else if (userDetailsMap['open'] is Timestamp) {
      open = getDateTimeText((userDetailsMap['open'] as Timestamp).toDate());

      close = getDateTimeText((userDetailsMap['close'] as Timestamp).toDate());
      (DateTime.now().compareTo(
                      (userDetailsMap['close'] as Timestamp).toDate()) ==
                  -1 &&
              (DateTime.now().compareTo(
                      (userDetailsMap['open'] as Timestamp).toDate())) ==
                  1)
          ? message = "Your Clinic/Hospital is Live"
          : message = "Your Clinic/Hospital is CLOSE Currently";
    } else {
      open = getDateTimeText(userDetailsMap['open']);

      close = getDateTimeText(userDetailsMap['close']);
      (DateTime.now().compareTo((userDetailsMap['open'] as DateTime)) == 1 &&
              DateTime.now().compareTo(userDetailsMap['close'] as DateTime) ==
                  -1)
          ? message = "Your Clinic/Hospital is Live"
          : message = "Your Clinic/Hospital is CLOSE Currently";
    }

    return SafeArea(
        child: Scaffold(
          drawer: SidebarDoctor(size: widget.size),
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Home Page",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Dosis',
              ),
            ),
            centerTitle: true,
            backgroundColor: maingreen,
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: widget.size.height * 0.03,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Refresh"),
                style:
                    ElevatedButton.styleFrom(shape: BeveledRectangleBorder()),
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.1,
              width: double.maxFinite,
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          /*IconButton(
                            icon: CircleAvatar(
                              backgroundImage:
                                  NetworkImage("${userDetailsMap['photoURL']}"),
                              radius: widget.size.width * 0.2,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => DoctorProfilePage(
                                      size: widget.size,
                                      name: userDetailsMap['name'],
                                      number: userDetailsMap['number'],
                                      age: userDetailsMap['age'],
                                      image: userDetailsMap['photoURL'],
                                      gender: userDetailsMap['gender'],
                                      mail: userDetailsMap['email'],
                                      address: userDetailsMap['address']))));
                            },
                          ),*/
                          SizedBox(
                            height: widget.size.height * 0.002,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: widget.size.width * 0.9,
                        child: Column(
                          children: [
                            /*Text(
                              "${userDetailsMap['name']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                              softWrap: true,
                            ),*/
                            /*Text(
                              "${userDetailsMap['specialization']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),*/
                            SizedBox(
                              height: widget.size.height * 0.01,
                            ),
                            const Text(
                              "Clinic Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(
                              height: widget.size.height * 0.01,
                            ),
                            Text(
                              "${userDetailsMap['address']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: maingreen,
                  shape: const RoundedRectangleBorder(),
                  child: SizedBox(
                    height: widget.size.height * 0.05,
                    // width: widget.size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.library_books),
                        Text(
                          open,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: widget.size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.red,
                  shape: const RoundedRectangleBorder(),
                  child: SizedBox(
                    height: widget.size.height * 0.05,
                    // width: widget.size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.apps_outage_outlined),
                        Text(
                          close,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: widget.size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Text(
              message,
              style: TextStyle(color: Colors.blue),
            ),
            SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  DateTime? _opendateTime = opendatetime;
                  DateTime? _closedateTime = closedatetime;
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: SizedBox(
                              height: widget.size.height * 0.4,
                              child: Column(
                                children: [
                                  Container(
                                      color: maingreen,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: widget.size.height * 0.02,
                                          ),
                                          Text(
                                            "OPENING TIME :",
                                            style: TextStyle(
                                                fontSize:
                                                    widget.size.width * 0.05),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(11),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape:
                                                      const BeveledRectangleBorder()),
                                              onPressed: () async {
                                                _opendateTime =
                                                    await showOmniDateTimePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1600)
                                                      .subtract(const Duration(
                                                          days: 3652)),
                                                  lastDate: DateTime.now().add(
                                                    const Duration(days: 3652),
                                                  ),
                                                  is24HourMode: false,
                                                  isShowSeconds: false,
                                                  minutesInterval: 1,
                                                  secondsInterval: 1,
                                                  isForce2Digits: true,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(16)),
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxWidth: 350,
                                                    maxHeight: 650,
                                                  ),
                                                  transitionBuilder: (context,
                                                      anim1, anim2, child) {
                                                    return FadeTransition(
                                                      opacity: anim1.drive(
                                                        Tween(
                                                          begin: 0,
                                                          end: 1,
                                                        ),
                                                      ),
                                                      child: child,
                                                    );
                                                  },
                                                  transitionDuration:
                                                      const Duration(
                                                          milliseconds: 200),
                                                  barrierDismissible: true,
                                                );
              
                                                // print("dateTime: $_opendateTime");
                                              },
                                              child:
                                                  const Text("SET OPENING TIME"),
                                            ),
                                            //  Text( "Date: ${_opendateTime!.day}/${_opendateTime!.month}  Time: ${_opendateTime!.hour}:${_opendateTime!.minute}")),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    height: widget.size.height * 0.04,
                                  ),
                                  Container(
                                      color: Colors.orange,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: widget.size.height * 0.02,
                                          ),
                                          Text(
                                            "CLOSING TIME :",
                                            style: TextStyle(
                                                fontSize:
                                                    widget.size.width * 0.05),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape:
                                                      const BeveledRectangleBorder()),
                                              onPressed: () async {
                                                _closedateTime =
                                                    await showOmniDateTimePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1600)
                                                      .subtract(const Duration(
                                                          days: 3652)),
                                                  lastDate: DateTime.now().add(
                                                    const Duration(days: 3652),
                                                  ),
                                                  is24HourMode: false,
                                                  isShowSeconds: false,
                                                  minutesInterval: 1,
                                                  secondsInterval: 1,
                                                  isForce2Digits: true,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(16)),
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxWidth: 350,
                                                    maxHeight: 650,
                                                  ),
                                                  transitionBuilder: (context,
                                                      anim1, anim2, child) {
                                                    return FadeTransition(
                                                      opacity: anim1.drive(
                                                        Tween(
                                                          begin: 0,
                                                          end: 1,
                                                        ),
                                                      ),
                                                      child: child,
                                                    );
                                                  },
                                                  transitionDuration:
                                                      const Duration(
                                                          milliseconds: 200),
                                                  barrierDismissible: true,
                                                );
              
                                                // print("dateTime: $_opendateTime");
                                              },
                                              child:
                                                  const Text("SET CLOSING TIME"),
                                            ),
                                            //  Text( "Date: ${_opendateTime!.day}/${_opendateTime!.month}  Time: ${_opendateTime!.hour}:${_opendateTime!.minute}")),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    height: widget.size.height * 0.02,
                                  ),
                                  const IsLiveCheckBox(),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (isLive == false) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Please Check the Box"),
                                      backgroundColor: Colors.red,
                                    ));
                                  } else if (_opendateTime != null &&
                                      _closedateTime != null &&
                                      (_opendateTime?.compareTo(DateTime.now()) ==
                                              0 ||
                                          _opendateTime
                                                  ?.compareTo(DateTime.now()) ==
                                              1) &&
                                      _closedateTime?.compareTo(DateTime.now()) ==
                                          1 &&
                                      _closedateTime?.compareTo(_opendateTime!) ==
                                          1) {
                                    String openTime =
                                        "Date: ${_opendateTime!.day}/${_opendateTime!.month}  Time: ${_opendateTime!.hour}:${_opendateTime!.minute}    ";
                                    String closeTime =
                                        "Date: ${_closedateTime!.day}/${_closedateTime!.month} Time: ${_closedateTime!.hour}:${_closedateTime!.minute}    ";
                                    opendatetime = _opendateTime!;
                                    closedatetime = _closedateTime!;
                                    bool isActive = await Appointments(
                                             context)
                                        .goActive(
                                            _opendateTime!, _closedateTime!,userDetailsMap);
                                    if (isActive) {
                                      setState(() {
                                        open = openTime;
                                        close = closeTime;
                                        // print("line 364 runned step 1");
                                      });
                                      Navigator.of(context).pop();
                                    } else {
                                      Navigator.of(context).pop();
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          "Please Check Your Opening Time and Closing Time"),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: maingreen),
                                child: const Text(
                                  "Confirm",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ));
                },
                child: Card(
                  color: Colors.orange,
                  shape: const RoundedRectangleBorder(),
                  child: SizedBox(
                    height: widget.size.height * 0.05,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.timelapse_sharp),
                        Text(
                          "Schedule Appointments",
                          style: TextStyle(fontSize: widget.size.width * 0.05),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.01
            ),
            Text("Scheduled Appointments"),
            ScheduledAppointments(docUid: userDetailsMap['uid'],size: widget.size,)
          ],
        ),
      ),
    ));
  }
}
