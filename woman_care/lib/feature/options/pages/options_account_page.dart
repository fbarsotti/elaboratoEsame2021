import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/core/utils/wc_profile.dart';
import 'package:studio_lab/feature/authentication/data/login_data.dart';
import 'package:studio_lab/feature/authentication/presentation/login_page.dart';

class AccountPage extends StatefulWidget {
  AccountPage({
    Key key,
  }) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: WCColors.extraLightText,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(Profile.user.photoURL),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              Profile.user.displayName,
              style: TextStyle(
                fontSize: 24,
                color: WCColors.text,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              height: 1,
              color: WCColors.text,
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(right: 32, left: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'La tua email:',
                      style: TextStyle(
                        color: WCColors.text,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      Profile.user.email,
                      style: TextStyle(
                        color: WCColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text(
          'Log Out',
          style: TextStyle(color: WCColors.extraLightText),
        ),
        onPressed: () {
          _showDialog();
        },
      ),
    );
  }

  void _showDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Sei sicuro di voler uscire da questo account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                LoginData auth = LoginData();
                auth.signOutGoogle().then(
                  (value) async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              child: Text('Sì'),
            ),
          ],
        );
      },
    );
  }
}
