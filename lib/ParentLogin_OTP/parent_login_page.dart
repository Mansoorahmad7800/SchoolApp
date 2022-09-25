import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mansoor/ParentLogin_OTP/verficationOtp.dart';
import 'package:mansoor/user_model.dart';

class ParentLogIn extends StatefulWidget {
  const ParentLogIn({Key? key}) : super(key: key);

  @override
  State<ParentLogIn> createState() => _ParentLogInState();
}

class _ParentLogInState extends State<ParentLogIn> {
  bool isLoading = false;

  String phoneNumber = '';
  final _auth = FirebaseAuth.instance;
  TextEditingController PhoneNumberEditingController = TextEditingController();

  sendOtpCode(String _phoneNo) {
    isLoading = true;

    print('i am in');
    FirebaseFirestore.instance
        .collection('users')
        .where('p_phone', isEqualTo: _phoneNo)
        .get()
        .then(
      (DocumentSnapshot) {
        // print(DocumentSnapshot.docs.elementAt(0)['p_phone'].toString());
        if (DocumentSnapshot.docs.isNotEmpty) {
          print('User Exitsts');
          authwithPhoneNumber(
            phoneNumber,
            onCodeSend: (verificationId, v) {
              isLoading = false;
              setState(() {});
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => verificationOtp(
                    verificationId: verificationId,
                    phoneNumber: phoneNumber,
                  ),
                ),
              );
            },
            onAutoVerify: (v) async {
              await _auth.signInWithCredential(v);
              // Navigator.of(context).pop();
            },
            onFailed: (e) {
              Fluttertoast.showToast(msg: "Failed...!!!");
            },
            autoRetrival: (v) {},
          );
          // print(DocumentSnapshot.docs.elementAt(0)['p_phone'].toString());
        } else {
          // print(DocumentSnapshot.docs.elementAt(0)['p_phone'].toString());
          Fluttertoast.showToast(
            msg: "Please Provide Number that your child has given",
            timeInSecForIosWeb: 3,
          );
          print('Not Exits');
        }
        setState(() {});
        // print('------------' + DocumentSnapshot.docs.elementAt(0)['userName'].data().toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.lightBlue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 36.0, horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 46.0,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Enter your Phone Number to SIGN IN",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 40,
                // ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: IntlPhoneField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            controller: PhoneNumberEditingController,
                            initialCountryCode: "PK",
                            onChanged: (value) {
                              phoneNumber = value.completeNumber;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //   padding: const EdgeInsets.symmetric(vertical: 15),
                              // ),
                              // onPressed: (){
                              //   print('I am pressed');
                              //   sendOtpCode(PhoneNumberEditingController.text.toString());
                              // },
                              onPressed: () {
                                sendOtpCode(
                                  PhoneNumberEditingController.text.toString(),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: isLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        'Sign In',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final _auth = FirebaseAuth.instance;

void authwithPhoneNumber(String phone,
    {required Function(String valu, int? value1) onCodeSend,
    required Function(PhoneAuthCredential value) onAutoVerify,
    required Function(FirebaseAuthException value) onFailed,
    required Function(String value) autoRetrival}) async {
  _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 120),
      verificationCompleted: onAutoVerify,
      verificationFailed: onFailed,
      codeSent: onCodeSend,
      codeAutoRetrievalTimeout: autoRetrival);
}

Future<void> validateOtp(String smsCode, String verificationId) async {
  final _credential = PhoneAuthProvider.credential(
      verificationId: verificationId, smsCode: smsCode);
  await _auth.signInWithCredential(_credential);
  return;
}
