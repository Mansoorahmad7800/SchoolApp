import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mansoor/home.dart';
import 'package:mansoor/Login&_SignUp/loginPage.dart';
import 'package:mansoor/user_model.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({Key? key}) : super(key: key);

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  final _formkey = GlobalKey<FormState>();

  var newPassword = "";
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final currentPasswordController = TextEditingController();

  bool _obscureText = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  User user = FirebaseAuth.instance.currentUser!;

  UserModel loggedInUser = UserModel();

  _changePassword(String newPassword, String currentPassword) async {
    final cred = EmailAuthProvider.credential(
        email: user.email.toString(), password: currentPassword);
    // print('waiting for it ');
    if (_formkey.currentState!.validate()) {
      try {
        // print("Entered to ");
        await user.reauthenticateWithCredential(cred);
        await user.updatePassword(newPassword);

        await FirebaseAuth.instance.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        Fluttertoast.showToast(msg: "Sucessfully");
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.message!, timeInSecForIosWeb: 4);
      }
      // print('done');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Password Change"),
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  "Please change your password",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 26,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    obscureText: _obscureText,
                    keyboardType: TextInputType.emailAddress,
                    controller: currentPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xffe7edeb),
                      hintText: "Current Password",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _toggle,
                        icon: _obscureText
                            ? FaIcon(FontAwesomeIcons.eyeSlash)
                            : FaIcon(FontAwesomeIcons.eye),
                      ),
                    ),
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Password Required", timeInSecForIosWeb: 2);
                        return ("Password Required");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Minimum it should be (6) Characters");
                      }
                    },
                    onSaved: (value) {
                      currentPasswordController.text = value!;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    obscureText: _obscureText,
                    keyboardType: TextInputType.emailAddress,
                    controller: newPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xffe7edeb),
                      hintText: "New Password",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _toggle,
                        icon: _obscureText
                            ? FaIcon(FontAwesomeIcons.eyeSlash)
                            : FaIcon(FontAwesomeIcons.eye),
                      ),
                    ),
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Password Required", timeInSecForIosWeb: 2);
                        return ("Password Required");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Minimum it should be (6) Characters");
                      }
                    },
                    onSaved: (value) {
                      newPasswordController.text = value!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    obscureText: _obscureText,
                    keyboardType: TextInputType.emailAddress,
                    controller: confirmNewPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xffe7edeb),
                      hintText: "Confirm Password",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _toggle,
                        icon: _obscureText
                            ? FaIcon(FontAwesomeIcons.eyeSlash)
                            : FaIcon(FontAwesomeIcons.eye),
                      ),
                    ),
                    validator: (value) {
                      if (confirmNewPasswordController.text !=
                          newPasswordController.text) {
                        return "Password doesn't match";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      newPasswordController.text = value!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        String currentPassword = "";
                        setState(() {
                          currentPassword = currentPasswordController.text;
                          newPassword = confirmNewPasswordController.text;
                        });

                        _changePassword(newPassword, currentPassword);
                        // if (_formkey.currentState!.validate()) {
                        //   setState(() {
                        //     newPassword = newPasswordController.text;
                        //   });
                        //   changePassword(newPassword);
                        // }
                      },
                      color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: Text(
                          "Change Password",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
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
