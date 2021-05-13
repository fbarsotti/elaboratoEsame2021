import 'package:flutter/material.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/core/utils/wc_profile.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Profile.user.displayName;
    return Container(
      height: 170,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Ciao $user,',
              style: TextStyle(
                color: WCColors.text,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Bentornato!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
