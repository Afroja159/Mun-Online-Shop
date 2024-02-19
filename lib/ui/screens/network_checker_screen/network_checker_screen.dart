// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moon_online_shop/const/bottom_navbar.dart';
// import 'package:moon_online_shop/ui/utils/image_assets.dart';
//
// Future<bool> checkNetwork() async {
//   var connectivityResult = await Connectivity().checkConnectivity();
//   return connectivityResult != ConnectivityResult.none;
// }
//
// class NetworkCheckScreen extends StatelessWidget {
//   const NetworkCheckScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: checkNetwork(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(body: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Scaffold(body: Text('Error,checking network connection'));
//         } else if (snapshot.data == true) {
//           return BottomNavBar();
//         } else {
//           return NetworkErrorDialog();
//         }
//       },
//     );
//   }
// }
//
// class NetworkErrorDialog extends StatelessWidget {
//   const NetworkErrorDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(ImageAssets.moononlineshopLogoPNG),
//             Text('Something went wrong'),
//             Text('Check your connection and try again'),
//             TextButton(
//               onPressed: () async {
//                 Navigator.pop(context);
//                 bool hasNetwork = await checkNetwork();
//                 if (hasNetwork) {
//                   Get.to(() => BottomNavBar());
//                 } else {
//                   Get.to(() => NetworkErrorDialog());
//                 }
//               },
//               child: Text('TRY AGAIN'),
//             ),
//             SizedBox(
//               height: 100,
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
