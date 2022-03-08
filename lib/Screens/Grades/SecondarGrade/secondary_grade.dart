import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Grades/Components/select_class_buttons.dart';
import 'package:flutter_auth/Screens/MainPage/components/mainDrawer.dart';
import 'package:flutter_auth/constants.dart';


class SecondaryGrade extends StatelessWidget {
  const SecondaryGrade({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //SizedBox(height: size.height * 0.03,),
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50)
                    ),
                    color: newkPrimaryColor,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 50,
                          left: 0,
                          child: Container(
                            height: 60,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                )
                            ),
                          )
                      ),
                      Positioned(
                        top: 65,
                        left: 15,
                        child: Text("Select Class From Secondary Grade",style: TextStyle(fontSize: 20,color: newkPrimaryColor),),
                      ),
                      Positioned(
                          top: 10,
                          left: 0,
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                          )
                      )
                    ],
                  ),
                ),
            //     SizedBox(height: size.height * 0.03,),
            //     Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         IconButton(
            //           onPressed: (){
            //             Navigator.pop(context);
            //           } ,
            //         icon: Icon(Icons.arrow_back),
            //     ),
            //       Text(
            //         "Select Book From Secondary Grade",
            //         style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            //       ),
            //       IconButton(
            //           onPressed: (){},
            //           icon: Icon(Icons.search),
            //       ),
            //   ],
            // ),
            // // Draw a line here
            // Divider(
            //   indent: 20,
            //   endIndent: 20,
            //   color: Colors.lightBlue,
            // ),
            SelectClassButton(
              textt: "Seventh Class (7)",
              presss: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return null;//SelectGrade();
                    },
                  ),
                );
              },
            ),
            SelectClassButton(
              textt: "Class Eight (8)",
              presss: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return null;//SelectGrade();
                    },
                  ),
                );
              },
            ),
            SelectClassButton(
              textt: "Class Nine (9)",
              presss: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return null;//SelectGrade();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    )
    );
  }
}