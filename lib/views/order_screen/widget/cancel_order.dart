import 'package:ecommerce/views/order_screen/order_screen.dart';
import 'package:ecommerce/views/order_screen/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:google_fonts/google_fonts.dart';

List<String>cancelReasons=[
  'Changed my mind',
  'Incorrect Product',
  'Product Unavailability',
  'Delivery TimeFrame Concerns',
  'Price Discrepancies',
  'Quality Concerns',
];
class BuildCancelOrderSheet extends StatefulWidget {
  const BuildCancelOrderSheet({super.key});

  @override
  State<BuildCancelOrderSheet> createState() => _BuildCancelOrderSheetState();
}

class _BuildCancelOrderSheetState extends State<BuildCancelOrderSheet> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          Container(
            width: 90.w,
            height: 3.h,
            color: Color(0xFFE8E8E8),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text('Cancel Order',
              style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.start,
            children: [
              Text(
                'Reason:',
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  ListTileTheme(
                    contentPadding:
                    EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    dense: true,
                    child: RadioListTile(
                      value: true,
                      groupValue: false,
                      dense: true,
                      controlAffinity:
                      ListTileControlAffinity
                          .leading,
                      contentPadding:
                      EdgeInsets.zero,
                      title: Text(
                        cancelReasons[index],
                        style: GoogleFonts
                            .montserrat(
                            fontSize: 12.sp,
                            fontWeight:
                            FontWeight
                                .w500),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
              separatorBuilder: (context,
                  index) =>SizedBox(height: 2.h,)
              ,
              itemCount: cancelReasons.length),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [

              BuildDefaultButton(
                text: 'Back',
                color: Color(0xFFF6F6F6),
                textColor: Color(0xFF7ECA5B),
                width: 125.w,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              BuildDefaultButton(
                text: 'Cancel',
                color: Color(0xFF7ECA5B),
                textColor: Colors.white,
                width: 125.w,
                onPress: () {
                  Navigator.pop(context);
                  showModalBottomSheet(context: context,
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          height: 300.h,
                          child: Padding(
                            padding:  EdgeInsets.all(18.h),
                            child: Column(children: [
                              Icon(CupertinoIcons.check_mark_circled,size: 100.h,
                              color: Color(0xFF7ECA5B),),
                              SizedBox(height: 20.h,),
                              Text(
                                textAlign: TextAlign.center,
                                'Order Cancelled\n Successfully',
                                style: GoogleFonts.montserrat(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600
                                ),),
                              SizedBox(height: 20.h,),
                              BuildDefaultButton(
                                text: 'Continue',
                                color: Color(0xFF7ECA5B),
                                textColor: Colors.white,
                                width: double.infinity,
                                onPress: () {
                                  Navigator.pop(context);

                                },
                              ),
                            ],),
                          ),
                        );
                      },);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
