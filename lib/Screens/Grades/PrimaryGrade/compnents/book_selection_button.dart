import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class BookSelectionButton extends StatelessWidget {
  final Function presss;
  final IconData icon ;
  const BookSelectionButton({
    Key key,
    this.icon = Icons.book_outlined,
    this.presss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: EvlButton(),
      ),
    );
  }

  Widget EvlButton(){
    return ElevatedButton(
      child: Icon(
        icon,
        size: 50,
      ),
      onPressed: presss,
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,

      ),
    );
  }
}