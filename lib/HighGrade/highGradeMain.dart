import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mansoor/HighGrade/ClassEleven.dart';
import 'package:mansoor/HighGrade/ClassTen.dart';
import 'package:mansoor/HighGrade/ClassTwelve.dart';

class HigerGrade extends StatefulWidget {
  @override
  State<HigerGrade> createState() => _HigerGradeState();
}

Color PrimaryColor = Colors.black87;

class _HigerGradeState extends State<HigerGrade> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              automaticallyImplyLeading: false,
              backgroundColor: PrimaryColor,
              title: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Select your Class'),
              ),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 6.0,
                onTap: (index) {
                  setState(() {
                    switch (index) {
                      case 0:
                        PrimaryColor = Colors.black87;
                        break;
                      case 1:
                        PrimaryColor = Colors.red;
                        break;
                      case 2:
                        PrimaryColor = Colors.green;
                        break;
                      default:
                    }
                  });
                },
                tabs: <Widget>[
                  Tab(
                    child: Container(
                      child: Text(
                        'Class 10th\n لسم ټولګی',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'Class 11th\n یوولسم ټولګی',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'Class 12th\n دولسم ټولګی',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ClassTen(0xDD000000),
                ClassElevn(0xDD000000),
                ClassTwelve(0xDD000000),
              ],
            ),
          )),
    );
  }
}
