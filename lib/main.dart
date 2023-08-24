import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:service/routes/app_routes.dart';
import 'package:service/routes/theme1_app_pages.dart';



import 'demo1.dart';
import 'features/demo.dart';
import 'features/splashfront/screen/splashfront.dart';
import 'styles/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title:'Lockene',
      debugShowCheckedModeBanner: false,
      home:
      MySplashScreen(),
      // Demo(),
      // MySplashScreen(),
      // initialRoute: MySplashScreen(),
      // onReady: () async {
      //   await Get.putAsync(() => FireBaseMessagingService().init());
      // },
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
    Timer(Duration(seconds: 5), () {
      // navigateUser();
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => SplashFrontNew()),
      //       (Route<dynamic> route) => false,
      // );
      Get.offAndToNamed(Routes.SPLASHFRONT);


    });
  }


  // void navigateUser() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var userid = prefs.getString("user_id");
  //
  //   userid!=null?
  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (context) => DashboardScreen()),
  //         (Route<dynamic> route) => false,
  //   ):Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoginScreen()),
  //         (Route<dynamic> route) => false,
  //   );
  // }



  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        width: media.width * 1,
        height:media.height * 1,
        color: page,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(height:media.height * 0.025,),
            // Container(
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(12.0),
            //         child: Container(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //             child: Image(image: AssetImage("assets/images/logo_img.png",),
            //               width: media.width * 0.3,height: media.width * 0.3,fit: BoxFit.contain,),
            //           ),
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(20.0),
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.grey.withOpacity(0.5),
            //                 spreadRadius: 2,
            //                 blurRadius: 2,
            //                 offset: Offset(0, 3), // changes position of shadow
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       SizedBox(height:media.height * 0.02,),
            //       Text('Lockene', style: TextStyle(
            //         fontSize: media.width * twenty,
            //         fontWeight: FontWeight.w500,
            //         color: Colors.black,
            //       ),textAlign: TextAlign.center,),
            //     ],
            //   ),
            // ),

            Container(
              height: media.height * 0.9,
              child: Image.asset('assets/images/splash.png',fit: BoxFit.cover,),
            ),

            Container(
              height: media.height * 0.1,
              alignment: Alignment.bottomCenter,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  SpinKitRing(
                    color: Colors.deepOrange,
                    size: 30.0,
                    lineWidth: 4.0,
                  ),
                  SizedBox(height:media.height * 0.02,),
                  Text('Powered & Developed By Trickysys IT Solutions',
                    style:  TextStyle(
                        fontSize: media.width * twelve,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),),
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

