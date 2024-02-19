import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:moon_online_shop/const/bottom_navbar.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/model/wishlist_model.dart';
import 'package:moon_online_shop/ui/utils/color_pallate.dart';

import 'package:moon_online_shop/ui/utils/image_assets.dart';
import 'package:moon_online_shop/ui/widgets/add_to_cart_button.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
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
          'Wishlist',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
          body: Padding(
    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.h),
    child: Column(
      children: [
        for (var index = 0; index < wishList.length; index++)
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            height: 73.h,
            width: 328.w,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffFFCED6)),
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 12.w, vertical: 11.h),
                  height: 50.h,
                  width: 67.5.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          '${wishList[index].img}',
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
                      '${wishList[index].title}',
                      style: fontStyle(8.sp, Colors.black, FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('৳ ${wishList[index].price}',
                        style:
                            fontStyle(8.sp, Colors.black, FontWeight.w500)),
                    SizedBox(
                      height: 5.h,
                    ),
                    AddToCartButton(onTap: () {}),
                    SizedBox(
                      height: 5.h,
                    ),

                  ],
                ),
                // SizedBox(
                //   width: 15.w,
                // ),
                Spacer(),
                InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: SvgPicture.asset(ImageAssets.deleteIconSVG),
                    )),

              ],
            ),
          ),


      ],
    ),
          ),
        );
  }
}
