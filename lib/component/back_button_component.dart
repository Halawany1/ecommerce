import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:google_fonts/google_fonts.dart';
class BuildBackButton extends StatelessWidget {
  const BuildBackButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap,
      child: Container(
        height: 30.w,
        width: 30.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.white,
          border: Border.all(
              color: Colors.black.withOpacity(0.30)),
        ),
        child: const Icon(
          Icons.arrow_back,
          color: Color(0xFF7ECA5B),
        ),
      ),
    );
  }
}

