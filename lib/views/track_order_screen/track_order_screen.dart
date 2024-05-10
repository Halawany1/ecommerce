import 'package:ecommerce/component/back_button_component.dart';
import 'package:ecommerce/views/order_screen/order_screen.dart';
import 'package:ecommerce/views/track_order_screen/widget/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:another_stepper/another_stepper.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key, required this.selectStatus});
  final int selectStatus;
  @override
  Widget build(BuildContext context) {
    List<StepperData> stepperData = [
      StepperData(
          title: StepperText(
              "Order Placed",
              textStyle: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              )
          ),
          subtitle: StepperText("Date, Clock Time"),
          iconWidget: Container(
            padding: EdgeInsets.all(5.h),
            decoration:  BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Icon(
              Icons.list_alt,
              color: Colors.white,
            ),
          )),
      StepperData(
          title:
          StepperText("In progress",
              textStyle: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              )),
          subtitle: StepperText("Date, Clock Time"),
          iconWidget: Container(
            padding: EdgeInsets.all(5.h),
            decoration:  BoxDecoration(
                color:Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Icon(
              CupertinoIcons.refresh,
              color: Colors.white,
            ),
          )),
      StepperData(
          title: StepperText("Shipped",
              textStyle: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              )),
          subtitle: StepperText("Date, Clock Time"),
          iconWidget: Container(
            padding: EdgeInsets.all(5.h),
            decoration:  BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Icon(
              CupertinoIcons.car,
              color: Colors.white,
            ),
          )),
      StepperData(
          title: StepperText("Delivered", textStyle: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          )),
          subtitle: StepperText("Date, Clock Time"),
          iconWidget: Container(
            padding: EdgeInsets.all(5.h),
            decoration:  BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Icon(
              CupertinoIcons.check_mark_circled,
              color: Colors.white,
            ),
          )),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Track Order',
          style: GoogleFonts.montserrat(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        leading: Padding(
          padding: EdgeInsets.all(8.h),
          child: BuildBackButton(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #OrderNum',
                style: GoogleFonts.montserrat(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 12.h,
              ),
              AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                verticalGap: 20.h,
                iconWidth: 38.w,
                // Height that will be applied to all the stepper icons
                iconHeight:
                38.w, // Width that will be applied to all the stepper icons
              ),
              SizedBox(height: 12.h,),
              const Divider(),
              SizedBox(height: 12.h,),
              Text('Products',
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )
              ),
              SizedBox(height: 10.h,),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => BuildCardProduct(),
                  separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                  itemCount: 5)
            ],
          ),
        ),
      ),
    );
  }
}
