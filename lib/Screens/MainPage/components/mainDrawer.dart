import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/constants.dart';

class mainDrawer extends StatelessWidget {
  const mainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('images/male.png'),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    Text('Mansoor Ahmad',style: TextStyle(fontSize: 24, color: Colors.white),),
                    Text('mansoorahmad@yahoo.com',style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: null,
              //onTap: (){
              // Navigator.of(context).pop();
              // Navigator.of(context).pushNamed(PageName.routeName); }
            ),
            SizedBox(height: 10,),
            Divider(thickness: 1, height: 10, color: kPrimaryLightColor,),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );              },
            ),
          ],
        ),
      ),
    );
  }
}
