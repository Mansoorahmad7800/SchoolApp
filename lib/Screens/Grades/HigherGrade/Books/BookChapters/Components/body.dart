import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Grades/HigherGrade/Books/BookChapters/Components/TopicsButton.dart';
import 'package:flutter_auth/Screens/Grades/HigherGrade/Books/BookChapters/Topics/Topic.dart';
import 'package:flutter_auth/constants.dart';

class body extends StatelessWidget {
  const body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        child: Text("Topic Selection",style: TextStyle(fontSize: 20,color: newkPrimaryColor),),
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
                SizedBox(height: 20,),
                TopicButton(
                  textt: "First Topic",
                  texttt: "Video Link",
                  colorr: Colors.orangeAccent,
                  presss: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TopicToRead();
                        },
                      ),
                    );
                  },
                  press: (){},
                ),
                TopicButton(
                  textt: "Second Topic",
                  texttt: "Video Link",
                  colorr: Colors.green,
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
                  press: (){},
                ),
                TopicButton(
                  textt: "Third Topic",
                  texttt: "Video Link",
                  colorr: Colors.lightBlue,
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
                  press: (){},
                ),
                TopicButton(
                  textt: "Fourth Topic",
                  texttt: "Video Link",
                  colorr: Colors.pinkAccent,
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
                  press: (){},
                ),
                TopicButton(
                  textt: "Fifth Topic",
                  texttt: "Video Link",
                  colorr: Colors.cyan,
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
                  press: (){},
                ),
                TopicButton(
                  textt: "Sixth Topic",
                  texttt: "Video Link",
                  colorr: Colors.deepOrange,
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
                  press: (){},
                ),
                TopicButton(
                  textt: "Seventh Topic",
                  texttt: "Video Link",
                  colorr: Colors.indigo,
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
                  press: (){},
                ),
              ],
            ),
          ),
        )
    );
  }
}
