import 'package:flutter/material.dart';

class TopicButton extends StatelessWidget {
  final String textt,texttt;
  final Function presss,press;
  final Color colorr, textColorr;
  const TopicButton({
    Key key,
    this.texttt,
    this.textt,
    this.press,
    this.presss,
    this.colorr,
    this.textColorr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(80, 10, 50, 10),
      width: size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: newElevatedButton(),
                ),
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ElvtedButton(),
                ),
              )
            ],
          ),
        ],
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          textStyle: TextStyle(
              color: textColorr, fontSize: 20, fontWeight: FontWeight.w500)),
    );
  }
  Widget ElvtedButton() {
    return ElevatedButton(
      child: Text(
        texttt,
        style: TextStyle(color: textColorr),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: colorr,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          textStyle: TextStyle(
              color: textColorr, fontSize: 20, fontWeight: FontWeight.w500)),
    );
  }
}


