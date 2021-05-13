import 'package:flutter/material.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/feature/authentication/data/login_data.dart';
import 'package:studio_lab/feature/home/presentation/home.dart';

class LoginButton extends StatelessWidget {
  LoginData auth;
  LoginButton({@required this.auth, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(WCColors.extraLightText),
      ),
      onPressed: () {
        print(auth.toString());
        auth.signInWithGoogle().then(
              (result) => result != null
                  ? Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    )
                  : print('Failed!!!'),
            );
      },
      child: Container(
        height: 50,
        width: 150,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Log In',
                style: TextStyle(color: WCColors.primary),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios,
                color: WCColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
