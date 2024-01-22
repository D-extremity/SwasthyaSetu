import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthya_setu/doctor_pages/doctor_home_page.dart';
import 'package:swasthya_setu/firebase_options.dart';
import 'package:swasthya_setu/pages/signinoption_page.dart';
import 'package:swasthya_setu/providers/details.dart';
import 'package:swasthya_setu/user_pages/user_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorDetailsProvider(),
        )
      ],
      child: MaterialApp(
        routes: {
          'doctorHomePage':(context) => DoctorHomePage(size: size)
        },
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            // FirebaseFirestore getData = FirebaseFirestore.instance;
            if (snapshot.hasError) {
              return const Text("Loading");
            } else if (snapshot.hasData) {
              User getData = snapshot.data as User;
              if (getData.displayName == "User") {
                

                return UserHomePage(
                  size: size,
                );
              } else if (getData.displayName == "Doctor") {
                return DoctorHomePage(size: size);
              }
            }
            // print(getData.displayName);
            return const SignInOptionPage();
          },
          // child: const SignInOptionPage()
        ),
      ),
    );
  }
}
