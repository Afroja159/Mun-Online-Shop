import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/ui/utils/image_assets.dart';


class PageBar extends StatelessWidget {
  final String barTitle;
  const PageBar({
    super.key,
    required this.barTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){},
            child: SvgPicture.asset(
              ImageAssets.backButtonIconSVG,
              height: 15.h,
              width: 10.w,
            ),
          ),
          Text(
            barTitle,
            style: fontStyle(16, Colors.black, FontWeight.w500),
          ),
          InkWell(
            onTap: (){},
            child: SvgPicture.asset(
              ImageAssets.forwardButtonIconSVG,
              height: 15.h,
              width: 10.w,
            ),
          ),
        ],
      ),
    );
  }
}
