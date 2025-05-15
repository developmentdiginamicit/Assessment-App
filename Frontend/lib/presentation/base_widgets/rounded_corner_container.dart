import 'package:flutter/material.dart';

class GradiantContainer extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final double? radius;
  const GradiantContainer(
      {super.key, required this.child, this.bgColor, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        // image: DecorationImage(
        //     image: AssetImage(
        //       AppAssets.backgrouImage,
        //     ),
        //     fit: BoxFit.cover),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 19, 12, 70),
            Color.fromARGB(255, 11, 5, 50)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(
        //     radius ?? Dimensions.paddingSizeExtraLarge,
        //   ),
        //   topRight: Radius.circular(radius ?? Dimensions.paddingSizeExtraLarge),
        // ),
      ),
      child: child,
    );
  }
}
