import 'package:flutter/material.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';

class GenericHeader extends StatelessWidget {
  final String text;

  const GenericHeader({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: WCColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
