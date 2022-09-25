// import 'dart:ffi';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mansoor/HighGrade/highGradeMain.dart';
import 'package:mansoor/Parents/parent_home.dart';
import 'package:mansoor/home.dart';
import 'package:mansoor/Login&_SignUp/loginPage.dart';
import 'package:mansoor/ParentLogin_OTP/parent_login_page.dart';
import 'package:mansoor/ParentLogin_OTP/parent_login_page.dart';
import 'package:mansoor/splash_screen.dart';
import 'package:mansoor/welcome_view.dart';
import 'package:get/get.dart';
// import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //   apiKey: "AIzaSyAlJLbrccqIrLjHkFJ2TUWYPCtlU-ydILc",
      //   appId: "1:979380594761:web:3ceaf948e82d88eafa7798",
      //   messagingSenderId: "979380594761",
      //   projectId: "fypproject-36e3e",
      // ),
      );
  await initialization(null);
  runApp(MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: '/loginPage',
            page: () => LoginPage(),
            transition: Transition.fade,
            transitionDuration: Duration(milliseconds: 1000)),
        GetPage(
            name: '/parent_login_page',
            page: () => ParentLogIn(),
            transition: Transition.fade,
            transitionDuration: Duration(milliseconds: 1000)),
        GetPage(
            name: '/highGrade',
            page: () => HigerGrade(),
            transition: Transition.zoom,
            transitionDuration: Duration(milliseconds: 500)),
      ],
      home: SplashScreenWeb(),
      // home: SplashScreenPhone(),
      // home: SplashScreen(
      //   seconds: 4,
      //   navigateAfterSeconds: SplashScreenPhone(),
      //   title: Text(
      //     'Zda-Kra',
      //     style: TextStyle(
      //       fontSize: 80.0,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.blueAccent,
      //     ),
      //     textAlign: TextAlign.center,
      //   ),
      //   backgroundColor: Colors.white,
      //   // styleTextUnderTheLoader: new TextStyle(),
      //   // loaderColor: Colors.blueAccent,
      //   // loadingText: new Text(
      //   //   'Loading...',
      //   //   style: TextStyle(
      //   //     fontSize: 22.0,
      //   //     fontWeight: FontWeight.bold,
      //   //     color: Colors.blueAccent,
      //   //   ),
      //   ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Home();
              // } else if (ParentLogIn == snapshot.hasData) {
              //   return ParentHomeScreen();
            } else {
              return WelcomeScreen();
            }
          },
        ),
      );
}
