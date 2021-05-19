import 'package:flutter/material.dart';

class WCLoadingView extends StatelessWidget {
  const WCLoadingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
