import 'package:flutter/material.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/feature/authentication/data/login_data.dart';
import 'package:studio_lab/feature/authentication/presentation/sections/login_button.dart';
import 'package:studio_lab/feature/authentication/presentation/sections/login_decoration.dart';
import 'package:studio_lab/feature/home/presentation/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginData auth;

  @override
  void initState() {
    auth = LoginData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (auth.isSignedIn()) {
      return Home();
    } else {
      return WillPopScope(
        onWillPop: () async => false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
              colors: [
                WCColors.primary,
                WCColors.primaryShadeTwo,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    LoginDecoration(),
                    const SizedBox(height: 32),
                    LoginButton(auth: auth),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
