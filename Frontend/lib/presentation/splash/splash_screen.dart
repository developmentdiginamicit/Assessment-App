import 'dart:async';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/data/local_storage.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/home/presentation/home_screen.dart';
import 'package:assessili_assement_app/presentation/splash/getstarted.dart';
import 'package:flutter/material.dart';
import '../../utils/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  void _navigateToHome() {
    var token = LocalStorage().getToken();
     print("token--> $token");
    Timer(const Duration(seconds: 3), () {
      if (token.isNotEmpty) {
        navigatePushRemoveUntil(context, HomeScreen());
      } else {
        navigatePushRemoveUntil(context, Getstarted());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradiantContainer(
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            AppAssets.appLogo,
            height: 200,
            width: 250,
          ),
        ]),
      ),
    ));
  }
}
