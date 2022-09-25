import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3b599b),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff3b599b),
            Color(0xffffffff),
          ], begin: Alignment.topLeft, end: Alignment.centerRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "About Us",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38.0,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "We are Developers :)",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .8,
                        width: MediaQuery.of(context).size.width * .8,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.black87),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  "This is a Android based Application for school students, this application will help all students who want to study but can not go to schools they get benefit from this application, in this application we are providing all school books from 1st class to 12th class all books are available and the main part of this application is that we have attached video link chapter waise and topic waise"),
                              Divider(
                                thickness: 2,
                                color: Colors.grey,
                              ),
                              Text(
                                "د انډرایډ موبایل لپاره یو بهترین آپلیکیشن دی د هغه زده کوونکو لپاره کټور دی چی غواړی تعلیم وکړی اما د امکانو نه شتون له وجه نشی کولی چی تعلیم وکړی د دی آپلیکیشن په واسطه مونږ د ښونځی ټول کتابونه راټول کړی دی او ترټولو ښه خیره چی د هری موضوع مربوطه موږ د ویدیو لیکچر لینک ورکړی دی چی د هغه لینک په زریعه سره یو زده کوونکی کولی شی ویدو لیکچر وګوری او خپل تعلیم کی اظافه والی راولی ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
