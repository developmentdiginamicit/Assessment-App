import 'dart:io';
import 'package:assessili_assement_app/presentation/base_widgets/custom_image_widget.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileAvatarUploadProfile extends StatelessWidget {
  final String image;
  final VoidCallback cameraPress, galleryPress;
  const ProfileAvatarUploadProfile(
      {super.key,
      required this.image,
      required this.cameraPress,
      required this.galleryPress});

  @override
  Widget build(BuildContext context) {
    print("xjkfhgjdsfhg $image");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            children: [
              ClipOval(
                  child: SizedBox(
                      width: 100, // Diameter of the circle
                      height: 100,
                      child: image.isNotEmpty
                          ? image.startsWith("https://") ||
                                  image.startsWith("http://")
                              ? CustomImageWidget(
                                  image: image,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(image),
                                  fit: BoxFit.cover,
                                )
                          : Image.asset(
                              AppAssets.guestProfile,
                              fit: BoxFit.cover,
                            ))),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _openBottomSheet,
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.upload, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: cameraPress,
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: galleryPress,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        );
      },
    );
  }
}
