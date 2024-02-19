import 'package:moon_online_shop/ui/utils/image_assets.dart';

class Sale {
  String? img;

  Sale({this.img});
}

List<Sale> saleList = [
  Sale(img: ImageAssets.flashSalePNG),
  Sale(img: ImageAssets.clearanceSalePNG),
  Sale(img: ImageAssets.bogoSalePNG),
  Sale(img: ImageAssets.comboOfferPNG),
];