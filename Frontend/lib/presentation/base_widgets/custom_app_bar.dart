import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool? autoImplyLeading;
  final String? leadingIcon;
  final VoidCallback? leadingIconPressed;
  final Widget? bottom;
  final bool hasTabBar;
  final bool hasDrawer;

  final double? elevation;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.actions,
    this.leadingIcon,
    this.autoImplyLeading = true,
    this.bottom,
    this.hasTabBar = false,
    this.elevation,
    this.leadingIconPressed,
    this.hasDrawer = false,
  });

  @override
  Widget build(BuildContext context) {
    return
        AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: autoImplyLeading!,
          actions: actions,
          elevation: elevation ?? 0,
          titleSpacing: 0,
          leading: IconButton(
            icon: Image.asset('assets/images/arrow_backward.png'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            title!,
            textScaleFactor: 0.98,
            style: const TextStyle(color: Colors.white),
          ),
        
        );
  }

  @override
  Size get preferredSize => hasTabBar
      ? const Size.fromHeight(kToolbarHeight + kTextTabBarHeight)
      : const Size.fromHeight(kToolbarHeight);
}
