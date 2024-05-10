import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:google_fonts/google_fonts.dart';

class BuildCardProduct extends StatelessWidget {
  const BuildCardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        height: 122.h,
        padding: EdgeInsets.all(6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Container(
              width: 122.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            SizedBox(width: 5.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Name',
                  style: GoogleFonts.montserrat(fontSize:
                  14.sp,
                      fontWeight: FontWeight.w600),),
                SizedBox(height: 10.h,),
                SizedBox(
                  width: 165.w,
                  child: Text('Introducing our premium Modern Leather Sofa, designed to elevate your living space with unparalleled comfort and style. Crafted from high-quality, top-grain leather, this sofa exudes luxury and sophistication. Its sleek and minimalist design seamlessly blends with any contemporary decor, making it the perfect centerpiece for your living room.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: GoogleFonts.montserrat(fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF616A7D)
                    ),),
                ),
                SizedBox(height: 10.h,),
                Text('Price EGP',
                  style: GoogleFonts.montserrat(fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7ECA5B)
                  ),),
              ],)
          ],
        ),
      ),
    );
  }
}

