import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthya_setu/providers/details.dart';
import 'package:swasthya_setu/widgets/addresswidget.dart';

class UserHomePage extends StatelessWidget {
  final Size size;
  const UserHomePage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    context.read<UserDetailsProvider>().getUserdetails();
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
              height: size.height * 0.2,
              width: double.maxFinite,
              // color: maingreen,
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage("${userDetailsMap['photoURL']}"),
                        radius: size.width * 0.25,
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        child: Column(
                          children: [
                            Text(
                              "${userDetailsMap['name']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),softWrap: true,
                            ),
                          SizedBox(height: size.height*0.02,),
                            const Text(
                              "Current Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const AddressText(),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: ()  {
                
                  },
                  child: Card(
                    color: Colors.orange,
                    shape: const RoundedRectangleBorder(),
                    child: SizedBox(
                      height: size.height * 0.05,
                      width: size.width * 0.4,
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
                    height: size.height * 0.05,
                    width: size.width * 0.4,
                    child:  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apps_outage_outlined),
                        Text("Appointments",)
                      ],
                    ),
                  ),
                )
              ],
            ),
             SizedBox(height: size.height*0.02,),
             SearchBar(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),leading: Icon(Icons.admin_panel_settings_outlined),)
          ],
        ),
      ),
    ));
  }
}
