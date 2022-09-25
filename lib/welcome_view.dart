import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mansoor/Parents/parent_home.dart';
import 'package:url_launcher/link.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .65,
              color: Colors.lightGreen,
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .30, left: 30),
                child: Text(""),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .50,
                      right: 10.0,
                      left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pop();
                      Get.toNamed(
                        '/loginPage',
                      );
                    },
                    child: Container(
                      height: 230.0,
                      width: 150.0,
                      child: Card(
                        color: Colors.blue,
                        elevation: 10.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 230.0,
                              height: 175.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/userLogedin.png"),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter)),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Text(
                              "Student",
                              style: TextStyle(fontSize: 18),
                            ),
                            // Text("Login as Student",style: TextStyle(fontSize: 14),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .50,
                      right: 20.0,
                      left: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => ParentHomeScreen(),
                      //   ),
                      // );
                      Get.toNamed('/parent_login_page');
                    },
                    child: Container(
                      height: 230.0,
                      width: 150.0,
                      child: Card(
                        color: Colors.red,
                        elevation: 10.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 230.0,
                              height: 175.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/children.png"),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Text(
                              "PARENTS",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                color: Colors.black87,
                child: Link(
                  target: LinkTarget.self,
                  uri: Uri.parse('https://www.youtube.com/'),
                  builder: (context, followLink) => TextButton(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Skip",
                          style:
                              TextStyle(fontSize: 16, color: Colors.lightBlue),
                        )),
                    onPressed: followLink,
                  ),
                ),
              ),
            ),
          ],
        ),
        // body: Container(
        //   width: double.infinity,
        //   // height: MediaQuery.of(context).size.height,
        //   padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     Column(
        //       children: <Widget>[
        //         SizedBox(height: 10,),
        //         Text(
        //           "Welcome",
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 30,
        //           ),
        //         ),
        //
        //         SizedBox(height: 20,),
        //         Text(
        //           "To ZdaKra",textAlign: TextAlign.center,
        //           style: TextStyle(
        //             color: Colors.grey[700],
        //             fontSize: 18,
        //           ),
        //         )
        //       ],
        //     ),
        //     Container(
        //       width: double.infinity,
        //       height: MediaQuery.of(context).size.height/3,
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage("assets/welcome.png")
        //         )
        //       ),
        //     ),
        //     Column(
        //       children: <Widget>[
        //         //Login Button
        //         MaterialButton(
        //           minWidth: double.infinity,
        //           height: 60,
        //           onPressed: () {
        //             print("Student");
        //             Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        //           },
        //           shape: StadiumBorder(
        //             side: BorderSide(color: Colors.black)
        //           ),
        //           color: Colors.white,
        //           child: Text(
        //             "Student",
        //             style: TextStyle(
        //               fontWeight: FontWeight.w600,
        //               fontSize: 18
        //             ),
        //           ),
        //         ),
        //         SizedBox(height: 20,),
        //         MaterialButton(
        //           minWidth: double.infinity,
        //           height: 60,
        //           onPressed: (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
        //           },
        //           shape: StadiumBorder(),
        //           color: Colors.blue,
        //           child: Text(
        //             "Parent",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.w600,
        //                 fontSize: 18
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ],
        // ),
        // ),
      ),
    );
  }
}
