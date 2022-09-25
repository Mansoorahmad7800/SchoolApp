import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String option;
  final VoidCallback onTap;
  final Color? color;
  OptionButton(
      {required this.option, required this.onTap, required this.color});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        width: size.width * 0.8,
        height: 70,
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              option,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
