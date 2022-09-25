import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mansoor/user_model.dart';
import 'package:mansoor/User_Profile/user_profile.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController usernameController = new TextEditingController(
    text: Profile.userFirstName,
  );
  TextEditingController emailController = new TextEditingController(
    text: Profile.userEmail,
  );
  TextEditingController phoneController = new TextEditingController(
    text: Profile.userPhone,
  );
  TextEditingController idCardNumController = new TextEditingController(
    text: Profile.userPIDCard,
  );

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: BackButton(),
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text("Profile Edit"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 128,
            width: 128,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
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
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Image.file(
                                image!,
                                width: 128,
                                height: 128,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Text(
                              "Change Profile",
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
          ),
          SizedBox(
            height: 30,
          ),
          Form(
            key: _formkey,
            child: Container(
              height: 400,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                // color: Color(0xFF46B3E6),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38.withOpacity(0.7),
                    // color: Color(0xFF62D2A2).withOpacity(0.8),
                    blurRadius: 15,
                    spreadRadius: 8,
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Student Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextFormField(
                      // initialValue: Profile.userFirstName,
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          "Please enter userName";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Student Email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextFormField(
                      // initialValue: Profile.userEmail,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Email");
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter Valid Email");
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextFormField(
                      // initialValue: Profile.userPhone,
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Parents ID card",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextFormField(
                      // initialValue: Profile.userPIDCard,
                      controller: idCardNumController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          "Can't be Null Please Provide";
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (controll) => AlertDialog(
                      title: Text(
                        "Alert Box\n\nAre you sure you want to cancel?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(controll).pop();
                          },
                          child: Text(
                            "No",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(controll).pop();
                            Navigator.of(context).pop();
                            // Navigator.of(controll).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => Profile(),
                            //   ),
                            // );
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: UpdateData,
                  // onPressed: () {
                  //     .where({
                  //   'userName',
                  //   'email',
                  //   'idCardNumber',
                  //   'userphone'
                  // }, isEqualTo: {
                  //   Profile.userFirstName,
                  //   Profile.userEmail,
                  //   Profile.userPIDCard,
                  //   Profile.userPhone
                  // });
                  // },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      "Update",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  UpdateData() async {
    if (_formkey.currentState!.validate()) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = auth.currentUser;
      UserModel userModel = UserModel();

      userModel.email = user!.email;
      userModel.uid = user.uid;
      userModel.userName = usernameController.text;
      userModel.userphone = phoneController.text;
      userModel.idCardNumber = idCardNumController.text;

      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update(
            {
              'userName': userModel.userName,
              'email': userModel.email,
              'userPhone': userModel.userphone,
              'idCardNumber': userModel.idCardNumber,
            },
          )
          .then(
            (value) => {
              Fluttertoast.showToast(msg: "Profile Updated Successfully!"),
              Navigator.of(context).pop(),
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              ),
            },
          )
          .catchError(
            (e) {
              Fluttertoast.showToast(msg: e!.message);
            },
          );
    }
  }
}
