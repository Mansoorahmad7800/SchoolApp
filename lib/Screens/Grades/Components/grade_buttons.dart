import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class GradeButtons extends StatelessWidget {
  final String textt,texttt;
  final Function presss;
  final Color colorr, textColorr;
  final AssetImage imagee;
  final Widget child;
  const GradeButtons({
    Key key,
    @required this.child,
    this.textt,
    this.texttt,
    this.presss,
    this.imagee,
    this.colorr ,// kPrimaryColor,
    this.textColorr = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        //new code
        height: 230,
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Material(
                  //GestureDetector is for clicking anywhere on container
                  child: GestureDetector(
                    child: Container(
                      height: 180.0,
                      width: width*0.9,
                      decoration: BoxDecoration(
                        color: colorr,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:[
                          BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: new Offset(-10.0, 10.0),
                          blurRadius: 20.0,
                          spreadRadius: 4.0
                        ),
                        ]
                      ),
                    ),
                    onTap: presss,
                  ),
                )
            ),
            Positioned(
                top: 0,
                left: 30,
                child: Card(
                  elevation: 10.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  // GestureDetector for clicking anyWhere on conatiner
                  child: GestureDetector(
                    child: Container(
                      child: child,
                      height: 160,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // image: DecorationImage(
                        //   image: AssetImage("assets/images/children reading book.png"),
                        //   fit: BoxFit.fill
                        // ),
                      ),
                    ),
                    onTap: presss,
                  ),
                )
            ),
            Positioned(
              top: 45,
                left: 200,
                child: Container(
                  height: 150,
                  width: 160,
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
                              //color: newkPrimaryColor,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                      ),
                      Divider(color: Colors.black,),
                      Text(
                        texttt,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          //color: Colors.grey,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),

        //Old Code

        // margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
        // width: size.width * 0.8,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/background1.jpg"),
        //   ),
        // ),
        // child: ClipRRect(
        //   borderRadius: BorderRadius.circular(29),
        //   child: newElevatedButton(),
        // ),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  // Widget newElevatedButton() {
  //   return Column(
  //     children: <Widget>[
  //       ElevatedButton(
  //       child: Text(
  //         textt,
  //         style: TextStyle(color: textColorr),textAlign: TextAlign.end,
  //       ),
  //       onPressed: presss,
  //       style: ElevatedButton.styleFrom(
  //           //primary: colorr,
  //           padding: EdgeInsets.symmetric(horizontal: 50, vertical: 80),
  //           textStyle: TextStyle(
  //               color: textColorr, fontSize: 24, fontWeight: FontWeight.w500)),
  //     ),
  //       Text(texttt),
  //   ]
  //   );
  // }
}