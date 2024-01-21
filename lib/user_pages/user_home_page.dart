// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:swasthya_setu/pages/historyappointments.dart';
// import 'package:swasthya_setu/providers/details.dart';
// //import 'package:swasthya_setu/user_pages/user_profile.dart';
// import 'package:swasthya_setu/widgets/active_doctors.dart';
// import 'package:swasthya_setu/widgets/addresswidget.dart';
//
// import '../utils/colours.dart';
// import '../widgets/sidebar.dart';
// /*<<<<<<< HEAD
//
// import '../widgets/sidebar.dart';
// import 'User_Appointment_Page.dart';
// import 'User_Report_Page.dart';
// =======
// >>>>>>> 0e2574056e7a075fae90789bf4ea8514feb308af*/
//
// class UserHomePage extends StatefulWidget {
//   final Size size;
//
//   const UserHomePage({Key? key, required this.size}) : super(key: key);
//
//   @override
//   State<UserHomePage> createState() => _UserHomePageState();
// }
//
// class _UserHomePageState extends State<UserHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<UserDetailsProvider>().getUserdetails();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> userDetailsMap =
//         Provider.of<UserDetailsProvider>(context, listen: true)
//             .getUserDetailsMap;
//
//     return SafeArea(
//       child: Scaffold(
//         drawer: Sidebar(size: widget.size),
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text(
//             "Home Page",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 30,
//               fontFamily: 'Dosis',
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: maingreen,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 10.0,
//                     horizontal: 15,
//                   ),
//                   hintText: "Search Doctors",
//                   suffixIcon: const Icon(Icons.search_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                     borderSide: const BorderSide(),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10), // Adjust the size as needed
//               const Text(
//                 "Your Location",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   fontFamily: 'Dosis-Regular',
//                 ),
//               ),
//               const AddressText(),
//               const SizedBox(height: 10), // Adjust the size as needed
//               Expanded(
//                 child: ActiveDoctorList(size: widget.size),
//               ),
//             ],
//           ),
//
//             SizedBox(
//               height: widget.size.height * 0.02,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 GestureDetector(
//                   onTap: () {},
//                   child: Card(
//                     elevation: 10,
//                     color: Colors.orange,
//                     shape: const RoundedRectangleBorder(),
//                     child: SizedBox(
//                       height: widget.size.height * 0.05,
//                       width: widget.size.width * 0.4,
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.library_books),
//                           Text("Reports"),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => AppointmentHistory(userUid:userDetailsMap['uid'])));
//                   },
//                   child: Card(
//                     color: Colors.orange,
//                     elevation: 10,
//                     shape: const RoundedRectangleBorder(),
//                     child: SizedBox(
//                       height: widget.size.height * 0.05,
//                       width: widget.size.width * 0.4,
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.apps_outage_outlined),
//                           Text(
//                             "Appointments",
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: widget.size.height * 0.02,
//             ),
//             SearchBar(
//               backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
//               leading: Icon(Icons.admin_panel_settings_outlined),
//             ),
//             SizedBox(
//               height: widget.size.height * 0.002,
//             ),
//             Expanded(child: ActiveDoctorList(size: widget.size))
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthya_setu/providers/details.dart';
import 'package:swasthya_setu/user_pages/user_profile.dart';
import 'package:swasthya_setu/utils/colours.dart';
import 'package:swasthya_setu/widgets/active_doctors.dart';
import 'package:swasthya_setu/widgets/addresswidget.dart';

import '../widgets/sidebar.dart';
import 'User_Report_Page.dart';

class UserHomePage extends StatefulWidget {
  final Size size;

  const UserHomePage({Key? key, required this.size}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserDetailsProvider>().getUserdetails();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userDetailsMap =
        Provider.of<UserDetailsProvider>(context, listen: true)
            .getUserDetailsMap;

    return SafeArea(
      child: Scaffold(
        drawer: Sidebar(size: widget.size,userid:userDetailsMap['uid']),
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  hintText: "Search Doctors",
                  suffixIcon: const Icon(Icons.search_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Adjust the size as needed
              const Text(
                "Your Location",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Dosis-Regular',
                ),
              ),
              const AddressText(),
              const SizedBox(height: 10), // Adjust the size as needed
              ActiveDoctorList(size: widget.size),
            ],
          ),
        ),
      ),
    );
  }
}





