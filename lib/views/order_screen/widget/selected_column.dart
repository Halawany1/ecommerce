import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:google_fonts/google_fonts.dart';

class BuildSelectedStatus extends StatelessWidget {
  const BuildSelectedStatus(
      {super.key, required this.isSelected, required this.text});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Column(
        children: [
          Text(
            text,
            style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: isSelected ? Colors.black : const Color(0xFF8F8F8F),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 6.h,
          ),
          if (isSelected)
            Container(
                width: 90.w,
                height: 5.h,
                decoration: BoxDecoration(
                    color: const Color(0xFF7ECA5B),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      topRight: Radius.circular(5.r),
                    )))
        ],
      ),
    );
  }
}
