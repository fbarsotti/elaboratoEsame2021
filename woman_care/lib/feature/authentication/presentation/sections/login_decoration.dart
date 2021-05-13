import 'package:flutter/material.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';

class LoginDecoration extends StatelessWidget {
  const LoginDecoration({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: WCColors.extraLightText,
            child: CircleAvatar(
              radius: 54,
              backgroundColor: WCColors.primaryShadeTwo,
              child: Icon(
                Icons.self_improvement_rounded,
                color: WCColors.extraLightText,
                size: 70,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Woman Care',
            style: TextStyle(
              color: WCColors.extraLightText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
