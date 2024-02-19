import 'package:moon_online_shop/ui/utils/image_assets.dart';

class CartModel {
  String? img, title, price, subtitle;
  int quantity = 1;

  CartModel({this.img, this.title, this.price, this.subtitle});
}

List<CartModel> cartList = [
  CartModel(
      img: ImageAssets.kitPNG,
      title: 'PINK AHA BHA KIT',
      price: '1,250',
      subtitle: '10ml'),
  CartModel(
      img: ImageAssets.creamPNG,
      title: 'DAY CREAM',
      price: '1,250',
      subtitle: '100ml'),
  CartModel(
      img: ImageAssets.gelPNG,
      title: 'Coconut Soothing Gel',
      price: '1,250',
      subtitle: '10ml'),
  CartModel(
      img: ImageAssets.serumPNG,
      title: 'Mahad Facial Serum',
      price: '1,250',
      subtitle: '200ml'),
];
