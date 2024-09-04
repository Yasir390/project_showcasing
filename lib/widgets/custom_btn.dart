import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final List<Color> colors;
  final String btnName;
  const CustomButton({super.key, required this.onTap, required this.colors, required this.btnName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(),
          shape: BoxShape.rectangle,
          gradient:  LinearGradient(
            colors:colors,// [Colors.tealAccent, Colors.redAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            btnName,
            style: GoogleFonts.aBeeZee().copyWith(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
