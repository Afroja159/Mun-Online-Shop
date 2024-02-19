import 'package:moon_online_shop/ui/utils/image_assets.dart';

class TrendingProduct {
  String? img, title, price;

  TrendingProduct({this.img, this.title, this.price});
}

List<TrendingProduct> trendingProductList = [
  TrendingProduct(
    img: ImageAssets.foamPNG,
    title: 'ZADA Charcoal Cleansing  Foam',
    price: '1,250',
  ),
  TrendingProduct(
    img: ImageAssets.kitPNG,
    title: 'PINK AHA BHA KIT',
    price: '1,250',
  ),
  TrendingProduct(
    img: ImageAssets.creamPNG,
    title: 'BABY PINK DAY CREAM',
    price: '1,250',
  ),
  TrendingProduct(
    img: ImageAssets.dayCreamPNG,
    title: 'Peptides Hydra Nobel DayCream',
    price: '1,250',
  ),
  TrendingProduct(
    img: ImageAssets.gelPNG,
    title: 'Coconut Soothing Gel',
    price: '1,250',
  ),
  TrendingProduct(
    img: ImageAssets.serumPNG,
    title: 'Mahad Facial Serum',
    price: '1,250',
  ),
];
