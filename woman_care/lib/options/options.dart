import 'package:flutter/material.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/options/pages/options_account_page.dart';

class OptionsPage extends StatefulWidget {
  OptionsPage({
    Key key,
  }) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          'Opzioni',
          style: TextStyle(
            color: WCColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: WCColors.extraLightText,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Generali',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle_rounded,
                color: WCColors.text,
              ),
              title: Text(
                'Account',
                style: TextStyle(
                  color: WCColors.text,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AccountPage();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
