import 'package:moon_online_shop/ui/utils/image_assets.dart';

class WishlistModel {
  String? img, title, price;
  int quantity = 1;

  WishlistModel({this.img, this.title, this.price});
}

List<WishlistModel> wishList = [
  WishlistModel(
      img: ImageAssets.kitPNG,
      title: 'PINK AHA BHA KIT',
      price: '1,250',
      ),
  WishlistModel(
      img: ImageAssets.creamPNG,
      title: 'DAY CREAM',
      price: '1,250',
      ),
  WishlistModel(
      img: ImageAssets.gelPNG,
      title: 'Coconut Soothing Gel',
      price: '1,250',
     ),
  WishlistModel(
      img: ImageAssets.serumPNG,
      title: 'Mahad Facial Serum',
      price: '1,250',
      ),
];
