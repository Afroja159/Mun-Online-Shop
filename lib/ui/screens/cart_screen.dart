import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:moon_online_shop/const/bottom_navbar.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/model/cart_model.dart';
import 'package:moon_online_shop/ui/subscreen/payment_method_screen.dart';
import 'package:moon_online_shop/ui/utils/color_pallate.dart';
import 'package:moon_online_shop/ui/utils/image_assets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        leading: IconButton(
          onPressed: () {
            Get.offAll(const BottomNavBar());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
          body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.h),
                child: Column(
                  children: [
            
                    for (var index = 0; index < cartList.length; index++)
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              height: 100.h,
              width: 328.w,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffFFCED6)),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 12.w, vertical: 11.h),
                    height: 68.h,
                    width: 67.5.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            '${cartList[index].img}',
                          ),
                          scale: 4.5,
                        ),
                        color: const Color(0xffFFCED6),
                        borderRadius: BorderRadius.circular(5.r)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${cartList[index].title}',
                        style: fontStyle(8.sp, Colors.black, FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text('৳ ${cartList[index].price}',
                          style:
                              fontStyle(8.sp, Colors.black, FontWeight.w500)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${cartList[index].subtitle}',
                        style: fontStyle(8.sp, Colors.black, FontWeight.w500),
                      ),
                      Row(children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          height: 20.h,
                          width: 67.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: borderColor, width: 1),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    if (cartList[index].quantity > 1) {
                                      cartList[index].quantity--;
                                      setState(() {});
                                    }
                                  },
                                  child:
                                  SvgPicture.asset(ImageAssets.minusIconSVG)),
                              Text(
                                '${cartList[index].quantity}pc',
                                style:
                                fontStyle(12.sp, Colors.black, FontWeight.w400),
                              ),
                              InkWell(
                                  onTap: () {
                                    cartList[index].quantity++;
                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(ImageAssets.plusIconSVG)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(ImageAssets.deleteIconSVG)),
                      ],)


                    ],
                  ),
            
            
                ],
              ),
            ),
                    SizedBox(
            height: 75.h,
                    ),
                    Column(
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
                          style: fontStyle(12.sp, const Color(0xff959090),
                              FontWeight.w400),
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
                          style: fontStyle(12.sp, const Color(0xff959090),
                              FontWeight.w400),
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
                          "৳ 1250.00",
                          style:
                              fontStyle(12.sp, primaryColor, FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
            
                // ----------------------------------------- Button --------------------------------------------
                    MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      minWidth: double.infinity,
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      onPressed: () {
                        Get.to(PaymentMethodScreen());
                      },
                      child: Text(
                        "Buy Now",
                        style:
                            fontStyle(14.sp, Colors.white, FontWeight.w400),
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
                  ],
                ),
            ),
          ),
        );
  }
}
