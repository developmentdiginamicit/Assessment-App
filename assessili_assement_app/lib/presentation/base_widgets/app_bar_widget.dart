import 'package:assessili_assement_app/presentation/auth/presentation/edit_profile_screen.dart';
import 'package:assessili_assement_app/presentation/base_widgets/avatar_image_showing.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWithProfile extends StatelessWidget
    implements PreferredSizeWidget {
      void Function()? onTap;
  CustomAppBarWithProfile({super.key, this.leading, this.title, this.onTap});

  Widget? leading;
  String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 19, 12, 70),
      automaticallyImplyLeading: false,
      leading: title == null
          ? Padding(
              padding: EdgeInsets.only(left: 20.sp),
              child: InkWell(
                onTap: onTap,
                child: leading ??
                    Image.asset(
                      AppAssets.logo,
                      height: 40.h,
                    ),
              ),
            )
          : null,
      title: title != null
          ? const Align(
              alignment: Alignment.centerLeft,
              child: Text("Welcome , Sourav",
                  style: TextStyle(color: Colors.white)))
          : const SizedBox.shrink(),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const EditProfileScreen()));
          },
          child: ProfileAvatarWidget(
            radius: 20.r,
            image: AppAssets.profile,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
