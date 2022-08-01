import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:houzeo/res/app_theme.dart';
import 'package:houzeo/screens/splash_screen.dart';

class App {
  static App instance = App();

  bool _devMode = false;

  bool get devMode => _devMode;


  startApp({
    required bool devMode,
  }) async {
    _devMode = devMode;
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(ConnectivityAppWrapper(
      app: GetMaterialApp(
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        home: const SplashScreen(),
        theme: appTheme,
      ),
    ));
  }
}

