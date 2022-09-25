// import 'dart:html';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mansoor/Login&_SignUp/loginPage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mansoor/user_model.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController conpassController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController idCardNumber = new TextEditingController();
  // TextEditingController otpController = new TextEditingController();
  TextEditingController p_phone = new TextEditingController();

  // PlatformFile? pickedFile;
  // bool isPic = false;
  // Future selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;

  //   setState(() {
  //     isPic = true;
  //     pickedFile = result.files.first;
  //   });
  // }
  bool isLoading = false;

  File? image;
  Future selectFile() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      Fluttertoast.showToast(
        msg: e.message!,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 20,
          color: Colors.black,
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            // width: double.infinity,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create your account, It's free",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 128,
                            width: 128,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: image != null
                                  ? Image.file(
                                      image!,
                                      width: 128,
                                      height: 128,
                                      fit: BoxFit.cover,
                                    )
                                  : Text(
                                      "Profile Picture",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 4,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: IconButton(
                                // onPressed: () {},
                                onPressed: selectFile,
                                icon: Icon(
                                  Icons.add_a_photo,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //User Name field
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                        prefixIcon: Icon(Icons.person_rounded),
                        labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xBDBDBDFF),
                        )),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xBDBDBDFF),
                        )),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter User Name!");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        usernameController.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //Email field
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xBDBDBDFF),
                          )),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xBDBDBDFF)))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                      height: 10,
                    ),

                    //password field
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: passController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xBDBDBDFF),
                          )),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xBDBDBDFF)))),
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Passwrod Required", timeInSecForIosWeb: 2);
                          return ("Passwrod Required");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Minimum it should be (6) Characters");
                        }
                      },
                      onSaved: (value) {
                        passController.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //Confirm Password field
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: conpassController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock),
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xBDBDBDFF),
                          )),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xBDBDBDFF)))),
                      validator: (value) {
                        if (conpassController.text != passController.text) {
                          return "Password doesn't match";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        passController.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //Phone Number Field
                    IntlPhoneField(
                      showCountryFlag: false,
                      showDropdownIcon: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone),
                        labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: idCardNumber,
                      decoration: const InputDecoration(
                        labelText: 'Parent ID card Number',
                        prefixIcon: Icon(Icons.person_rounded),
                        labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xBDBDBDFF),
                        )),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xBDBDBDFF),
                        )),
                      ),
                      maxLength: 10,
                      validator: (value) {
                        // RegExp regex = RegExp(r'^.{10,}$');
                        if (value!.isEmpty) {
                          return ("Please Enter Parents ID Card Number!");
                        }
                        // if(!RegExp("^[0-9]").hasMatch(value)){
                        //   return ("Please Enter Valid ID Card Number");
                        // }
                        // if(regex.hasMatch(value)){
                        //   return ("Please Enter Valid ID Card Number");
                        // }
                        // return null;
                      },
                      onSaved: (value) {
                        usernameController.text = value!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IntlPhoneField(
                      showCountryFlag: false,
                      showDropdownIcon: false,
                      textInputAction: TextInputAction.next,
                      controller: p_phone,
                      decoration: const InputDecoration(
                        labelText: 'Parents Phone Number',
                        prefixIcon: Icon(Icons.person_rounded),
                        labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                    ),
                  ],
                ),

                //Sign up Button
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    Signup(emailController.text, passController.text);
                  },
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: StadiumBorder(),
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//For Sign Up with Email and Password
  void Signup(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.messsage);
      });
    }
  }

  postDetailsToFirestore() async {
    //Calling our firestore
    //Calling our usermodel
    //Sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.userName = usernameController.text;
    userModel.userphone = phoneController.text;
    userModel.idCardNumber = idCardNumber.text;

    userModel.p_phone = p_phone.text;
    userModel.password = passController.text;

    SpinKitFadingCube(
      size: 50.0,
      itemBuilder: (context, index) {
        final colors = [
          Colors.redAccent,
          Colors.blue,
          Colors.green,
          Colors.indigoAccent
        ];
        final color = colors[index % colors.length];

        return DecoratedBox(
            decoration: BoxDecoration(
          color: color,
        ));
      },
    );

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfuly :) ");

    Navigator.pushReplacement(
      (context),
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
