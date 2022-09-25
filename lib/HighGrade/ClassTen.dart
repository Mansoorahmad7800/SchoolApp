import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mansoor/ClassTenPF/PDFApi.dart';
import 'package:mansoor/ClassTenPF/PdfViewer.dart';
import 'package:mansoor/Parents/process_page.dart';
import 'package:mansoor/Quiz/question_controller.dart';
import 'package:mansoor/Quiz/quiz_main.dart';
// import 'package:mansoor/VideoLink/VideoLnik.dart';
import 'package:mansoor/VideoLink/newVideo.dart';
import 'package:mansoor/quiz2/main.dart';
import 'package:mansoor/quiz2/Model/Question.dart';
import 'package:mansoor/quiz2/Quiz/quiz_screen.dart';

class ClassTen extends StatefulWidget {
  ClassTen(this.colorval);

  int colorval;

  State<ClassTen> createState() => _ClassTenState();
}

class _ClassTenState extends State<ClassTen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 6);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      widget.colorval = 0xDD000000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 10,
          backgroundColor: Color(0xFF4D80E4),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorColor: const Color(0xDD000000),
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  FontAwesomeIcons.book,
                  size: 22,
                  color: _tabController?.index == 0
                      ? Color(widget.colorval)
                      : Colors.white,
                ),
                child: Text(
                  'Physics\n فزیک',
                  style: TextStyle(
                      color: _tabController?.index == 0
                          ? Color(widget.colorval)
                          : Colors.white),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.book,
                    size: 22,
                    color: _tabController?.index == 1
                        ? Color(widget.colorval)
                        : Colors.white),
                child: Text(
                  'Chemistry\n کیمیا',
                  style: TextStyle(
                      color: _tabController?.index == 1
                          ? Color(widget.colorval)
                          : Colors.white),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.book,
                    size: 22,
                    color: _tabController?.index == 2
                        ? Color(widget.colorval)
                        : Colors.white),
                child: Text(
                  'Maths\n ریاضی',
                  style: TextStyle(
                      color: _tabController?.index == 2
                          ? Color(widget.colorval)
                          : Colors.white),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.book,
                    color: _tabController?.index == 3
                        ? Color(widget.colorval)
                        : Colors.white),
                child: Text(
                  'Biology',
                  style: TextStyle(
                      color: _tabController?.index == 3
                          ? Color(widget.colorval)
                          : Colors.white),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.book,
                    color: _tabController?.index == 4
                        ? Color(widget.colorval)
                        : Colors.white),
                child: Text(
                  'English',
                  style: TextStyle(
                      color: _tabController?.index == 4
                          ? Color(widget.colorval)
                          : Colors.white),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.book,
                    color: _tabController?.index == 5
                        ? Color(widget.colorval)
                        : Colors.white),
                child: Text(
                  'Pashto',
                  style: TextStyle(
                      color: _tabController?.index == 5
                          ? Color(widget.colorval)
                          : Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            PhysicsTabs(),
            ChemistryTabs(),
            MathsTabs(),
            BiologyTabs(),
            EnglishTabs(),
            PashtoTabs(),
            // HomeTopChartsTabs(),
          ],
        ),
      ),
    );
  }
}

//Class 10 Maths Book
class MathsTabs extends StatefulWidget {
  final Widget? child;

  const MathsTabs({Key? key, this.child}) : super(key: key);

  @override
  State<MathsTabs> createState() => _MathsTabsState();
}

