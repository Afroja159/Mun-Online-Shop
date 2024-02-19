import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:moon_online_shop/const/bottom_navbar.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/model/account_model.dart';
import 'package:moon_online_shop/ui/subscreen/account/edit_profile_screen.dart';
import 'package:moon_online_shop/ui/subscreen/account/help_center_screen.dart';
import 'package:moon_online_shop/ui/subscreen/account/my_order_screen.dart';
import 'package:moon_online_shop/ui/subscreen/account/notification_screen.dart';
import 'package:moon_online_shop/ui/subscreen/account/setting_screen.dart';
import 'package:moon_online_shop/ui/subscreen/account/shipping_address_screen.dart';
import 'package:moon_online_shop/ui/subscreen/account/wishlist_screen.dart';
import 'package:moon_online_shop/ui/utils/color_pallate.dart';
import 'package:moon_online_shop/ui/utils/image_assets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffFFCED6),
                    )),
                child: CircleAvatar(
                  backgroundImage: AssetImage(ImageAssets.profilePNG),
                  radius: 30.r,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Mst.Rumi Aktar',
                style: fontStyle(14.sp, Colors.black, FontWeight.w400),
              ),
              Text(
                'rumi@gmail.com',
                style: fontStyle(
                    10.sp, const Color(0xff666666), FontWeight.w400),
              ),
              SizedBox(height: 20.h),
              for (var index = 0; index < myAccount.length; index++)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: SizedBox(
                    height: 17.h,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          '${myAccount[index].img1}',
                        ),
                        SizedBox(width: 15.w),
                        InkWell(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.to(EditProfileScreen());
                                break;
                              case 1:
                                Get.to(WishlistScreen());
                                break;
                              case 2:
                                Get.to(MyOrderScreen());
                                break;
                              case 3:
                                Get.to(ShippingAddressScreen());
                                break;
                              case 4:
                                Get.to(NotificationScreen());
                                break;
                              case 5:
                                Get.to(HelpCenterScreen());
                                break;

                              default:
                                Get.to(SettingScreen());
                            }
                          },
                          child: Text("${myAccount[index].title}",
                              style: fontStyle(
                                  12.sp, Colors.black, FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.logoutIconSVG),
                      SizedBox(width: 15.w),
                      Text(
                        "Log Out",
                        style: fontStyle(
                            12.sp, const Color(0xffE40404), FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
