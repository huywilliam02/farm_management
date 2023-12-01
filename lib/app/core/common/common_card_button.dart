import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_constants.dart';

class CommonCardButton extends StatelessWidget {
  const CommonCardButton({
    super.key,
    required this.title,
    this.icon,
    required this.iconButton,
    this.onPressed,
  });
  final String title;
  final String iconButton;
  final Icon? icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 0.3,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              iconButton,
              height: 38,
              width: 38,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: GoogleFonts.roboto(
                textStyle: TextStyleConstant.grey16RobotoBold,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
