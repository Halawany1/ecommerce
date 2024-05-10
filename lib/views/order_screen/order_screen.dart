
import 'package:ecommerce/component/back_button_component.dart';
import 'package:ecommerce/views/order_screen/widget/order_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:google_fonts/google_fonts.dart';

import 'widget/selected_column.dart';

int selectedStatus = 0;

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFf3f5f8),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       BuildBackButton(onTap: () {

                       },),
                        Text(
                          'My Orders',
                          style: GoogleFonts.roboto(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        Container(width: 28.w,)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedStatus = 0;
                            });
                          },
                          child: BuildSelectedStatus(
                            text: 'Active',
                            isSelected: selectedStatus == 0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedStatus = 1;
                            });
                          },
                          child: BuildSelectedStatus(
                            text: 'Completed',
                            isSelected: selectedStatus == 1,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedStatus = 2;
                            });
                          },
                          child: BuildSelectedStatus(
                            text: 'Cancelled',
                            isSelected: selectedStatus == 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (selectedStatus == 0)
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(12.h),
                          child: BuildCardOrder(
                            indexStatus: index,
                          ),
                        ),
                    itemCount: 3),
              ),

            if (selectedStatus == 1)
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(12.h),
                      child: BuildCardOrder(
                        indexStatus: 3,
                      ),
                    ),
                    itemCount: 3),
              ),
            if (selectedStatus == 2)
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(12.h),
                      child: BuildCardOrder(
                        indexStatus: 4,
                      ),
                    ),
                    itemCount: 3),
              ),
          ],
        ),
      ),
    );
  }
}
