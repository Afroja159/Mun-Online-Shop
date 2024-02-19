import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/ui/utils/image_assets.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              ImageAssets.moononlineshopLogoPNG,
              width: 58.w,
            ),
            SizedBox(
              height: 23.h,
              width: 146.w,
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      size: 15,
                    ),
                    hintText: "Search Products",
                    hintStyle:
                        fontStyle(10, Color(0xff696969), FontWeight.w400),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 15)),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  ImageAssets.notificationIconPNG,

                  width: 16.w,
                ),
                SizedBox(width: 10.w,),
                Image.asset(
                  ImageAssets.liveIconPNG,

                  width: 16.w,
                ),
              ],
            )
          ],
        ),
      ),


    );
  }
}
