import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthya_setu/providers/details.dart';
import 'package:swasthya_setu/user_pages/user_profile.dart';
import 'package:swasthya_setu/widgets/addresswidget.dart';

class UserHomePage extends StatefulWidget {
  final Size size;
  const UserHomePage({super.key, required this.size});

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
    // print(userDetailsMap);
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: widget.size.height * 0.2,
              width: double.maxFinite,
              // color: maingreen,
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      IconButton(
                        icon: CircleAvatar(
                          backgroundImage:
                              NetworkImage("${userDetailsMap['photoURL']}"),
                          radius: widget.size.width * 0.25,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => UserProfilePage(
                                  size: widget.size,
                                  name: userDetailsMap['name'],
                                  number: userDetailsMap['number'],
                                  age: userDetailsMap['age'],
                                  image: userDetailsMap['photoURL'],
                                  gender: userDetailsMap['gender'],
                                  mail: userDetailsMap['email'],
                                  address: userDetailsMap['address']))));
                        },
                      ),
                      SizedBox(
                        width: widget.size.width * 0.35,
                        child: Column(
                          children: [
                            Text(
                              "${userDetailsMap['name']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                              softWrap: true,
                            ),
                            SizedBox(
                              height: widget.size.height * 0.01,
                            ),
                            const Text(
                              "Current Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const AddressText(),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: widget.size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: Colors.orange,
                    shape: const RoundedRectangleBorder(),
                    child: SizedBox(
                      height: widget.size.height * 0.05,
                      width: widget.size.width * 0.4,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.library_books),
                          Text("Reports"),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.orange,
                  shape: const RoundedRectangleBorder(),
                  child: SizedBox(
                    height: widget.size.height * 0.05,
                    width: widget.size.width * 0.4,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apps_outage_outlined),
                        Text(
                          "Appointments",
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: widget.size.height * 0.02,
            ),
            SearchBar(
              backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
              leading: Icon(Icons.admin_panel_settings_outlined),
            )
          ],
        ),
      ),
    ));
  }
}
