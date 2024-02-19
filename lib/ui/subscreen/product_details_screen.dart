import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/ui/screens/cart_screen.dart';
import 'package:moon_online_shop/ui/utils/color_pallate.dart';
import 'package:moon_online_shop/ui/utils/image_assets.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 25.h,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          ImageAssets.backButtonIconSVG,
                          height: 15.h,
                          width: 10.w,
                        ),
                      ),
                      Text(
                        "Product Details",
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
                    height: 50.h,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 355.w,
                          height: 246.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                                width: 1, color: primaryColor),
                            // color: const Color(
                            //     0xfff1f1f1)
                          ), // Background color of the container
                          child: Center(
                            // Image in the middle of the container
                            child: Image.asset(
                              ImageAssets
                                  .creamPNG, // Replace with your image path
                              width: 139.w,
                              height: 167.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10, // Adjust the top position as needed
                          right: 10, // Adjust the left position as needed
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isFavourite = !isFavourite;
                              });
                            },
                            icon: Icon(
                              isFavourite ? Icons.favorite : Icons.favorite_border,
                              color: isFavourite ? const Color(0xffE40404) : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Baby Pink Day Cream",
                            style: fontStyle(16.sp, Colors.black, FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w),
                            child: Row(
                              children: [
                                Text('Rating', style: fontStyle(12, Color(0xff959090), FontWeight.w400),),
                                SizedBox(width: 6.w,),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.5.w),
                                  child: const Icon(
                                    Icons.star,
                                    size: 11,
                                    color: Color(0xFFF6A151),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.5.w),
                                  child: const Icon(
                                    Icons.star,
                                    size: 11,
                                    color: Color(0xFFF6A151),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.5.w),
                                  child: const Icon(
                                    Icons.star,
                                    size: 11,
                                    color: Color(0xFFF6A151),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.5.w),
                                  child: const Icon(
                                    Icons.star,
                                    size: 11,
                                    color: Color(0xFFF6A151),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0.5.w),
                                  child: const Icon(
                                    Icons.star,
                                    size: 11,
                                    color: Color(0xFFF6A151),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Text(
                          //   "Common Medicine",
                          //   style:
                          //   fontStyle(12.sp, const Color(0xff555555), FontWeight.w400),
                          // ),
                        ],
                      ),
                      Text(
                        "10ml",
                        style: fontStyle(12.sp, const Color(0xff444444), FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Quantity",
                        style: fontStyle(16.sp, Colors.black, FontWeight.w500),
                      ),
                      //const SizedBox(width: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        height: 19.h,
                        width: 67.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 1),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(ImageAssets.minusIconSVG)),
                            Text(
                              "1 pc",
                              style: fontStyle(8.sp, Colors.black, FontWeight.w400),
                            ),
                            InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(ImageAssets.plusIconSVG)),
                          ],
                        ),
                      ),
                      Text(
                        "৳ 1250.00",
                        style: fontStyle(15.sp, Colors.black, FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Details",
                        style: fontStyle(16.sp, Colors.black, FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              height: 1.8,
                              wordSpacing: 2 // Start with black color
                          ),
                          children: [
                            const TextSpan(
                              text:
                              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters as",
                            ),
                            TextSpan(
                              text:
                              " opposed to using 'Content here, content here', making it look like readable English.Many desktop publishing packages and web page content here or more editors.now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose.",
                              style: TextStyle(
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Colors.black,
                                      Colors.grey,
                                    ],
                                  ).createShader(Rect.fromLTWH(0.0, 0.0, 1.0, 1.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
//-------------------------------------------------- Button --------------------------------------------------------------

                  MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    minWidth: 328.w,
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ));
                    },
                    child: Text(
                      "Add to Cart",
                      style: fontStyle(12.sp, Colors.white, FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
