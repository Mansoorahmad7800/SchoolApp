import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mansoor/AboutUs/about_us.dart';
import 'package:mansoor/Parents/password_change.dart';
import 'package:mansoor/Parents/process_page.dart';
import 'package:mansoor/Login&_SignUp/loginPage.dart';
import 'package:mansoor/User_Profile/user_profile.dart';
import 'package:mansoor/user_model.dart';

class DrawerforParent extends StatefulWidget {
  @override
  State<DrawerforParent> createState() => _DrawerforParentState();
}

class _DrawerforParentState extends State<DrawerforParent> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 160, 1),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            buildHeader(
              name: "${loggedInUser.userName}",
              email: "${loggedInUser.email}",
            ),
            Divider(
              thickness: 2,
              color: Colors.white70,
            ),
            SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.person,
              onClicked: () => SelectedItem(context, 0),
            ),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'Progress',
              icon: Icons.show_chart,
              onClicked: () => SelectedItem(context, 1),
            ),
            const SizedBox(
              height: 5,
            ),
            // buildMenuItem(
            //   text: 'Change Password',
            //   icon: Icons.lock,
            //   onClicked: () => SelectedItem(context, 2),
            // ),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'About us',
              icon: Icons.info,
              onClicked: () => SelectedItem(context, 2),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Divider(
              thickness: 2,
              color: Colors.white70,
            ),
            SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'LogOut',
              icon: Icons.logout,
              onClicked: () => showDialog(
                context: context,
                builder: (cntx) => AlertDialog(
                  title: Column(
                    children: [
                      const Text(
                        "LogOut\n\nAre you sure you want to log out ?",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.warning,
                            size: 30,
                            color: Colors.yellow,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "If you logout you will lose your data",
                                maxLines: 3,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(cntx).pop();
                      },
                      child: const Text(
                        "No",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(cntx).pop();
                        SelectedItem(context, 4);
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                          fontSize: 20,
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
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void SelectedItem(BuildContext context, int index) async {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        // Fluttertoast.showToast(msg: "Coming Soon!!!",timeInSecForIosWeb: 3);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Profile(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProcessPage(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AboutUs(),
          ),
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const PasswordChange(),
        //   ),
        // );
        break;

      case 3:
        Navigator.of(context).pop();
        await FirebaseAuth.instance.signOut();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
    }
  }

  buildHeader({required String name, required String email}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Stack(
          children: [
            Positioned(
              // left: 0,
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage('assets/p2.jpeg'), fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Positioned(
              top: 5,
              left: 85,
              right: 0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      email,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
