import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Image.asset(
                "assets/images/man.png",
                //fit: BoxFit.fill,
                height: 200,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Welcome: $name",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  //username
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "username",
                      labelStyle: TextStyle(color: Colors.blue),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  //password
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.blue),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Password lenght should be atleast 6";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //login button
                  Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 60 : 110,
                        height: 35,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 195.0,
                  ),
                  "Developed By SK"
                      .text
                      .black
                      .underline
                      .italic
                      .blue900
                      .bold
                      .wordSpacing(1)
                      .letterSpacing(1)
                      .make()
                      .objectBottomRight()
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
