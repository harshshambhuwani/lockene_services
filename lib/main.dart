import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:service/routes/app_routes.dart';
import 'package:service/routes/theme1_app_pages.dart';
import 'styles/styles.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lockene',
      debugShowCheckedModeBanner: false,
      home: const MySplashScreen(),
      getPages: Theme1AppPages.routes,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      defaultTransition: Transition.cupertino,
    );
  }
}

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 5), () {
      Get.offAndToNamed(Routes.SPLASHFRONT);
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: media.width * 1,
        height: media.height * 1,
        color: page,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: media.height * 0.9,
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: media.height * 0.1,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const SpinKitRing(
                    color: Colors.deepOrange,
                    size: 30.0,
                    lineWidth: 4.0,
                  ),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  Text(
                    'Powered & Developed By Lockene pvt.ltd.',
                    style: TextStyle(
                        fontSize: media.width * twelve,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  // SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
