import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mansoor/Parents/parent_home.dart';
import 'package:mansoor/Parents/password_change.dart';
import 'package:mansoor/home.dart';
import 'package:mansoor/ParentLogin_OTP/parent_login_page.dart';
import 'package:pinput/pinput.dart';

class verificationOtp extends StatefulWidget {
  const verificationOtp(
      {Key? key, required this.verificationId, required this.phoneNumber})
      : super(key: key);
  final String verificationId;
  final String phoneNumber;

  @override
  State<verificationOtp> createState() => _verificationOtpState();
}

class _verificationOtpState extends State<verificationOtp> {
  String smsCode = "";
  bool loading = false;
  bool resend = false;
  int count = 20;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decompte();
  }

  late Timer timer;
  void decompte() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (count < 1) {
        timer.cancel();
        count = 20;
        resend = true;
        setState(() {});
        return;
      }
      count--;
      setState(() {});
    });
  }

  void onResendSmsCode() {
    resend = false;
    setState(() {});
    authwithPhoneNumber(widget.phoneNumber, onCodeSend: (verificationId, v) {
      loading = false;
      decompte();
      setState(() {});
    }, onAutoVerify: (v) async {
      await _auth.signInWithCredential(v);
    }, onFailed: (e) {
      Fluttertoast.showToast(msg: "Failed...!!!");
    }, autoRetrival: (v) {});
  }

  void onVerifySmsCode() async {
    loading = true;
    setState(() {});
    await validateOtp(smsCode, widget.verificationId);
    loading = true;
    setState(() {});
    Fluttertoast.showToast(
      msg: "Verified Successfully\n Welcome to your Account",
      timeInSecForIosWeb: 4,
    );
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (c) => ParentHomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text(
                  "Verfiy OTP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xFF0095FF)),
                ),
                Text(
                  "Check your message to validate",
                  style: TextStyle(fontSize: 14, color: Color(0xff0095ff)),
                ),
                SizedBox(
                  height: 20,
                ),
                Pinput(
                  length: 6,
                  onChanged: (value) {
                    smsCode = value;
                    setState(() {});
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: !resend ? null : onResendSmsCode,
                    child: Text(!resend
                        ? "00:${count.toString().padLeft(2, "0")}"
                        : "Resend Code"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15)),
                      onPressed: smsCode.length < 6 || loading
                          ? null
                          : onVerifySmsCode,
                      child: loading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : Text(
                              'Verify',
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
