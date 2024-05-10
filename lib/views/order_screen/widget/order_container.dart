import 'package:ecommerce/views/order_screen/widget/button.dart';
import 'package:ecommerce/views/order_screen/widget/cancel_order.dart';
import 'package:ecommerce/views/track_order_screen/track_order_screen.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:google_fonts/google_fonts.dart';

List<String> orderStatus = [
  'order placed',
  'In Progress',
  'shipped',
  'Delivered',
  'Cancelled',
];

class BuildCardOrder extends StatelessWidget {
  const BuildCardOrder({
    super.key,
    required this.indexStatus,
  });

  final int indexStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              color: indexStatus == 0
                  ? const Color(0xFFFFFAEF)
                  : indexStatus == 1
                      ? const Color(0xFFEBF2FB)
                      : indexStatus == 2
                          ? const Color(0xFFB4FAA9)
                          : indexStatus == 3
                              ? const Color(0xFFE6F7F0)
                              : const Color(0xFFF7E6E6),
            ),
            child: Text(
              orderStatus[indexStatus],
              style: GoogleFonts.montserrat(
                  fontSize: 11.sp,
                  color: indexStatus == 0
                      ? const Color(0xFFFCBB43)
                      : indexStatus == 1
                          ? const Color(0xFF4891F9)
                          : indexStatus == 2
                              ? const Color(0xFF00A75C)
                              : indexStatus == 3
                                  ? const Color(0xFF00A75C)
                                  : const Color(0xFFE35663),
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction ID',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    color: Color(0xFF8F8F8F),
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Order Date',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    color: Color(0xFF8F8F8F),
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Total Payment',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    color: Color(0xFF8F8F8F),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction ID',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Order Date',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Total Payment',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: indexStatus == 2 || indexStatus == 4
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              if (indexStatus != 2 && indexStatus != 4)
                BuildDefaultButton(
                  text: indexStatus == 3 ? 'Leave Review' : 'Cancel',
                  color: Color(0xFFF6F6F6),
                  textColor:
                      indexStatus == 3 ? Color(0xFF7ECA5B) : Color(0xFFFF3C3C),
                  width: 125.w,
                  onPress: () {
                    if(indexStatus!=3){
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          return BuildCancelOrderSheet();
                        },
                      );
                    }

                  },
                ),
              BuildDefaultButton(
                text: indexStatus == 3 || indexStatus == 4
                    ? 'Re-Order'
                    : 'Track Order',
                color: Color(0xFF7ECA5B),
                textColor: Colors.white,
                width: indexStatus == 2 || indexStatus == 4 ? 250.w : 125.w,
                onPress: () {
                  if(indexStatus!=3&&indexStatus!=4){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500), // Adjust the duration as needed
                        pageBuilder: (context, animation,
                            secondaryAnimation) =>
                            TrackOrderScreen(selectStatus: indexStatus,),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0); // Start off-screen to the right
                          const end = Offset.zero; // Slide in from the left
                          const curve = Curves.easeInOut; // Animation curve

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                          // Apply the offset transform to the child's position during animation
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
