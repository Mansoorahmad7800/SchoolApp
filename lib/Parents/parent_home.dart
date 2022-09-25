import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mansoor/Parents/parent_drawer.dart';
import 'package:mansoor/Parents/process_page.dart';
import 'package:mansoor/VideoLink/newVideo.dart';
import 'package:mansoor/user_model.dart';

class ParentHomeScreen extends StatefulWidget {
  const ParentHomeScreen({Key? key}) : super(key: key);

  @override
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
  String chp_1_Time = "";
  String chp_2_Time = "";
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    setState(() {});
    chp_1_Time = const Physics_Chp1_Video().getVideoTime().toString();
    chp_2_Time = const Physics_Chp2_Video().getVideoTime().toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          drawer: DrawerforParent(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 200,
            actions: [
              Container(
                width: 200,
                height: 100,
                child: Image.asset("assets/profil.png"),
              )
            ],
            flexibleSpace: Stack(
              children: [
                Positioned(
                  top: 0,
                  width: MediaQuery.of(context).size.width,
                  // height: 210,
                  child: Image.asset(
                    "assets/Wave-PNG-HD.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  //top: 80,
                  left: 20,
                  bottom: 30,
                  child: Material(
                    elevation: 0,
                    color: Colors.transparent,
                    // color: Colors.black.withOpacity(0.3),
                    // shadowColor: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 3,
                        ),
                        const Text(
                          "ښه راغلاست",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueAccent,
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Text(
                          'Mr. ${loggedInUser.userName}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueAccent,
                          ),
                        ),
                        // Text(
                        //   "${loggedInUser.email}",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, fontSize: 14,color: Colors.blueAccent),
                        // ),
                      ],
                    ),
                  ),
                ),

                //Drawer and Title
                const Positioned(
                  top: 24,
                  left: 80,
                  child: Text(
                    "ZadaKra",
                    style: TextStyle(
                      color: Color.fromARGB(255, 230, 213, 213),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                            color: Colors.black,
                            offset: Offset(10.0, 10.0),
                            blurRadius: 10)
                      ],
                    ),
                  ),
                ),

                //Drawer
                Positioned(
                  child: Builder(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        size: 35,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  top: 20,
                  left: 18,
                ),
              ],
            ),
            backgroundColor: Colors.white,
            elevation: 5,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black87)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: const Text(
                            " :د لسم ټولګۍ د ازموینو ریکارډ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            ResultCard(
                              "فزیک",
                              '${ProcessPage.PhysicsQuizesTaken.toString()} /10',
                              Colors.black,
                            ),
                            ResultCard(
                              "کیمیا",
                              '${ProcessPage.ChemQuizesTaken.toString()} /10',
                              Colors.red,
                            ),
                            ResultCard(
                              "ریاضي",
                              '${ProcessPage.MathsQuizesTaken.toString()} /10',
                              Colors.green,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "You have been playing very well, keep it up",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black87)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          " :د لسم ټولګی د ویډیویي لیکچرونو ریکارډ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 160,
                          // color: Colors.blueGrey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ":فزیک",
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  ResultCard(
                                    "لومړی څپرکۍ",
                                    chp_1_Time.toString(),
                                    Colors.deepOrangeAccent,
                                  ),
                                  ResultCard(
                                    "دوهم څپرکۍ",
                                    chp_2_Time.toString(),
                                    Colors.orange,
                                  ),
                                  ResultCard(
                                    "دریم څپرکۍ",
                                    "--",
                                    // _videoTime.toString(),
                                    Colors.lightGreen,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 160,
                          // color: Colors.blueGrey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ":کیمیا",
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  ResultCard(
                                    "Chapter 1",
                                    "--",
                                    // _videoTime.toString(),
                                    Colors.indigoAccent,
                                  ),
                                  ResultCard(
                                    "Chapter 2",
                                    "--",
                                    // _videoTime.toString(),
                                    Colors.cyanAccent,
                                  ),
                                  ResultCard(
                                    "Chapter 3",
                                    "--",
                                    // _videoTime.toString(),
                                    Colors.orangeAccent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Charts(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black87)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "Lectures that have been Watched From Class 11.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        // Charts(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black87)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "Lectures that have been Watched From Class 12.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        // Text("Video Time"),
                        // Charts(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card ResultCard(String textbook, String textquiz, Color color) {
    return Card(
      color: color,
      shadowColor: Colors.black,
      elevation: 5,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              textbook,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              textquiz,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
