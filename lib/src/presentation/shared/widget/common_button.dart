import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double kheight;

  const CommonButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.kheight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kheight,
      
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: color,
            elevation: 0,
            
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
          child: Text(text,
              style: GoogleFonts.alegreyaSans(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ))),
    );
  }
}
