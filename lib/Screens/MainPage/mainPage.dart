import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/MainPage/components/body.dart';
import 'package:flutter_auth/Screens/MainPage/components/mainDrawer.dart';
import 'package:flutter_auth/constants.dart';

class MainPagee extends StatelessWidget {
  const MainPagee({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("e-Learning"),
        backgroundColor: Colors.transparent,
      ),
      drawer: mainDrawer(),
      body: body(),
    );
  }
}

