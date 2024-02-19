import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moon_online_shop/const/bottom_navbar.dart';
import 'package:moon_online_shop/ui/screens/network_checker_screen/network_checker_screen.dart';
import 'package:moon_online_shop/ui/utils/color_pallate.dart';

class MoonOnlineShop extends StatelessWidget {
  const MoonOnlineShop({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moon Online Shop',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: appbarColor,
            toolbarHeight: 60,
          ),

          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            filled: true,
            suffixIconColor: const Color(0xff696969),
          ),
        ),
        home: BottomNavBar(),
      ),
      designSize: const Size(360, 800),
    );
  }
}
