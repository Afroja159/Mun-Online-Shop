import 'package:moon_online_shop/ui/utils/image_assets.dart';

class AccountSection {
  String? img1, title, img2;
  AccountSection({this.img1, this.title, this.img2});
}

List<AccountSection> myAccount = [
  AccountSection(
      img1: ImageAssets.editIconSVG,
      title: "Edit Profiles",
      img2: ImageAssets.rightArrowIconSVG
  ),
  AccountSection(
      img1: ImageAssets.wishlistIconSVG,
      title: "Wishlist",
      img2: ImageAssets.rightArrowIconSVG
  ),
  AccountSection(
      img1: ImageAssets.myorderIconSVG,
      title: "My Order",
      img2: ImageAssets.rightArrowIconSVG),
  // AccountSection(
  //     img1: ImageAssets.addressIconSVG,
  //     title: "Shipping Address",
  //     img2: ImageAssets.rightArrowIconSVG),
  // AccountSection(
  //     img1: ImageAssets.notificationsIconSVG,
  //     title: "Notification",
  //     img2: ImageAssets.rightArrowIconSVG),
  // AccountSection(
  //     img1: ImageAssets.helpIconSVG,
  //     title: "Help Center",
  //     img2: ImageAssets.rightArrowIconSVG),
  // AccountSection(
  //     img1: ImageAssets.settingIconSVG,
  //     title: "Setting",
  //     img2: ImageAssets.rightArrowIconSVG),

];