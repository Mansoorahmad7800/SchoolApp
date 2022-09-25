import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mansoor/main.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SplashScreenWeb extends StatefulWidget {
  const SplashScreenWeb({Key? key}) : super(key: key);

  @override
  State<SplashScreenWeb> createState() => _SplashScreenWebState();
}

class _SplashScreenWebState extends State<SplashScreenWeb> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 7),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4FBFB),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 400,
                width: 400,
                child: Image.asset(
                  "assets/splash.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SpinKitFadingCircle(
                  size: 80,
                  duration: const Duration(seconds: 2),
                  itemBuilder: (context, index) {
                    final colors = [
                      Color(0xfff16a70),
                      Color(0xffb1d877),
                      Color(0xff8cdcda),
                      Color(0xff4d4d4d)
                    ];
                    final color = colors[index % colors.length];
                    return DecoratedBox(
                      decoration: BoxDecoration(color: color),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 70,
                  animation: true,
                  lineHeight: 40.0,
                  animationDuration: 4000,
                  percent: 0.9,
                  // center: Text("95.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreenPhone extends StatefulWidget {
  const SplashScreenPhone({Key? key}) : super(key: key);

  @override
  State<SplashScreenPhone> createState() => _SplashScreenPhoneState();
}

class _SplashScreenPhoneState extends State<SplashScreenPhone> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xFFF4FBFB),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextLiquidFill(
            text: 'Zda-Kra',
            waveColor: Colors.blueAccent,
            textStyle: TextStyle(
              fontSize: 80.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 300.0,
          ),
          SizedBox(
            height: 40,
          ),
          SpinKitCircle(
            size: 80,
            duration: const Duration(seconds: 2),
            itemBuilder: (context, index) {
              final colors = [
                Color(0xfff16a70),
                Color(0xffb1d877),
                Color(0xff8cdcda),
                Color(0xff4d4d4d)
              ];
              final color = colors[index % colors.length];
              return DecoratedBox(
                decoration: BoxDecoration(color: color),
              );
            },
          ),
        ],
      ),
    ));
  }
}
