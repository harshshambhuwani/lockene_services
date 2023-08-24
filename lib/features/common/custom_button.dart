import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String ? text;
  final VoidCallback onTap;
  const CustomButton({Key? key, this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text!),
      style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50.0)),
    );
  }
}


// ,style: GoogleFonts.roboto(fontSize: fourteen,fontWeight: FontWeight.w500,color: Colors.white)
