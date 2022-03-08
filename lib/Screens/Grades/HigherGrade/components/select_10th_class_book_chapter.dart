import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Grades/HigherGrade/Books/BookChapters/chapter.dart';
import 'package:flutter_auth/Screens/Grades/HigherGrade/components/components/chapter_selection_button.dart';
import 'package:flutter_auth/constants.dart';

class SelectBookChapter10 extends StatelessWidget {
  const SelectBookChapter10({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
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
                        child: Text("Select your Chapter to proceed",style: TextStyle(fontSize: 20,color: newkPrimaryColor),),
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
                SizedBox(height: 10,),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 5,
                              width: 70,
                              color: Colors.black,
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ChapterSectionButton(
                              presss: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return chapter();
                                      },
                                  ),
                                );
                                },
                              text: "Chapter 1",
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ChapterSectionButton(
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
                              text: "Chapter 2",
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 5,
                              width: 70,
                              color: Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 5,
                              width: 70,
                              color: Colors.black,
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ChapterSectionButton(
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
                              text: "Chapter 3",
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
   // Old Code
                // Container(
                //   height: 800,
                //   //width: 400,
                //   color: Colors.grey,
                //   child: Stack(
                //     children: <Widget>[
                //       Positioned(
                //         top: 10,
                //           left: 162,
                //           child: Center(
                //             child: Column(
                //               children: <Widget>[
                //                 Text("Islamic Book",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                //                 Container(
                //                 height: 28,
                //                 width: 28,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(50),
                //                   color: newkPrimaryColor,
                //                 ),
                //               ),
                //               ]
                //             ),
                //           )
                //       ),
                //
                //       //Main line |
                //       Center(
                //         child: Positioned(
                //             top: 50,
                //             left: 200,
                //             child: Container(
                //               height: 650,
                //               width: 5,
                //               color: Colors.black,
                //             )
                //         ),
                //       ),
                //
                //       //Right Line |----
                //       Positioned.fill(
                //         top: 100,
                //         left: 200,
                //         right:50,
                //         bottom: 700,
                //         child: Container(
                //           height: 5,
                //           width: 100,
                //           color: Colors.black,
                //         ),
                //       ),
                //
                //       //Left Line ----|
                //       Positioned(
                //           top: 200,
                //           right: 195,
                //           child: Container(
                //             height: 5,
                //             width: 105,
                //             color: Colors.black,
                //           )
                //       ),
                //       Positioned(
                //           top: 300,
                //           left: 200,
                //           child: Container(
                //             height: 5,
                //             width: 100,
                //             color: Colors.black,
                //           )
                //       ),
                //       Positioned(
                //           top: 400,
                //           right: 195,
                //           child: Container(
                //             height: 5,
                //             width: 105,
                //             color: Colors.black,
                //           )
                //       ),
                //       Positioned(
                //           top: 500,
                //           left: 200,
                //           child: Container(
                //             height: 5,
                //             width: 100,
                //             color: Colors.black,
                //           )
                //       ),
                //       Positioned(
                //         top: 600,
                //           right: 195,
                //           child: Container(
                //             height: 5,
                //             width: 105,
                //             color: Colors.black,
                //           ),
                //       ),
                //       Positioned(
                //           top: 700,
                //           left: 200,
                //           child: Container(
                //             height: 5,
                //             width: 100,
                //             color: Colors.black,
                //           )
                //       ),
                //
                //       //Chapter Buttons
                //       Positioned(
                //         top: 60,
                //           right: 21,
                //           child: ChapterSectionButton(
                //             presss: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) {
                //                     return SelectBookChapter10();
                //                   },
                //                 ),
                //               );
                //             },
                //             text: "Chapter 1",
                //           )
                //       ),
                //       Positioned(
                //           top: 160,
                //           left: 21,
                //           child: ChapterSectionButton(
                //             presss: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) {
                //                     return SelectBookChapter10();
                //                   },
                //                 ),
                //               );
                //             },
                //             text: "Chapter 2",
                //           )
                //       ),
                //       Positioned(
                //           top: 260,
                //           right: 21,
                //           child: ChapterSectionButton(
                //             presss: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) {
                //                     return SelectBookChapter10();
                //                   },
                //                 ),
                //               );
                //             },
                //             text: "Chapter 3",
                //           )
                //       ),
                //       Positioned(
                //           top: 360,
                //           left: 21,
                //           child: ChapterSectionButton(
                //             presss: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) {
                //                     return SelectBookChapter10();
                //                   },
                //                 ),
                //               );
                //             },
                //             text: "Chapter 4",
                //           )
                //       ),
                //       Positioned(
                //           top: 460,
                //           right: 21,
                //           child: ChapterSectionButton(
                //             presss: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) {
                //                     return SelectBookChapter10();
                //                   },
                //                 ),
                //               );
                //             },
                //             text: "Chapter 5",
                //           )
                //       ),
                //       Positioned(
                //           top: 560,
                //           left: 21,
                //           child: ChapterSectionButton(
                //             presss: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) {
                //                     return SelectBookChapter10();
                //                   },
                //                 ),
                //               );
                //             },
                //             text: "Chapter 6",
                //           )
                //       ),
                //       Positioned(
                //           top: 660,
                //           right: 21,
                //           child: ChapterSectionButton(
                //             presss: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) {
                //                     return SelectBookChapter10();
                //                   },
                //                 ),
                //               );
                //             },
                //             text: "Chapter 7",
                //           )
                //       ),
                //     ],
                //   ),
                // ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
