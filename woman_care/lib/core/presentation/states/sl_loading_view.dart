import 'package:flutter/material.dart';

class SLLoadingView extends StatelessWidget {
  const SLLoadingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
