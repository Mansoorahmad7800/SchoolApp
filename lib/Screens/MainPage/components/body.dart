import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Grades/Components/grade_buttons.dart';
import 'package:flutter_auth/Screens/Grades/HigherGrade/higher_grade.dart';
import 'package:flutter_auth/Screens/Grades/PrimaryGrade/primary_grade.dart';
import 'package:flutter_auth/Screens/Grades/SecondarGrade/secondary_grade.dart';
import 'package:flutter_auth/Screens/MainPage/components/Carousel_Picture.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';

class body extends StatelessWidget {
  const body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //newly added
    final double height= MediaQuery.of(context).size.height;
    final double width= MediaQuery.of(context).size.width;
    //
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            //the grade buttons starts from here
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.03,),
                    //newly added
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50)
                        ),
                        //color: newkPrimaryColor,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 80,
                              left: 0,
                              child: Column(
                                    children: <Widget>[
                                      Text("Welcome"),
                                      Text("Mansoor Ahmad"),
                                      Text("Email@something.com"),
                                    ],
                                  ),
                              ),
                          Positioned(
                            top: 0,
                              right: 10,
                            bottom: 0,
                            child: Image.asset("assets/images/userLogedin.png"),
                            // child: SvgPicture.asset(
                            //   "assets/icons/signup.svg",
                            //   height: size.height * 0.45,
                            // ),
                              // child: Container(
                              //   //height: 200,
                              //
                              //   decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //       image: AssetImage("assets/icons/logedin.jpg"),
                              //       fit: BoxFit.cover,
                              //     )
                              //   ),
                              //   //child: Image.asset("assets/icons/signup.svg"),
                              // ),
                          ),
                          // Positioned(
                          //     top: 60,
                          //     left: 0,
                          //     child: Container(
                          //       height: 60,
                          //       width: 300,
                          //       decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.only(
                          //           topRight: Radius.circular(50),
                          //           bottomRight: Radius.circular(50),
                          //         )
                          //       ),
                          //     )
                          // ),

                          // Positioned(
                          //   top: 65,
                          //     left: 30,
                          //     child: Text("Select Grade",style: TextStyle(fontSize: 30,color: newkPrimaryColor),),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: height*0.05,),

                    Carsou(),
                    Positioned(
                        child: Align(
                            child: Text("Select Your Grade",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          alignment: Alignment(-1,0),
                        )
                    ),
                    SizedBox(height: height* 0.02,),
                    GradeButtons(
                      textt: "Pirmary Grades",
                      texttt: "Primary Grades from class 1 to class 6",
                      child: Image.asset("assets/images/children reading book.png"),
                      colorr: Colors.blue,
                      presss: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PrimaryGrade();
                            },
                          ),
                        );
                      },
                    ),
                    GradeButtons(
                      textt: "Secondary Grades",
                      texttt: "Secodary Grades from class 7 to class 9",
                      child: Image.asset("assets/images/secondary2.jpg", fit: BoxFit.cover,),
                      colorr: Colors.redAccent,
                      presss: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SecondaryGrade();
                            },
                          ),
                        );
                      },
                    ),
                    GradeButtons(
                      textt: "Higher Grades",
                      texttt: "Higher Grades from class 10 to class 12",
                      //child: Image.asset("assets/images/highGrad.jpg",fit: BoxFit.cover,),
                      colorr: Colors.orangeAccent,
                      presss: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HigherGrade();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}