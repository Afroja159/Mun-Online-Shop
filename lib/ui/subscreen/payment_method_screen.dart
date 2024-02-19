import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/ui/screens/cart_screen.dart';
import 'package:moon_online_shop/ui/utils/color_pallate.dart';
import 'package:moon_online_shop/ui/utils/image_assets.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 16.w),
          child: Column(children: [
            // SizedBox(
            //   height: 25.h,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.off(CartScreen());

                  },
                  child: SvgPicture.asset(
                    ImageAssets.backButtonIconSVG,
                    height: 15.h,
                    width: 10.w,
                  ),
                ),
                Text(
                  "Payment Method",
                  style: fontStyle(16.sp, Colors.black, FontWeight.w500),
                ),
                InkWell(
                  child: SvgPicture.asset(
                    ImageAssets.forwardButtonIconSVG,
                    height: 15.h,
                    width: 10.w,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 40.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Payment Method",
                  style: fontStyle(14.sp, Colors.black, FontWeight.w500),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(

                  height: 48.h,
                  width: 328.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: borderColor),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 5.h, horizontal: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cash on Delivery",
                          style: fontStyle(13.sp, Colors.black, FontWeight.w500),
                        ),
                        Radio(
                          value: 1,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          activeColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15.h,
                ),

                Container(
                  height: 48.h,
                  width: 328.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: borderColor),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 5.h, horizontal: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Online Payment",
                          style: fontStyle(13.sp, Colors.black, FontWeight.w500),
                        ),
                        Radio(
                          value: 2,
                          groupValue: selectedValue,

                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          activeColor: primaryColor,

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal:",
                            style: fontStyle(
                                12.sp, const Color(0xff959090), FontWeight.w400),
                          ),
                          Text(
                            "৳ 1250.00",
                            style:
                            fontStyle(12.sp, Colors.black, FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount:",
                            style: fontStyle(
                                12.sp, const Color(0xff959090), FontWeight.w400),
                          ),
                          Text(
                            "৳ 00.00",
                            style:
                            fontStyle(12.sp, Colors.black, FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total:",
                            style:
                            fontStyle(12.sp, primaryColor, FontWeight.w400),
                          ),
                          Text(
                            "৳ 700.00",
                            style:
                            fontStyle(12.sp,primaryColor, FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),

// ----------------------------------------- Button --------------------------------------------
                      MaterialButton(
                        padding:  EdgeInsets.symmetric(vertical: 16.h),
                        minWidth: double.infinity,
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Confirm",
                          style: fontStyle(14.sp, Colors.white, FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ]),
        ),
      ),
    );
  }
}