class _MathsTabsState extends State<MathsTabs> {
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageContainer(),
    );
  }

  Widget ImageContainer() {
    return Container(
        //Newly Added Horizontal scrolled animation
        child: Center(
      child: Container(
        height: 300,
        padding: const EdgeInsets.symmetric(vertical: 16),
        // color: Colors.blue,
        child: NotificationListener<ScrollNotification>(
          onNotification: _scrollNotification,
          child: ListView(
              controller: listScrollController,
              scrollDirection: Axis.horizontal,
              children: [
                // ChapterButton(
                //   color: Colors.brown,
                //   textChapter: "CHAPTER",
                //   textTopic1: 'Speacking',
                //   textTopic2: 'Writing',
                //   textTopic3: 'Reading',
                //   textTopic4: 'Listening',
                //   videoPress: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => Physics_Chp1_Video(),
                //       ),
                //     );
                //   },
                //   pdfPress: () async {
                //     const path = 'assets/PDF/10-pashto.pdf';
                //     final file = await pdfApi.loadAsset(path);
                //     openPdf(context, file);
                //   },
                //   quizPress: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) =>
                //             // const NewQuizScreen()
                //             const QuizScreen(),
                //       ),
                //     );
                //   },
                // ),
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Colors.black87,
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              height: MediaQuery.of(context).size.height - 300,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black87,
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              // color: Colors.teal,
                              child: Material(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: MaterialButton(
                                            minWidth: 5,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ))),
                                    Positioned(
                                      top: 30,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: const BoxDecoration(
                                          // color: Colors.blue,
                                          image: DecorationImage(
                                              image: AssetImage(
                                            "assets/human1.png",
                                          )),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            onPressed: () {
                                              // Navigator.of(context).push(
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             VideoLink1()));
                                            },
                                            icon: const Icon(
                                              Icons.play_circle_fill,
                                              size: 120,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        left: 27,
                                        child: Text(
                                          "Chapter 1",
                                          style: GoogleFonts.abel(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                    Positioned(
                                      top: 175,
                                      left: 20,
                                      child: Container(
                                        // width: MediaQuery.of(context).size.width * .5,
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Text(
                                              "We will learn these Topics ",
                                              style: GoogleFonts.acme(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              "Maths Topic one",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic two",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic three",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic four",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontStyle: null),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RaisedButton(
                                            onPressed: () async {
                                              final path =
                                                  'assets/PDF/10-pashto.pdf';
                                              final file =
                                                  await pdfApi.loadAsset(path);
                                              openPdf(context, file);
                                            },
                                            child: const Text(
                                              "PDF File",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              QuestionController.ChapterIndex =
                                                  1;
                                              // Navigator.pushAndRemoveUntil(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             const QuizScreen()),
                                              //     (Route<dynamic> route) =>
                                              //         true);

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          // const NewQuizScreen()
                                                          const QuizScreen()));
                                            },
                                            child: const Text(
                                              "Take Quiz",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    transform: Matrix4.rotationZ(
                        scrollDirection == ScrollDirection.forward
                            ? 0.07
                            : scrollDirection == ScrollDirection.reverse
                                ? -0.07
                                : 0),
                    width: 200,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.lime,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.6),
                            offset: const Offset(-6, 4),
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/human1.png",
                          height: 120,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        const Text(
                          "Chapter 1",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          backgroundColor: Colors.indigo,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Chapter 2'),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.close),
                              )
                            ],
                          ),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                    "assets/human1.png",
                                  )),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             YoutubeApp()));
                                  },
                                  icon: Icon(
                                    Icons.play_circle_fill,
                                    size: 100,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Container(
                                height: 200,
                                width: 200,
                                // color: Colors.purpleAccent,
                                child: Column(
                                  children: <Widget>[
                                    Text('Chemistry First Topic'),
                                    Text('Second Topic'),
                                    Text('Third Topic'),
                                    Text('Fourth Topic'),
                                    Text('Fifth Topic'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                children: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Take Quize')),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {}, child: Text('PDF File'))
                                ],
                              ),
                            ),
                            // TextButton(
                            //   child: Text('buttonText'),
                            //   onPressed: () {
                            //     Navigator.of(dialogContext)
                            //         .pop(); // Dismiss alert dialog
                            //   },
                            // ),
                          ],
                        );
                      },
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    transform: Matrix4.rotationZ(
                        scrollDirection == ScrollDirection.forward
                            ? 0.07
                            : scrollDirection == ScrollDirection.reverse
                                ? -0.07
                                : 0),
                    width: 200,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.6),
                            offset: const Offset(-6, 4),
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/human1.png",
                          height: 120,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        const Text(
                          "Chapter 2",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Colors.black87,
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              height: MediaQuery.of(context).size.height - 300,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black87,
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              // color: Colors.teal,
                              child: Material(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: MaterialButton(
                                            minWidth: 5,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ))),
                                    Positioned(
                                      top: 30,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          // color: Colors.blue,
                                          image: DecorationImage(
                                              image: AssetImage(
                                            "assets/human1.png",
                                          )),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            // Navigator.of(context).push(
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             VideoLink()));
                                          },
                                          icon: Icon(
                                            Icons.play_circle_fill,
                                            size: 120,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        left: 27,
                                        child: Text(
                                          "Chapter 3",
                                          style: GoogleFonts.abel(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                    Positioned(
                                      top: 175,
                                      left: 20,
                                      child: Container(
                                        // width: MediaQuery.of(context).size.width * .5,
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Text(
                                              "We will learn these Topics ",
                                              style: GoogleFonts.acme(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              "Topic one",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic two",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic three",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic four",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontStyle: null),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RaisedButton(
                                            onPressed: () async {
                                              final path =
                                                  'assets/PDF/10-pashto.pdf';
                                              final file =
                                                  await pdfApi.loadAsset(path);
                                              openPdf(context, file);
                                            },
                                            child: const Text(
                                              "PDF File",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              setState(() {
                                                QuestionController
                                                    .ChapterIndex = 4;
                                              });
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const QuizScreen()));
                                            },
                                            child: const Text(
                                              "Take Quiz",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    transform: Matrix4.rotationZ(
                        scrollDirection == ScrollDirection.forward
                            ? 0.07
                            : scrollDirection == ScrollDirection.reverse
                                ? -0.07
                                : 0),
                    width: 200,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.redAccent.withOpacity(0.6),
                            offset: const Offset(-6, 4),
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/human1.png",
                          height: 120,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        const Text(
                          "Chapter 3",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Colors.black87,
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              height: MediaQuery.of(context).size.height - 300,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black87,
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              // color: Colors.teal,
                              child: Material(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: MaterialButton(
                                            minWidth: 5,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ))),
                                    Positioned(
                                      top: 30,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          // color: Colors.blue,
                                          image: DecorationImage(
                                              image: AssetImage(
                                            "assets/human1.png",
                                          )),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            // Navigator.of(context).push(
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             VideoLink()));
                                          },
                                          icon: Icon(
                                            Icons.play_circle_fill,
                                            size: 120,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        left: 27,
                                        child: Text(
                                          "Chapter 4",
                                          style: GoogleFonts.abel(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                    Positioned(
                                      top: 175,
                                      left: 20,
                                      child: Container(
                                        // width: MediaQuery.of(context).size.width * .5,
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Text(
                                              "We will learn these Topics ",
                                              style: GoogleFonts.acme(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              "Topic one",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic two",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic three",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic four",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontStyle: null),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RaisedButton(
                                            onPressed: () async {
                                              final path =
                                                  'assets/PDF/10-pashto.pdf';
                                              final file =
                                                  await pdfApi.loadAsset(path);
                                              openPdf(context, file);
                                            },
                                            child: const Text(
                                              "PDF File",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              setState(() {
                                                QuestionController
                                                    .ChapterIndex = 3;
                                              });
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const QuizScreen()));
                                            },
                                            child: const Text(
                                              "Take Quiz",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    transform: Matrix4.rotationZ(
                        scrollDirection == ScrollDirection.forward
                            ? 0.07
                            : scrollDirection == ScrollDirection.reverse
                                ? -0.07
                                : 0),
                    width: 200,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigoAccent.withOpacity(0.6),
                            offset: const Offset(-6, 4),
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/human1.png",
                          height: 120,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        const Text(
                          "Chapter 4",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Colors.black87,
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              height: MediaQuery.of(context).size.height - 300,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black87,
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              // color: Colors.teal,
                              child: Material(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: MaterialButton(
                                            minWidth: 5,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ))),
                                    Positioned(
                                      top: 30,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          // color: Colors.blue,
                                          image: DecorationImage(
                                              image: AssetImage(
                                            "assets/human1.png",
                                          )),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            // Navigator.of(context).push(
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             VideoLink()));
                                          },
                                          icon: Icon(
                                            Icons.play_circle_fill,
                                            size: 120,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        left: 27,
                                        child: Text(
                                          "Chapter 5",
                                          style: GoogleFonts.abel(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                    Positioned(
                                      top: 175,
                                      left: 20,
                                      child: Container(
                                        // width: MediaQuery.of(context).size.width * .5,
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Text(
                                              "We will learn these Topics ",
                                              style: GoogleFonts.acme(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              "Topic one",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic two",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic three",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic four",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontStyle: null),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RaisedButton(
                                            onPressed: () async {
                                              final path =
                                                  'assets/PDF/10-pashto.pdf';
                                              final file =
                                                  await pdfApi.loadAsset(path);
                                              openPdf(context, file);
                                            },
                                            child: const Text(
                                              "PDF File",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const QuizScreen()));
                                            },
                                            child: const Text(
                                              "Take Quiz",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    transform: Matrix4.rotationZ(
                        scrollDirection == ScrollDirection.forward
                            ? 0.07
                            : scrollDirection == ScrollDirection.reverse
                                ? -0.07
                                : 0),
                    width: 200,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.6),
                            offset: const Offset(-6, 4),
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/human1.png",
                          height: 120,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        const Text(
                          "Chapter 5",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Colors.black87,
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              height: MediaQuery.of(context).size.height - 300,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black87,
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              // color: Colors.teal,
                              child: Material(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: MaterialButton(
                                            minWidth: 5,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ))),
                                    Positioned(
                                      top: 30,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          // color: Colors.blue,
                                          image: DecorationImage(
                                              image: AssetImage(
                                            "assets/human1.png",
                                          )),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            // Navigator.of(context).push(
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             VideoLink()));
                                          },
                                          icon: Icon(
                                            Icons.play_circle_fill,
                                            size: 120,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        left: 27,
                                        child: Text(
                                          "Chapter 6",
                                          style: GoogleFonts.abel(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                    Positioned(
                                      top: 175,
                                      left: 20,
                                      child: Container(
                                        // width: MediaQuery.of(context).size.width * .5,
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Text(
                                              "We will learn these Topics ",
                                              style: GoogleFonts.acme(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              "Topic one",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic two",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic three",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "Topic four",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontStyle: null),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RaisedButton(
                                            onPressed: () async {
                                              final path =
                                                  'assets/PDF/10-pashto.pdf';
                                              final file =
                                                  await pdfApi.loadAsset(path);
                                              openPdf(context, file);
                                            },
                                            child: const Text(
                                              "PDF File",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const QuizScreen()));
                                            },
                                            child: const Text(
                                              "Take Quiz",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    transform: Matrix4.rotationZ(
                        scrollDirection == ScrollDirection.forward
                            ? 0.07
                            : scrollDirection == ScrollDirection.reverse
                                ? -0.07
                                : 0),
                    width: 200,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.6),
                            offset: const Offset(-6, 4),
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/human1.png",
                          height: 120,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        const Text(
                          "Chapter 6",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    ));
  }

  void openPdf(BuildContext context, File file) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
  }
}

//Class 10 Physics Book
class PhysicsTabs extends StatefulWidget {
  final Widget? child;

  const PhysicsTabs({Key? key, this.child}) : super(key: key);

  @override
  State<PhysicsTabs> createState() => _PhysicsTabsState();
}

class _PhysicsTabsState extends State<PhysicsTabs> {
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageContainer(),
    );
  }

  Widget ImageContainer() {
    return Container(
      //Newly Added Horizontal scrolled animation
      child: Center(
        child: Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 16),
          // color: Colors.blue,
          child: NotificationListener<ScrollNotification>(
            onNotification: _scrollNotification,
            child: ListView(
              controller: listScrollController,
              scrollDirection: Axis.horizontal,
              children: [
                ChapterButt(
                  Colors.black38,
                  "لومړی څپرکی",
                  "Chapter 1",
                  "فزیک څه شی دی؟",
                  "په فزیک باندې مقدمه",
                  "د فزیک لنډ تاریخ",
                  "",
                  () => {
                    Navigator.of(context).pop(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Physics_Chp1_Video(),
                      ),
                    ),
                  },
                  () async {
                    Navigator.of(context).pop();
                    const path = 'assets/PDF/10_physics_chapter_1.pdf';
                    final file = await pdfApi.loadAsset(path);
                    openPdf(context, file);
                  },
                  () => {
                    QuestionController.ChapterIndex = 2,
                    Navigator.of(context).pop(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            // const NewQuizScreen()
                            NewQuizScreen(
                          quizQuestions: quizQuestions,
                        ),
                      ),
                    ),
                    if (ProcessPage.PhysicsQuizesTaken <= 10)
                      {ProcessPage.PhysicsQuizesTaken++}
                  },
                ),
                ChapterButt(
                  Colors.red,
                  "دوهم څپرکی",
                  "Chapter 2",
                  "اندازه کول، اندازه کول څه شی ته وائې؟",
                  "واحدونو سیستم (SI) د",
                  "په اندازه کولو کی تیروتنه",
                  "د بعدونو تحلیل او تجزیه",
                  () => {
                    Navigator.of(context).pop(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Physics_Chp2_Video(),
                      ),
                    ),
                  },
                  () async {
                    Navigator.of(context).pop();
                    const path = 'assets/PDF/10_physics_chapter_2.pdf';
                    final file = await pdfApi.loadAsset(path);
                    openPdf(context, file);
                  },
                  () => {
                    // QuestionController.ChapterIndex = 1,

                    Navigator.of(context).pop(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewQuizScreen(
                          quizQuestions: quizQuestions,
                        ),
                      ),
                    ),
                    if (ProcessPage.PhysicsQuizesTaken <= 10)
                      {ProcessPage.PhysicsQuizesTaken++}
                  },
                ),
                ChapterButt(
                  Colors.green,
                  "دریم څپرکی",
                  "Chapter 3",
                  "نور او د هغه خواص \n د نورخپریدل او نورې بنډلونه",
                  "د نور سرعت او انعکاس \n مستوي هندارې او کروی هندارې ",
                  "په کروی هندارو کې تصویر \n د هندارو معادلې",
                  " تطبیقات ",
                  () => {
                    Navigator.of(context).pop(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Physics_Chp1_Video(),
                      ),
                    ),
                  },
                  () async {
                    Navigator.of(context).pop();
                    const path = 'assets/PDF/10_physics_chapter_3.pdf';
                    final file = await pdfApi.loadAsset(path);
                    openPdf(context, file);
                  },
                  () => {
                    Navigator.of(context).pop(),
                    // QuestionController.ChapterIndex = 3,
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewQuizScreen(
                          quizQuestions: quizQuestions,
                        ),
                      ),
                    ),
                    if (ProcessPage.PhysicsQuizesTaken >= 10)
                      {ProcessPage.PhysicsQuizesTaken++}
                  },
                ),
                // ChapterButt(
                //   Colors.teal,
                //   "څلورم څپرکی",
                //   "Chapter 1",
                //   "Speaking",
                //   "Writing",
                //   "Listening",
                //   "Reading",
                //   () => {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => Physics_Chp1_Video(),
                //       ),
                //     ),
                //   },
                //   () async {
                //     const path = 'assets/PDF/10-pashto.pdf';
                //     final file = await pdfApi.loadAsset(path);
                //     openPdf(context, file);
                //   },
                //   () => {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const QuizScreen(),
                //       ),
                //     ),
                //   },
                // ),

                // GestureDetector(
                //   onTap: () {
                //     showGeneralDialog(
                //         context: context,
                //         barrierDismissible: true,
                //         barrierLabel: MaterialLocalizations.of(context)
                //             .modalBarrierDismissLabel,
                //         barrierColor: Colors.black87,
                //         transitionDuration: const Duration(milliseconds: 200),
                //         pageBuilder: (BuildContext buildContext,
                //             Animation animation,
                //             Animation secondaryAnimation) {
                //           return Center(
                //             child: Container(
                //               width: MediaQuery.of(context).size.width - 100,
                //               height:
                //                   MediaQuery.of(context).size.height - 300,
                //               padding: const EdgeInsets.all(10),
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
                //                   boxShadow: [
                //                     const BoxShadow(
                //                       color: Colors.black87,
                //                       spreadRadius: 5,
                //                       blurRadius: 7,
                //                       offset: Offset(0, 3),
                //                     )
                //                   ]),
                //               // color: Colors.teal,
                //               child: Material(
                //                 color: Colors.black87,
                //                 borderRadius: BorderRadius.circular(20),
                //                 child: Stack(
                //                   children: [
                //                     Positioned(
                //                         top: 0,
                //                         right: 0,
                //                         child: MaterialButton(
                //                             minWidth: 5,
                //                             onPressed: () {
                //                               Navigator.pop(context);
                //                             },
                //                             child: const Icon(
                //                               Icons.close,
                //                               color: Colors.white,
                //                             ))),
                //                     Positioned(
                //                       top: 30,
                //                       left: 0,
                //                       right: 0,
                //                       child: Container(
                //                         height: 150,
                //                         width: 150,
                //                         decoration: BoxDecoration(
                //                           // color: Colors.blue,
                //                           image: DecorationImage(
                //                               image: AssetImage(
                //                             "assets/human1.png",
                //                           )),
                //                         ),
                //                         child: IconButton(
                //                           onPressed: () {
                //                             Navigator.of(context).push(
                //                                 MaterialPageRoute(
                //                                     builder: (context) =>
                //                                         Physics_Chp1_Video()));
                //                           },
                //                           icon: Icon(
                //                             Icons.play_circle_fill,
                //                             size: 120,
                //                             color: Colors.red,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     Positioned(
                //                         top: 10,
                //                         left: 27,
                //                         child: Text(
                //                           "Chapter 1",
                //                           style: GoogleFonts.abel(
                //                               color: Colors.white,
                //                               fontSize: 20),
                //                         )),
                //                     Positioned(
                //                       top: 175,
                //                       left: 20,
                //                       child: Container(
                //                         // width: MediaQuery.of(context).size.width * .5,
                //                         height: 100,
                //                         child: Column(
                //                           children: [
                //                             Text(
                //                               "We will learn these Topics ",
                //                               style: GoogleFonts.acme(
                //                                 fontSize: 16,
                //                                 color: Colors.white,
                //                               ),
                //                             ),
                //                             const Text(
                //                               "Maths Topic one",
                //                               style: TextStyle(
                //                                   fontSize: 14,
                //                                   color: Colors.white),
                //                             ),
                //                             const Text(
                //                               "Topic two",
                //                               style: TextStyle(
                //                                   fontSize: 14,
                //                                   color: Colors.white),
                //                             ),
                //                             const Text(
                //                               "Topic three",
                //                               style: TextStyle(
                //                                   fontSize: 14,
                //                                   color: Colors.white),
                //                             ),
                //                             const Text(
                //                               "Topic four",
                //                               style: TextStyle(
                //                                   fontSize: 14,
                //                                   color: Colors.white,
                //                                   fontStyle: null),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                     const SizedBox(
                //                       height: 30.0,
                //                     ),
                //                     Positioned(
                //                       bottom: 10,
                //                       right: 10,
                //                       child: Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.start,
                //                         children: [
                //                           RaisedButton(
                //                             onPressed: () async {
                //                               final path =
                //                                   'assets/PDF/10-pashto.pdf';
                //                               final file = await pdfApi
                //                                   .loadAsset(path);
                //                               openPdf(context, file);
                //                             },
                //                             child: const Text(
                //                               "PDF File",
                //                               style: TextStyle(
                //                                   color: Colors.white),
                //                             ),
                //                             color: const Color(0xFF1BC0C5),
                //                           ),
                //                           const SizedBox(
                //                             width: 20,
                //                           ),
                //                           RaisedButton(
                //                             onPressed: () {
                //                               Navigator.push(
                //                                   context,
                //                                   MaterialPageRoute(
                //                                       builder: (context) =>
                //                                           const QuizScreen()));
                //                             },
                //                             child: const Text(
                //                               "Take Quiz",
                //                               style: TextStyle(
                //                                   color: Colors.white),
                //                             ),
                //                             color: const Color(0xFF1BC0C5),
                //                           )
                //                         ],
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           );
                //         });
                //   },
                //   child: AnimatedContainer(
                //     duration: const Duration(milliseconds: 100),
                //     transform: Matrix4.rotationZ(
                //         scrollDirection == ScrollDirection.forward
                //             ? 0.07
                //             : scrollDirection == ScrollDirection.reverse
                //                 ? -0.07
                //                 : 0),
                //     width: 200,
                //     margin: const EdgeInsets.symmetric(
                //         horizontal: 16, vertical: 16),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 16, vertical: 8),
                //     decoration: BoxDecoration(
                //         color: Colors.teal,
                //         borderRadius: BorderRadius.circular(16),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.teal.withOpacity(0.6),
                //             offset: const Offset(-6, 4),
                //             blurRadius: 10,
                //           )
                //         ]),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Image.asset(
                //           "assets/human1.png",
                //           height: 120,
                //         ),
                //         const Padding(
                //           padding: EdgeInsets.symmetric(vertical: 16),
                //         ),
                //         const Text(
                //           "Chapter 1",
                //           style: const TextStyle(
                //               color: Colors.white,
                //               fontSize: 24,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     showDialog<void>(
                //       context: context,
                //       barrierDismissible: true,
                //       // false = user must tap button, true = tap outside dialog
                //       builder: (BuildContext dialogContext) {
                //         return AlertDialog(
                //           backgroundColor: Colors.indigo,
                //           title: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: <Widget>[
                //               Text('Chapter 2'),
                //               IconButton(
                //                 onPressed: () {
                //                   Navigator.of(context).pop();
                //                 },
                //                 icon: Icon(Icons.close),
                //               )
                //             ],
                //           ),
                //           content: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             // crossAxisAlignment: CrossAxisAlignment.center,
                //             children: <Widget>[
                //               Container(
                //                 height: 150,
                //                 width: 150,
                //                 decoration: BoxDecoration(
                //                   // color: Colors.blue,
                //                   image: DecorationImage(
                //                       image: AssetImage(
                //                     "assets/human1.png",
                //                   )),
                //                 ),
                //                 child: IconButton(
                //                   onPressed: () {
                //                     // Navigator.of(context).push(
                //                     //     MaterialPageRoute(
                //                     //         builder: (context) => VideoLink()));
                //                   },
                //                   icon: Icon(
                //                     Icons.play_circle_fill,
                //                     size: 100,
                //                     color: Colors.red,
                //                   ),
                //                 ),
                //               ),
                //               Container(
                //                 height: 200,
                //                 width: 200,
                //                 // color: Colors.purpleAccent,
                //                 child: Column(
                //                   children: <Widget>[
                //                     Text('Chemistry First Topic'),
                //                     Text('Second Topic'),
                //                     Text('Third Topic'),
                //                     Text('Fourth Topic'),
                //                     Text('Fifth Topic'),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           ),
                //           actions: <Widget>[
                //             Align(
                //               alignment: Alignment.bottomLeft,
                //               child: Row(
                //                 children: <Widget>[
                //                   ElevatedButton(
                //                       onPressed: () {},
                //                       child: Text('Take Quize')),
                //                   SizedBox(
                //                     width: 10,
                //                   ),
                //                   ElevatedButton(
                //                       onPressed: () {},
                //                       child: Text('PDF File'))
                //                 ],
                //               ),
                //             ),
                //             // TextButton(
                //             //   child: Text('buttonText'),
                //             //   onPressed: () {
                //             //     Navigator.of(dialogContext)
                //             //         .pop(); // Dismiss alert dialog
                //             //   },
                //             // ),
                //           ],
                //         );
                //       },
                //     );
                //   },
                //   child: AnimatedContainer(
                //     duration: const Duration(milliseconds: 100),
                //     transform: Matrix4.rotationZ(
                //         scrollDirection == ScrollDirection.forward
                //             ? 0.07
                //             : scrollDirection == ScrollDirection.reverse
                //                 ? -0.07
                //                 : 0),
                //     width: 200,
                //     margin: const EdgeInsets.symmetric(
                //         horizontal: 16, vertical: 16),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 16, vertical: 8),
                //     decoration: BoxDecoration(
                //         color: Colors.green,
                //         borderRadius: BorderRadius.circular(16),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.green.withOpacity(0.6),
                //             offset: const Offset(-6, 4),
                //             blurRadius: 10,
                //           )
                //         ]),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Image.asset(
                //           "assets/human1.png",
                //           height: 120,
                //         ),
                //         const Padding(
                //           padding: EdgeInsets.symmetric(vertical: 16),
                //         ),
                //         const Text(
                //           "Chapter 2",
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 24,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ChapterButt(
    Color color,
    String textPashto,
    String textChapter,
    String textTopic1,
    String textTopic2,
    String textTopic3,
    String textTopic4,
    VoidCallback videoPress,
    VoidCallback pdfPress,
    VoidCallback quizPress,
  ) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black87,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height - 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                // color: Colors.teal,
                child: Material(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: MaterialButton(
                          minWidth: 5,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 150,
                          // width: 80,
                          decoration: const BoxDecoration(
                            // color: Colors.blue,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/human1.png",
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 25,
                                left: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: videoPress,
                                  child: const Icon(
                                    Icons.play_circle_fill,
                                    size: 100,
                                    color: Colors.red,
                                  ),
                                ),
                                // child: IconButton(
                                // onPressed: videoPress,
                                // onPressed: () {
                                //   Navigator.of(context).push(MaterialPageRoute(
                                //       builder: (context) => Physics_Chp1_Video()));
                                // },
                                //   icon:
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 27,
                        child: Text(
                          textChapter,
                          style: GoogleFonts.abel(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 110,
                        child: Text(
                          textPashto,
                          style: GoogleFonts.abel(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 185,
                        // left: 20,
                        right: 20,
                        child: Column(
                          children: [
                            Text(
                              textTopic1,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              textTopic2,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              textTopic3,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              textTopic4,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RaisedButton(
                              onPressed: pdfPress,
                              // onPressed: () async {
                              //   final path = 'assets/PDF/10-pashto.pdf';
                              //   final file = await pdfApi.loadAsset(path);
                              //   openPdf(context, file);
                              // },
                              child: const Text(
                                "PDF File",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: const Color(0xFF1BC0C5),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            RaisedButton(
                              onPressed: quizPress,
                              // onPressed: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               const QuizScreen()));
                              // },
                              child: const Text(
                                "Take Quiz",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: const Color(0xFF1BC0C5),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.rotationZ(scrollDirection == ScrollDirection.forward
            ? 0.07
            : scrollDirection == ScrollDirection.reverse
                ? -0.07
                : 0),
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.6),
              offset: const Offset(-6, 4),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/human1.png",
              height: 120,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            Text(
              textPashto,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              textChapter,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void openPdf(BuildContext context, File file) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
  }
}

//Class 10 Chemistry Book
class ChemistryTabs extends StatefulWidget {
  final Widget? child;

  const ChemistryTabs({Key? key, this.child}) : super(key: key);

  @override
  State<ChemistryTabs> createState() => _ChemistryTabsState();
}

class _ChemistryTabsState extends State<ChemistryTabs> {
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageContainer(),
    );
  }

  Widget ImageContainer() {
    return Container(
      //Newly Added Horizontal scrolled animation
      child: Center(
        child: Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 16),
          // color: Colors.blue,
          child: NotificationListener<ScrollNotification>(
            onNotification: _scrollNotification,
            child: ListView(
              controller: listScrollController,
              scrollDirection: Axis.horizontal,
              children: [
                ChapterButt(
                  Colors.teal,
                  'لومړي څپرکۍ',
                  'Chapter 1',
                  'د اتومي تیوري پراختیااو تاریخچه',
                  'د اتوم جوړښټ او اتومی طیف',
                  'د بور اتومی تیوری، اوسنی اتومی تیوری',
                  'څو الکترونی اتومونو الکتروني جوړښت',
                  () => {},
                  () async {
                    Navigator.of(context).pop();
                    const path = 'assets/PDF/10-chemistry.pdf';
                    final file = await pdfApi.loadAsset(path);
                    openPdf(context, file);
                  },
                  () => {
                    Navigator.of(context).pop(),
                    // QuestionController.ChapterIndex = 3,
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewQuizScreen(
                          quizQuestions: quizQuestions,
                        ),
                      ),
                    ),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ChapterButt(
    Color color,
    String textPashto,
    String textChapter,
    String textTopic1,
    String textTopic2,
    String textTopic3,
    String textTopic4,
    VoidCallback videoPress,
    VoidCallback pdfPress,
    VoidCallback quizPress,
  ) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black87,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height - 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                // color: Colors.teal,
                child: Material(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: MaterialButton(
                          minWidth: 5,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 150,
                          // width: 80,
                          decoration: const BoxDecoration(
                            // color: Colors.blue,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/human1.png",
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 25,
                                left: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: videoPress,
                                  child: const Icon(
                                    Icons.play_circle_fill,
                                    size: 100,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 27,
                        child: Text(
                          textChapter,
                          style: GoogleFonts.abel(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 110,
                        child: Text(
                          textPashto,
                          style: GoogleFonts.abel(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 185,
                        // left: 20,
                        right: 20,
                        child: Column(
                          children: [
                            Text(
                              textTopic1,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              textTopic2,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              textTopic3,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              textTopic4,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RaisedButton(
                              onPressed: pdfPress,
                              child: const Text(
                                "PDF File",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: const Color(0xFF1BC0C5),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            RaisedButton(
                              onPressed: quizPress,
                              child: const Text(
                                "Take Quiz",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: const Color(0xFF1BC0C5),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.rotationZ(
          scrollDirection == ScrollDirection.forward
              ? 0.07
              : scrollDirection == ScrollDirection.reverse
                  ? -0.07
                  : 0,
        ),
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.6),
              offset: const Offset(-6, 4),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/human1.png",
              height: 120,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            Text(
              textPashto,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              textChapter,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openPdf(BuildContext context, File file) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
  }
}

//Class 10 Biology Book
class BiologyTabs extends StatefulWidget {
  final Widget? child;

  const BiologyTabs({Key? key, this.child}) : super(key: key);

  @override
  State<BiologyTabs> createState() => _BiologyTabsState();
}

class _BiologyTabsState extends State<BiologyTabs> {
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageContainer(),
    );
  }

  Widget ImageContainer() {
    return Container(
      //Newly Added Horizontal scrolled animation
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 16),
          // color: Colors.blue,
          child: NotificationListener<ScrollNotification>(
            onNotification: _scrollNotification,
            child: ListView(
              controller: listScrollController,
              scrollDirection: Axis.horizontal,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  transform: Matrix4.rotationZ(
                    scrollDirection == ScrollDirection.forward
                        ? 0.07
                        : scrollDirection == ScrollDirection.reverse
                            ? -0.07
                            : 0,
                  ),
                  width: 200,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.6),
                        offset: const Offset(-6, 4),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/human1.png",
                        height: 120,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      Text(
                        'Coming Soon...',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Class 10 English Book
class EnglishTabs extends StatefulWidget {
  final Widget? child;

  const EnglishTabs({Key? key, this.child}) : super(key: key);

  @override
  State<EnglishTabs> createState() => _EnglishTabsState();
}

class _EnglishTabsState extends State<EnglishTabs> {
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;
  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageContainer(),
    );
  }

  Widget ImageContainer() {
    return Container(
      //Newly Added Horizontal scrolled animation
      child: Center(
        child: Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 16),
          // color: Colors.blue,
          child: NotificationListener<ScrollNotification>(
            onNotification: _scrollNotification,
            child: ListView(
              controller: listScrollController,
              scrollDirection: Axis.horizontal,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  transform: Matrix4.rotationZ(
                      scrollDirection == ScrollDirection.forward
                          ? 0.07
                          : scrollDirection == ScrollDirection.reverse
                              ? -0.07
                              : 0),
                  width: 200,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.6),
                          offset: const Offset(-6, 4),
                          blurRadius: 10,
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/human1.png",
                        height: 120,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      const Text(
                        "Comming Soon...",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Class 10 Pashto Book
class PashtoTabs extends StatefulWidget {
  final Widget? child;

  const PashtoTabs({Key? key, this.child}) : super(key: key);

  @override
  State<PashtoTabs> createState() => _PashtoTabsState();
}

class _PashtoTabsState extends State<PashtoTabs> {
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;
  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //Newly Added Horizontal scrolled animation
      child: Center(
        child: Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 16),
          // color: Colors.blue,
          child: NotificationListener<ScrollNotification>(
            onNotification: _scrollNotification,
            child: ListView(
              controller: listScrollController,
              scrollDirection: Axis.horizontal,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  transform: Matrix4.rotationZ(
                      scrollDirection == ScrollDirection.forward
                          ? 0.07
                          : scrollDirection == ScrollDirection.reverse
                              ? -0.07
                              : 0),
                  width: 200,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.8),
                          offset: const Offset(-6, 4),
                          blurRadius: 10,
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/human1.png",
                        height: 120,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      const Text(
                        "Comming Soon...",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openPdf(BuildContext context, File file) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
  }

  Widget ImageContainer() {
    return Container(
      height: 300.0,
      child: Image.asset(
        'assets/secondary2.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
