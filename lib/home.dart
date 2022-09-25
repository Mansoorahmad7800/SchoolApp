import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mansoor/Drawer/drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mansoor/user_model.dart';

class Home extends StatefulWidget {
  static String id = "homePage";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          drawer: DrawerMain(),
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
                        Text(
                          "Mr. ${loggedInUser.userName}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Title
                const Positioned(
                  top: 24,
                  left: 80,
                  child: Text(
                    "ZdaKra",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 20,
                        ),
                        Shadow(
                          color: Colors.black,
                          offset: Offset(-3.0, -3.0),
                          blurRadius: 20,
                        )
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
                        color: Colors.white,
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
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // SizedBox(height: 150,),
                      Carsou(), // Picstures sliding
                      GradeButton(
                        textt: "Pirmary Grades",
                        texttt: "Primary Grades from class 1 to class 6",
                        image: Image.asset("assets/children.png"),
                        colorr: Colors.black87,
                        presss: () {
                          Fluttertoast.showToast(
                            msg: 'Comming Soon...',
                            timeInSecForIosWeb: 4,
                          );
                        },
                      ),
                      GradeButton(
                        textt: "Secondary Grades",
                        texttt: "Primary Grades from class 7 to class 9",
                        image: Image.asset("assets/secondary2.jpg"),
                        colorr: Colors.red,
                        presss: () {
                          Fluttertoast.showToast(
                            msg: 'Comming Soon...',
                            timeInSecForIosWeb: 4,
                          );
                        },
                      ),
                      GradeButton(
                        textt: "Higher Grades",
                        texttt: "Primary Grades from class 10 to class 12",
                        image: Image.asset("assets/highGrad.png"),
                        colorr: Colors.green,
                        presss: () {
                          Get.toNamed('/highGrade');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Design of Buttons

class GradeButton extends StatelessWidget {
  final String textt, texttt;
  final VoidCallback presss;
  final Color colorr, textColorr;
  final Widget image;

  const GradeButton({
    Key? key,
    required this.textt,
    required this.texttt,
    required this.presss,
    required this.colorr,
    this.textColorr = Colors.white,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
      height: 230,
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Material(
            //GestureDetector is for clicking anywhere on container
            child: GestureDetector(
              child: Container(
                height: 180.0,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: colorr,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26.withOpacity(0.3),
                          offset: new Offset(-10.0, 10.0),
                          blurRadius: 20.0,
                          spreadRadius: 4.0),
                    ]),
              ),
              onTap: presss,
            ),
          )),
          Positioned(
              top: 5,
              left: 10,
              child: Card(
                elevation: 10.0,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),

                // GestureDetector for clicking anyWhere on conatiner
                child: GestureDetector(
                  child: Container(
                    child: image,
                    height: 160,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onTap: presss,
                ),
              )),
          Positioned(
            top: 45,
            left: 170,
            child: Container(
              height: 150,
              width: width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                    onPressed: presss,
                    child: Text(
                      textt,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    endIndent: 12,
                  ),
                  Text(
                    texttt,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

//Carsoul Pictures Slider

class NewCarSoul extends StatefulWidget {
  const NewCarSoul({Key? key}) : super(key: key);

  @override
  State<NewCarSoul> createState() => _NewCarSoulState();
}

class _NewCarSoulState extends State<NewCarSoul> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Carsou extends StatefulWidget {
  @override
  State<Carsou> createState() => _CarsouState();
}

class _CarsouState extends State<Carsou> {
  int _currentIndex = 0;

  List imageList = [
    'assets/photo1.jpg',
    'assets/photo2.jpg',
    'assets/photo5.jpg',
    'assets/photo4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            // autoPlayInterval: Duration(seconds: 1),
            // autoPlayAnimationDuration: Duration(milliseconds: 200),
            // enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
          items: imageList
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    margin: EdgeInsets.only(
                      top: 10.0,
                      // bottom: 10.0,
                    ),
                    elevation: 2.0,
                    shadowColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.map((urlOfItem) {
            int index = imageList.indexOf(urlOfItem);
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color.fromRGBO(0, 0, 0, 0.8)
                    : Color.fromRGBO(0, 0, 0, 0.3),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
