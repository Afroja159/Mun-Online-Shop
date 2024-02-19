import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fancy_bottom_navigation_plus/fancy_bottom_navigation_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/ui/screens/account_screen.dart';
import 'package:moon_online_shop/ui/screens/cart_screen.dart';
import 'package:moon_online_shop/ui/screens/category_screen.dart';
import 'package:moon_online_shop/ui/screens/home_screen.dart';
import 'package:moon_online_shop/ui/screens/wishlist_screen.dart';
import 'package:moon_online_shop/ui/utils/color_pallate.dart';
import 'package:moon_online_shop/ui/utils/image_assets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List items = [
    const HomeScreen(),
    const CategoryScreen(),
    const WishlistScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  int currentIndex = 0;

  // late StreamSubscription subscription;
  // bool isDeviceConnected = false;
  // bool isAlertSet = false;
  //
  // getConnectivity() => subscription = Connectivity()
  //         .onConnectivityChanged
  //         .listen((ConnectivityResult result) async {
  //       isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //       if (!isDeviceConnected && isAlertSet == false) {
  //         showDialogBox();
  //         setState(() {
  //           isAlertSet = true;
  //         });
  //       }
  //     });
  //
  // showDialogBox() => showCupertinoDialog(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoAlertDialog(
  //           title: Text('No Connection'),
  //           content: Text('Please check your internet connectivity'),
  //           actions: [
  //             TextButton(
  //               onPressed: () async {
  //                 Navigator.pop(context, 'Cancel');
  //                 setState(() {
  //                   isAlertSet = false;
  //                 });
  //                 isDeviceConnected =
  //                     await InternetConnectionChecker().hasConnection;
  //                 if (!isDeviceConnected && isAlertSet == false) {
  //                   showDialogBox();
  //                   setState(() {
  //                     isAlertSet = true;
  //                   });
  //                 }
  //               },
  //               child: Text('OK'),
  //             )
  //           ],
  //         ));

  Future exitDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 175.h,
              width: 310.w,
              padding: EdgeInsets.only(left: 18, right: 18, top: 18),
              decoration: BoxDecoration(
                color: appbarColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        ImageAssets.moononlineshopLogoPNG,
                        scale: 2,
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Text(
                        "Are you sure you want to close application?",
                        style: fontStyle(16, Colors.white, FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                              child: Text(
                                'YES',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("NO", style: TextStyle(color: Colors.white, fontSize: 16),) )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        exitDialog(context);
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
            body: items[currentIndex],
            bottomNavigationBar: FancyBottomNavigationPlus(
              barBackgroundColor: bottomnavbarbgColor,
              circleColor: Colors.white,
              circleOutline: 20,
              barheight: 58.h,
              circleRadius: 45,
              tabs: [
                TabData(
                    icon: Image.asset(
                      ImageAssets.homeIconPNG,
                      scale: 2.5,
                    ),
                    title: 'Home'),
                TabData(
                    icon: Image.asset(
                      ImageAssets.categoryIconPNG,
                      scale: 2.5,
                    ),
                    title: 'Category'),
                TabData(
                    icon: Image.asset(
                      ImageAssets.wishlistIconPNG,
                      scale: 2.5,
                    ),
                    title: 'Wishlist'),
                TabData(
                    icon: Image.asset(
                      ImageAssets.cartIconPNG,
                      scale: 2.5,
                    ),
                    title: 'Cart'),
                TabData(
                    icon: Image.asset(
                      ImageAssets.accountIconPNG,
                      scale: 2.5,
                    ),
                    title: 'Account',
                ),

              ],
              onTabChangedListener: (position) {
                setState(() {
                  currentIndex = position;
                });
              },
            )
            // MoltenBottomNavigationBar(
            //   barColor: bottomnavbarbgColor,
            //   barHeight: 64.h,
            //   domeCircleColor: Colors.white,
            //   domeCircleSize: 35,
            //   margin: EdgeInsets.all(0.w),
            //   tabs: [
            //     MoltenTab(
            //         icon: Image.asset(
            //           ImageAssets.homeIconPNG,
            //           scale: 2.5,
            //         ),
            //         title: const Text('Home')),
            //     MoltenTab(
            //         icon: Image.asset(
            //           ImageAssets.categoryIconPNG,
            //           scale: 2.5,
            //         ),
            //         title: const Text('Category')),
            //     MoltenTab(
            //         icon: Image.asset(
            //           ImageAssets.wishlistIconPNG,
            //           scale: 2.5,
            //         ),
            //         title: const Text('Wishlist')),
            //     MoltenTab(
            //         icon: Image.asset(
            //           ImageAssets.cartIconPNG,
            //           scale: 2.5,
            //         ),
            //         title: const Text('Cart')),
            //     MoltenTab(
            //         icon: Image.asset(
            //           ImageAssets.accountIconPNG,
            //           scale: 2.5,
            //         ),
            //         title: const Text('Account')),
            //   ],
            //   selectedIndex: currentIndex,
            //   onTabChange: (index) {
            //     setState(() {
            //       currentIndex = index;
            //     });
            //   },
            // ),
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // ConvexAppBar(
            //   items: [
            //     TabItem(
            //       icon: Image.asset(
            //         ImageAssets.homeIconPNG,
            //         scale: 2.5,
            //       ),
            //       title: 'Home',
            //       activeIcon: Image.asset(
            //         ImageAssets.homeIconPNG,
            //         scale: 1.5,
            //       ),
            //     ),
            //     TabItem(
            //       icon: Image.asset(
            //         ImageAssets.categoryIconPNG,
            //         scale: 2.5,
            //       ),
            //       title: 'Category',
            //       activeIcon: Image.asset(
            //         ImageAssets.categoryIconPNG,
            //         scale: 1.5,
            //       ),
            //     ),
            //     TabItem(
            //       icon: Image.asset(
            //         ImageAssets.wishlistIconPNG,
            //         scale: 2.5,
            //       ),
            //       title: 'Wishlist',
            //       activeIcon: Image.asset(
            //         ImageAssets.wishlistIconPNG,
            //         scale: 1.5,
            //       ),
            //     ),
            //     TabItem(
            //       icon: Image.asset(
            //         ImageAssets.cartIconPNG,
            //         scale: 2.5,
            //       ),
            //       title: 'Cart',
            //       activeIcon: Image.asset(
            //         ImageAssets.cartIconPNG,
            //         scale: 1.5,
            //       ),
            //     ),
            //     TabItem(
            //       icon: Image.asset(
            //         ImageAssets.accountIconPNG,
            //         scale: 2.5,
            //       ),
            //       title: 'Account',
            //       activeIcon: Image.asset(
            //         ImageAssets.accountIconPNG,
            //         scale: 1.5,
            //       ),
            //     ),
            //   ],
            //  // height: 60.h,
            //   backgroundColor: bottomnavbarbgColor,
            //
            //   style: TabStyle.reactCircle,
            //
            //   color: Colors.black,
            //   onTap: (index) {
            //     setState(() {
            //       currentIndex = index;
            //     });
            //   },
            // ),
            ),
      ),
    );
  }
}
