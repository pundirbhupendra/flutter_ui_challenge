import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppIconButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double kheight;
  final Widget icon;

  const AppIconButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.kheight,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kheight,
      child: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: color,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
          icon: icon,
          label: Text(text,
              style: GoogleFonts.alegreyaSans(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ))),
    );
  }
}
