import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:google_fonts/google_fonts.dart';

class BuildDefaultButton extends StatelessWidget {
  const BuildDefaultButton({super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.width,
    required this.onPress

  });
final String text;
final Color color;
final Color textColor;
final double width;
final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPress,
      elevation: 0,
      minWidth: width.w,
      height: 38.h,
      color:  color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(text,
        style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            color: textColor,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

