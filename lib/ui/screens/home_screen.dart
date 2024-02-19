import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_online_shop/const/custom_appbar.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/model/our_brands_model.dart';
import 'package:moon_online_shop/model/product_model.dart';
import 'package:moon_online_shop/model/review_model.dart';
import 'package:moon_online_shop/model/tips_model.dart';
import 'package:moon_online_shop/services/get_api.dart';
import 'package:moon_online_shop/ui/utils/image_assets.dart';
import 'package:moon_online_shop/ui/widgets/home/brand_section.dart';
import 'package:moon_online_shop/ui/widgets/home/care_section.dart';
import 'package:moon_online_shop/ui/widgets/home/home_category_section.dart';
import 'package:moon_online_shop/ui/widgets/home/need_section.dart';
import 'package:moon_online_shop/ui/widgets/home/sale_section.dart';
import 'package:moon_online_shop/ui/widgets/home/trending_product_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SliderPhoto> sliderPhotos = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchSliderPhotos();
  }

  Future<void> _fetchSliderPhotos() async {
    try {
      final photos = await SliderPhotoService.fetchSliderPhotos();
      setState(() {
        sliderPhotos = photos;
      });
    } catch (e) {
      print('Error fetching slider photos: $e');
      // Handle error
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      items: sliderPhotos.map((slider) {
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.black12,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Image.network(
                            slider.photo,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 180.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        pauseAutoPlayOnTouch: true,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                    if (sliderPhotos.isNotEmpty)
                      Positioned(
                        bottom: 3.0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            sliderPhotos.length,
                                (index) => Container(
                              width: 10.0,
                              height: 10.0,
                              margin: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 2.0,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == currentIndex
                                    ? Colors.blue // Active dot color
                                    : Colors.grey, // Inactive dot color
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Category',
                        style: fontStyle(20.sp, Colors.black, FontWeight.w500),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
// ---------------------------------------------------- Category Section -------------------------------------------------------
                      const HomeCategory(),
                      SizedBox(
                        height: 20.h,
                      ),
// ------------------------------------------------- Sale Section --------------------------------------------------
                      const SaleSection(),
                    ],
                  ),
                ),
//-----------------------------------------------Trending product section ------------------------------------------------
                Stack(
                  children: [
                    Image.asset(
                      ImageAssets.trendingProductPNG,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 16.w, right: 16.w, top: 155.h),
                      child: const TrendingProductSection(),
                    ),
                  ],
                ),

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.transparent,
                              )),
                          Text(
                            "Our Brand",
                            style:
                                fontStyle(20.sp, Colors.black, FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "View all",
                              style: fontStyle(
                                  10.sp, Colors.black, FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
//--------------------------------------------------Our  Brand section ---------------------------------------------------------
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.5),
                        itemCount: ourbrandList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            '${ourbrandList[index].img}',
                          );
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t Miss Out This Segment",
                              style: fontStyle(
                                  20.sp, Colors.black, FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      // ----------------------------------- Care Section-------------------------------------------
                      const CareSection(),

                      Padding(
                        padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "For Your Needs",
                              style: fontStyle(
                                  20.sp, Colors.black, FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
// --------------------------------------------- Need Section -----------------------------------------------
                      const NeedSection(),

                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Brand",
                              style: fontStyle(
                                  20.sp, Colors.black, FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
// --------------------------------------------- Brand --------------------------------------------------
                      BrandSection(),

                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Beauty Tips & Tricks",
                              style: fontStyle(
                                  14.sp, Colors.black, FontWeight.w500),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "View all",
                                style: fontStyle(
                                    10.sp, Colors.black, FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ---------------------------------------- beauty tips and tricks------------------------------------
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                childAspectRatio: 1.15),
                        itemCount: tipsList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            '${tipsList[index].img}',
                          );
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Customer Review",
                            style:
                                fontStyle(14.sp, Colors.black, FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "View all",
                              style: fontStyle(
                                  10.sp, Colors.black, FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
//------------------------------------- Customer Review -------------------------------------------------
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                childAspectRatio: 1.15),
                        itemCount: reviewList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            '${reviewList[index].img}',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
