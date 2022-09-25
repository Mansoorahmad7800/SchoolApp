import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mansoor/Forgot_Password/forgot_password.dart';
import 'package:mansoor/home.dart';
import 'package:mansoor/Login&_SignUp/signupPage.dart';

class LoginPage extends StatefulWidget {
  // static String id = "loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  var email = "";
  var password = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 20,
          color: Colors.black,
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Login to your Account",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xBDBDBDFF),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xBDBDBDFF),
                                    ),
                                  ),
                                ),
                                //for validation
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Please Enter Your Email");
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return ("Please Enter Valid Email");
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  emailController.text = value!;
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                obscureText: _obscureText,
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                onSaved: (value) {
                                  passwordController.text != value;
                                },
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: _toggle,
                                      icon: _obscureText
                                          ? FaIcon(FontAwesomeIcons.eyeSlash)
                                          : FaIcon(FontAwesomeIcons.eye),
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black87),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Color(0xBDBDBDFF),
                                    )),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xBDBDBDFF)))),
                                //for validation
                                validator: (value) {
                                  RegExp regex = RegExp(r'^.{6,}$');
                                  if (value!.isEmpty) {
                                    return ("Password Required");
                                  }
                                  if (!regex.hasMatch(value)) {
                                    Fluttertoast.showToast(
                                        msg: "Enter Valid Password",
                                        timeInSecForIosWeb: 2);
                                    return ("Enter Valid Password ");
                                  }
                                  return null;
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgetPassword(),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 0, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () => {
                            LogIn(),
                            setState(() {
                              isLoading = true;
                            }),
                          },
                          color: Color(0xff0095FF),
                          elevation: 0,
                          shape: StadiumBorder(),
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        // Text("Sign up", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),)
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100, bottom: 0),
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/app1.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future LogIn() async {
    if (_formkey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text)
          .then(
            (value) => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => ParentHomeScreen(),
                  builder: (context) => Home(),
                ),
              ),
              Fluttertoast.showToast(
                  msg: "Login Successful", timeInSecForIosWeb: 3),
            },
          )
          .catchError((e) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: e!.message, timeInSecForIosWeb: 2);
        // navigatorKey.currentState!.popUntil((route) => route.isFirst);
      });
    }
  }
}
