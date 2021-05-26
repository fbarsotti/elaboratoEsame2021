import 'package:flutter/material.dart';
import 'package:studio_lab/core/presentation/customization/generic_title.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/core/presentation/customization/generic_header.dart';
import 'package:studio_lab/feature/options/pages/options_account_page.dart';

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
      body: Column(
        children: [
          GenericHeader(text: 'Opzioni'),
          Expanded(
            child: ListView(
              children: [
                GenericTitle(text: 'Generali'),
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
        ],
      ),
    );
  }
}
