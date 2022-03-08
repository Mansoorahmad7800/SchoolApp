import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Grades/Components/select_class_buttons.dart';
import 'package:flutter_auth/Screens/Grades/HigherGrade/Books/10_class_books.dart';
import 'package:flutter_auth/Screens/Grades/HigherGrade/Books/11_class_books.dart';
import 'package:flutter_auth/Screens/MainPage/components/mainDrawer.dart';
import 'package:flutter_auth/constants.dart';


class HigherGrade extends StatelessWidget {
  const HigherGrade({
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
                        width: 330,
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
                    child: Text("Select Class From Higher Grade",style: TextStyle(fontSize: 20,color: newkPrimaryColor),),
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
            // SizedBox(height: size.height * 0.03,),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     IconButton(
            //       onPressed: (){
            //         Navigator.pop(context);
            //       } ,
            //       icon: Icon(Icons.arrow_back),
            //     ),
            //     Text(
            //       "Select Book From Higher Grade",
            //       style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            //     ),
            //     IconButton(
            //         onPressed: (){},
            //         icon: Icon(Icons.home),
            //     )
            //   ],
            // ),
            // // Draw a line here
            // Divider(
            //   indent: 20,
            //   endIndent: 20,
            //   color: Colors.lightBlue,
            // ),
            SelectClassButton(
              textt: "Class Ten (10)",
              presss: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectBook10();//SelectGrade();
                    },
                  ),
                );
              },
            ),
            SelectClassButton(
              textt: "Class Eleven (11)",
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
              textt: "Class Twelve (12)",
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