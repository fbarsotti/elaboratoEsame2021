import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:studio_lab/feature/home/presentation/home_page.dart';
import 'package:studio_lab/feature/options/options.dart';
import 'package:studio_lab/feature/statistics/presentation/statistics_page.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    StatisticsPage(),
    OptionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: IndexedStack(
          children: _children,
          index: _currentIndex,
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: 'Home'),
            TabData(iconData: Icons.data_usage, title: 'Statistiche'),
            TabData(iconData: Icons.settings, title: 'Impostazioni'),
          ],
          onTabChangedListener: (position) {
            setState(() {
              _currentIndex = position;
            });
          },
        ),
      ),
    );
  }
}
