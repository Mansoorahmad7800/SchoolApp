import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff7f6fb),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/logedin.jpg",width: 240,fit: BoxFit.cover,),
              ),
              const SizedBox(height: 18,),
              const Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                "Enter your Email to reset your password",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 38,),
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            labelStyle: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xBDBDBDFF),
                                )
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xBDBDBDFF)
                                )
                            )
                        ),
                        //for validation
                        validator: (value){
                          if(value!.isEmpty){return ("Please Enter Your Email");}
                          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                            return ("Please Enter Valid Email");
                          }
                          return null;
                        },
                        onSaved: (value){ emailController.text = value!;},
                      ),
                      const SizedBox(height: 22,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.email),

                          onPressed: ResetPassword,
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)
                            ))
                          ),
                          label: const Padding(
                            padding: EdgeInsets.all(14),
                            child: Text(
                              "Reset Password",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future ResetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context)=> Center(child: CircularProgressIndicator(),)
    );
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      Fluttertoast.showToast(msg: "Password Reset Email Sent",timeInSecForIosWeb: 3);
      Navigator.of(context).popUntil((route) => route.isFirst);

    } on FirebaseAuthException catch (e){
      print(e);
      Fluttertoast.showToast(msg: e.message!);
      // Navigator.of(context).pop();
    }
  }
}
