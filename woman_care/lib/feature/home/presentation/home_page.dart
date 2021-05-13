import 'package:flutter/material.dart';
import 'package:studio_lab/feature/home/presentation/sections/home_buttons.dart';
import 'package:studio_lab/feature/home/presentation/sections/home_card.dart';
import 'package:studio_lab/feature/home/presentation/sections/home_header.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: ListView(
              children: [
                HomeCard(),
                HomeButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
