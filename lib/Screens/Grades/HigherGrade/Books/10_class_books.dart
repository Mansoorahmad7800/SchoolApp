import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Grades/HigherGrade/components/select_10th_class_book_chapter.dart';
import 'package:flutter_auth/Screens/Grades/PrimaryGrade/Books/select_book_chapter.dart';
import 'package:flutter_auth/Screens/Grades/PrimaryGrade/compnents/book_selection_button.dart';
import 'package:flutter_auth/constants.dart';

class SelectBook10 extends StatelessWidget {
  const SelectBook10({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: Text("Select Book From Tenth Class",style: TextStyle(fontSize: 20,color: newkPrimaryColor),),
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
              SizedBox(height: size.height*0.03),
              Padding(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    BookSelectionButton(
                      presss: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SelectBookChapter10();
                            },
                          ),
                        );
                      },
                    ),

                    BookSelectionButton(
                      presss: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SelectBookChapter10();
                            },
                          ),
                        );
                      },
                    ),

                    BookSelectionButton(
                      presss: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SelectBookChapter10();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Islamic"),
                  Text("Computer"),
                  Text("Maths"),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    BookSelectionButton(
                      presss: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SelectBookChapter();
                            },
                          ),
                        );
                      },
                    ),
                    BookSelectionButton(
                      presss: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SelectBookChapter();
                            },
                          ),
                        );
                      },
                    ),
                    BookSelectionButton(
                      presss: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SelectBookChapter();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("English"),
                  Text("Pashto"),
                  Text("Dari")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


