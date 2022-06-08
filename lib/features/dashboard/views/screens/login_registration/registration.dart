import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:placement_reminders/config/themes/app_theme.dart';

import 'login.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  late final User user;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email = "";
  String password = "";
  String branch = "";
  String year = "";
  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 260,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: MyThemes.blueColor,
                gradient: LinearGradient(
                  colors: [(new Color(0xff30AAB0)), new Color(0xff4FC8CF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 180,
                      width: 180,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  )
                ],
              )),
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                cursorColor: MyThemes.blueColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: MyThemes.blueColor,
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                cursorColor: MyThemes.blueColor,
                decoration: InputDecoration(
                  focusColor: MyThemes.blueColor,
                  icon: Icon(
                    Icons.vpn_key,
                    color: MyThemes.blueColor,
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => null, //_showSingleChoiceDialog(context),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffEEEEEE),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 100,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    branch = value;
                  },
                  cursorColor: MyThemes.blueColor,
                  decoration: InputDecoration(
                    focusColor: MyThemes.blueColor,
                    icon: FaIcon(
                      FontAwesomeIcons.codeBranch,
                      color: MyThemes.blueColor,
                    ),
                    hintText: "Select Branch",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => null, //_showSingleChoiceDialog(context),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffEEEEEE),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 100,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    year = value;
                  },
                  cursorColor: MyThemes.blueColor,
                  decoration: InputDecoration(
                    focusColor: MyThemes.blueColor,
                    icon: FaIcon(
                      FontAwesomeIcons.codeBranch,
                      color: MyThemes.blueColor,
                    ),
                    hintText: "Select Year",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),

            //BUTTON
            InkWell(
              onTap: () async {
                try {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  )
                      .then((value) {
                    FirebaseFirestore.instance.collection('users').add({
                      "email": email,
                      "password": password,
                      "branch": branch,
                      "year": year,
                    });
                  });
                } on FirebaseAuthException catch (e) {
                  print('User Registration FAILED');
                  print(e.message);
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 17),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [(new Color(0xff30AAB0)), new Color(0xff4FC8CF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Registered?  "),
                  GestureDetector(
                    child: Text(
                      "Login Now",
                      style: TextStyle(color: MyThemes.blueColor),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
