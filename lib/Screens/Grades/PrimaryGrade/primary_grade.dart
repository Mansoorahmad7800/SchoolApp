import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Grades/Components/select_class_buttons.dart';
import 'package:flutter_auth/Screens/Grades/PrimaryGrade/Books/1_class_books.dart';
import 'package:flutter_auth/Screens/Grades/PrimaryGrade/Books/select_book_chapter.dart';
import 'package:flutter_auth/Screens/MainPage/components/mainDrawer.dart';
import 'package:flutter_auth/constants.dart';


class PrimaryGrade extends StatelessWidget {
  const PrimaryGrade({
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
                    child: Text("Select Class From Primary Grade",style: TextStyle(fontSize: 20,color: newkPrimaryColor),),
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
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     // IconButton(
            //     //     onPressed: (){
            //     //       Navigator.pop(context);
            //     //     } ,
            //     //     icon: Icon(Icons.arrow_back),
            //     // ),
            //     // Text(
            //     //   "Select Book From Primary Grade",
            //     //   style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
            //     // ),
            //     // IconButton(
            //     //     onPressed: (){},
            //     //     icon: Icon(Icons.home)
            //     // ),
            //
            //   ],
            // ),
            // Draw a line here
            // Divider(
            //   color: Colors.lightBlue,
            //   indent: 20,
            //   endIndent: 20,
            // ),
            SizedBox(height: size.height * 0.03),
            SelectClassButton(
              textt: "First Class (1)",
              colorr: Colors.greenAccent,
              presss: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectBook();
                    },
                  ),
                );
              },
            ),
            SelectClassButton(
              textt: "Second Class (2)",
              colorr: Colors.lightBlue,
              presss: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectBook();
                    },
                  ),
                );
              },
            ),
            SelectClassButton(
              textt: "Third Class (3)",
              colorr: Colors.amberAccent,
              presss: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectBook();
                    },
                  ),
                );
              },
            ),
            SelectClassButton(
              textt: "Fourth Class (4)",
              colorr: Colors.pinkAccent,
              presss: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectBook();
                    },
                  ),
                );
              },
            ),
            SelectClassButton(
              textt: "Fifth Class (5)",
              colorr: Colors.yellowAccent,
              presss: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectBook();
                    },
                  ),
                );
              },
            ),
            SelectClassButton(
              textt: "Sixth Class (6)",
              colorr: Colors.redAccent,
              presss: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectBook();
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