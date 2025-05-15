import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomImageWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? placeholder;
  const CustomImageWidget(
      {super.key,
      required this.image,
      this.height,
      this.width,
      this.fit = BoxFit.cover,
      this.placeholder = AppAssets.placeholder});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      imageUrl: image,
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      errorWidget: (c, o, s) => Image.asset(placeholder ?? AppAssets.placeholder,
          height: height, width: width, fit: BoxFit.cover),
    );
  }
}
