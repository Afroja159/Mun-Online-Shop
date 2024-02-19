import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/ui/utils/color_pallate.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddToCartButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5.r),
      child: Container(
        height: 23.h,
        width: 88.w,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(
          child: Text(
            'Add to Cart',
            style: fontStyle(
              10,
              Colors.white,
              FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}