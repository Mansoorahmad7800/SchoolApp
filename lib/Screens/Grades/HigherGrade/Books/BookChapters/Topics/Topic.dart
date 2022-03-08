import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class TopicToRead extends StatelessWidget {
  const TopicToRead({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50)
                    ),
                    color: newkPrimaryColor,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 50,
                          left: 0,
                          child: Container(
                            height: 60,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                )
                            ),
                          )
                      ),
                      Positioned(
                        top: 65,
                        left: 15,
                        child: Text("Topic Selection",style: TextStyle(fontSize: 20,color: newkPrimaryColor),),
                      ),
                      Positioned(
                          top: 10,
                          left: 0,
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: size.height,
                  color: Colors.deepOrange,
                  child: Center(child: Text("You can Read here")),
                ),
              ],
            ),
          ),
        )
    );
  }
}

// class PDFfile extends StatefulWidget {
//   const PDFfile({Key key}) : super(key: key);
//
//   @override
//   _PDFfileState createState() => _PDFfileState();
// }
//
// class _PDFfileState extends State<PDFfile> {
//   String pdfasset = "assets/Al_Quran.pdf";
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


