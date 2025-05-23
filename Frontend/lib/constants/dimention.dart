import 'package:assessili_assement_app/utils/responsive_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class Dimensions {
  static double fontSizeSmall =
      ResponsiveHelper.isTab(Get.context) ? 16.sp : 12.0.sp;
  static double fontSizeLarge =
      ResponsiveHelper.isTab(Get.context) ? 22.sp : 16.0.sp;
  static const double paddingSizeExtraExtraSmall = 2.0;
  static const double paddingSizeExtraSmall = 5.0;
  static const double paddingSizeEight = 8.0;
  static const double paddingSizeSmall = 10.0;
  static const double paddingSizeTwelve = 12.0;
  static const double paddingSizeDefault = 15.0;
  static const double homePagePadding = 16.0;
  static const double paddingSizeDefaultAddress = 17.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSizeExtraLarge = 25.0;
  static const double paddingSizeThirtyFive = 35.0;
  static const double paddingSizeOverLarge = 50.0;

  static const double marginSizeExtraSmall = 5.0;
  static const double marginSizeSmall = 10.0;
  static const double marginSizeDefault = 15.0;
  static const double marginSizeLarge = 20.0;
  static const double marginSizeExtraLarge = 25.0;
  static const double marginSizeAuthSmall = 30.0;
  static const double marginSizeAuth = 50.0;

  static const double iconSizeExtraSmall = 12.0;
  static const double iconSizeSmall = 18.0;
  static const double iconSizeDefault = 30.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeExtraLarge = 40.0;

  static const double imageSizeExtraSeventy = 70.0;
  static const double bannerPadding = 40.0;

  static const double topSpace = 30.0;
  static const double splashLogoWidth = 150.0;

  static const double chooseReviewImageSize = 40.0;
  static const double profileImageSize = 100.0;
  static const double logoHeight = 80.0;
  static const double cardHeight = 265.0;

  static const double radiusSmall = 5.0;
  static const double radiusDefault = 10.0;
  static const double radiusLarge = 15.0;
  static const double radiusExtraLarge = 20.0;
  static const double menuIconSize = 25.0;
  static const double featuredProductCard = 370.0;
  static const double compareCardWidget = 200.0;
}
