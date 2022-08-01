import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:houzeo/mixins/after_layout.dart';
import 'package:houzeo/res/assets.dart';
import 'package:houzeo/res/sizes.dart';
import 'dashborad_screen.dart';

const Duration splashDuration = Duration(seconds: 3);

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    _startApp();
  }

  _startApp() async{
    return Timer(splashDuration, () async {
      Get.offAll(() => DashBoardScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
            Assets.logoTwo,
            semanticsLabel: 'Acme Logo'
        ),
      ),
    );
  }
}
