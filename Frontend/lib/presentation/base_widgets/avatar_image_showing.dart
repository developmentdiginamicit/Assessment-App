import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final String image;
  final double? radius;
  final void Function()? onTap;

  const ProfileAvatarWidget({super.key, required this.image, this.radius, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).canvasColor.withOpacity(0.3),
        radius: radius?? 25.r,
        backgroundImage: const AssetImage(
          AppAssets.placeholder,
        ),
        foregroundImage: AssetImage(image),
      ),
    );
    // ClipRRect(
    //     borderRadius: BorderRadius.circular(15.r),
    //     child: SizedBox(
    //         width: width ?? 100, // Diameter of the circle
    //         height: height ?? 100,
    //         child: CustomImageWidget(
    //           image: image,
    //           fit: BoxFit.cover,
    //         )));
  }
}
