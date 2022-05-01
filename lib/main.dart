import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revivefrr/controllers/google_signin_controller.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:revivefrr/getStarted/getStarted.dart';
// import 'package:firebase_app_check/firebase_app_check.dart';
// import 'package:revivefrr/leftMenu/Login.dart';

import 'getStarted/first_choice.dart';
import 'pages/welcome.dart';


Future<void> main() async {
  // ClassBuilder.registerClasses();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: FirebaseOptions(
    //     apiKey: 'XijEUSw9BopmwHtllC4M3W8z0',
    //     appId: '1:93688306315:android:108c7f9af8c25f26e0d28e',
    //     messagingSenderId: '93688306315',
    //     projectId: 'revive-11dbb')
  );
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
          // brightness: Brightness.dark
        ),
        home: FirstChoice(),
        // getStarted(),
      ),
    );
  }
}

