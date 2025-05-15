import 'package:assessili_assement_app/constants/text_style.dart';
import 'package:flutter/material.dart';


class NoInternetWidget extends StatelessWidget {
  final bool isConnected;
  const NoInternetWidget({super.key, required this.isConnected});

  @override
  Widget build(BuildContext context) {
    return isConnected == false
        ? Container(
            color: Theme.of(context).colorScheme.error,
            height: 30,
            width: double.infinity,
            child: Center(
              child: Text(
                "No internet connection",
                style: lableTextStyleProfile.copyWith(color: Theme.of(context).highlightColor),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
