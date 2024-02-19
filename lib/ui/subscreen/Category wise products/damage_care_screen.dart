import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/model/trending_product_model.dart';
import 'package:moon_online_shop/ui/subscreen/product_details_screen.dart';
import 'package:moon_online_shop/ui/utils/color_pallate.dart';
import 'package:moon_online_shop/ui/widgets/add_to_cart_button.dart';
class DamageCareScreen extends StatefulWidget {
  const DamageCareScreen({super.key});

  @override
  State<DamageCareScreen> createState() => _DamageCareScreenState();
}

class _DamageCareScreenState extends State<DamageCareScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 0.68),
          itemCount: trendingProductList.length,
          itemBuilder: (context, index) {
            return Container(
              padding:  EdgeInsets.symmetric(
                  horizontal: 4.w, vertical: 8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: cardColor,
                  border: Border.all(
                      color: borderColor),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.black12,
                        offset: Offset(0, 2)),
                  ]),
              child: Column(
                children: [
                  Expanded(
                      flex: 8,
                      child:
                      InkWell(
                        onTap: (){
                          Get.to(ProductDetailsScreen());
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(),));
                        },
                        child: Image.asset(

                            '${trendingProductList[index].img}'),
                      )),
                  const SizedBox(height: 8),
                  Expanded(
                    flex: 8,
                    child: Column(
                      // mainAxisAlignment:
                      // MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${trendingProductList[index].title}',
                          style: fontStyle(
                              6, Colors.black, FontWeight.w500),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '৳${trendingProductList[index].price}',
                          style: fontStyle(
                              6, Colors.black, FontWeight.w400),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w),
                              child:  Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.5.w),
                                    child: Icon(
                                      Icons.star,
                                      size: 11,
                                      color: Color(0xFFF6A151),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.5.w),
                                    child: Icon(
                                      Icons.star,
                                      size: 11,
                                      color: Color(0xFFF6A151),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.5.w),
                                    child: Icon(
                                      Icons.star,
                                      size: 11,
                                      color: Color(0xFFF6A151),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.5.w),
                                    child: Icon(
                                      Icons.star,
                                      size: 11,
                                      color: Color(0xFFF6A151),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.5.w),
                                    child: Icon(
                                      Icons.star,
                                      size: 11,
                                      color: Color(0xFFF6A151),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.h),
                        AddToCartButton(onTap: () {}),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
