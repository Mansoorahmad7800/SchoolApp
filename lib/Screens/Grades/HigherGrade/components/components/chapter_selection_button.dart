import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class ChapterSectionButton extends StatelessWidget {
  final String text;
  final Function presss;
  final IconData icon ;
  const ChapterSectionButton({
    Key key,
    this.text,
    this.icon = Icons.book_outlined,
    this.presss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: EvlButton(),
        ),
          ),
          Center(
              child: Text(text, style: TextStyle(fontSize: 16),)
          ),
    ]
    )
    );
  }

  Widget EvlButton(){
    return ElevatedButton(
      child: Icon(
        icon,
        size: 40,
      ),
      onPressed: presss,
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,

      ),
    );
  }
}