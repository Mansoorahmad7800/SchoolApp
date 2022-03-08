import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class SelectClassButton extends StatelessWidget {
  final String textt;
  final Function presss;
  final Color colorr, textColorr;
  const SelectClassButton({
    Key key,
    this.textt,
    this.presss,
    this.colorr,
    this.textColorr = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        textt,
        style: TextStyle(color: textColorr),
      ),
      onPressed: presss,
      style: ElevatedButton.styleFrom(
          primary: colorr,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          textStyle: TextStyle(
              color: textColorr, fontSize: 24, fontWeight: FontWeight.w500)),
    );
  }
}