import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:service/Admin/new_modified_files/login_module/new_login_screen.dart';

import 'package:video_player/video_player.dart';
import '../../../styles/styles.dart';
import '../../../routes/app_routes.dart';
import '../../technician/screen/login.dart';
import '../../technician/service/auth_controller.dart';



class SplashFrontNew extends StatefulWidget{
  const SplashFrontNew({Key? key}) : super(key: key);

  @override
  State<SplashFrontNew> createState() => _SplashFrontNewState();
}

class _SplashFrontNewState extends State<SplashFrontNew> {

  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/videos/vid.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  // final controller = MultiImagePickerController(
  //     maxImages: 5, allowedImageTypes: const ['jpg', 'jpeg', 'png']);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        width: size.width * 1,
        height: size.height * 1,
        child: Column(
          children: [
            Container(
              width: size.width * 1,
              height: size.height * 0.7,
              // color: Colors.orange,
              child: VideoPlayer(_controller),
            ),
            Container(
              width: size.width * 1,
              height: size.height * 0.3,
              // color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                        //  Get.toNamed(Routes.ADLOGIN);
                          Get.to(const NewLoginScreen());
                        },
                        child: SizedBox(
                          width: size.height * 0.15,
                          child: Image.asset("assets/images/admin.png",
                            fit: BoxFit.cover,),
                        ),
                      ),

                      SizedBox(width: size.height * 0.08,),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Container(
                          width: size.height * 0.15,
                          child: Image.asset("assets/images/team.png",
                            fit: BoxFit.cover,),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02,),
                  SizedBox(
                    height: size.height * 0.06,
                    width: size.width * 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange, // background
                        onPrimary: Colors.white, //
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ), // foreground
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Text('Sign Up',
                        style: Get.textTheme.headline6!.merge(TextStyle(
                            color: Colors.white)),
                      ),
                    ),),

                ],
              ).marginOnly(top: size.width * 0.05,
                  bottom: size.width * 0.05,
                  left: size.width * 0.05,
                  right: size.width * 0.05),
            ),
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   var media = MediaQuery.of(context).size;
  //
  //   return SafeArea(
  //     child: Scaffold(
  //       backgroundColor: backgroundColor,
  //
  //       body: Container(
  //         width: media.width * 1,
  //         height:media.height * 1 ,
  //
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Image.asset("assets/images/welcome1.png",scale: 1.5,),
  //             Text("Welcome at \n Lockene Services",
  //               style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white, fontSize: 24)),textAlign: TextAlign.center,),
  //             SizedBox(height: media.height * 0.05,),
  //
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 // Container(
  //                 //   child: Column(
  //                 //     children: [
  //                 //        Image.network('https://cdn-icons-png.flaticon.com/512/4205/4205906.png',scale: 10,).marginOnly(left: media.width * 0.055,right: media.width * 0.055,top: media.width * 0.03,bottom: media.width * 0.018),
  //                 //        Text('Admin',style: TextStyle(
  //                 //            height: 1.0,
  //                 //            fontSize: 16,
  //                 //            color: Colors.deepOrange,
  //                 //            fontWeight: FontWeight.w500
  //                 //        )).marginOnly(bottom: 10),
  //                 //     ],
  //                 //   ),
  //                 //   decoration: BoxDecoration(
  //                 //     borderRadius: BorderRadius.circular(10),
  //                 //     color: Colors.white
  //                 //   ),
  //                 // ),
  //                 GestureDetector(
  //                   onTap: (){
  //                     Get.toNamed(Routes.ADLOGIN);
  //                   },
  //                   child:  Container(
  //                     child: Image.asset("assets/images/admin.png",fit: BoxFit.cover,),
  //                     // decoration: BoxDecoration(
  //                     //     borderRadius: BorderRadius.circular(50),
  //                     //     color: Colors.white
  //                     // ),
  //                     width: media.height * 0.15,
  //                   ),
  //                 ),
  //
  //                 SizedBox(width: media.height * 0.08,),
  //                 GestureDetector(
  //                   onTap: (){
  //                     Get.toNamed(Routes.LOGIN);
  //                   },
  //                   child: Container(
  //                     child: Image.asset("assets/images/team.png",fit: BoxFit.cover,),
  //                     // decoration: BoxDecoration(
  //                     //     borderRadius: BorderRadius.circular(50),
  //                     //     color: Colors.white
  //                     // ),
  //                     width: media.height * 0.15,
  //                   ),
  //                 ),
  //
  //               ],
  //             ),
  //
  //             // SizedBox(height: media.height * 0.025,),
  //
  //             // GestureDetector(
  //             //   onTap: (){
  //             //     Get.toNamed(Routes.LOGIN);
  //             //   },
  //             //   child:
  //             //   Text(
  //             //     "For Technician Login\nClick Here",
  //             //     style: TextStyle(
  //             //         height: 1.0,
  //             //         fontSize: 18,
  //             //         color: Colors.white,
  //             //         fontWeight: FontWeight.bold
  //             //     ),textAlign: TextAlign.center,
  //             //   ),
  //             // ),
  //             // SizedBox(height: media.height * 0.005,),
  //
  //             // GestureDetector(
  //             //   onTap: (){
  //             //     Get.toNamed(Routes.LOGIN);
  //             //
  //             //   },
  //             //   child: Container(
  //             //     alignment: Alignment.center,
  //             //     height: media.height * 0.05,
  //             //     width: MediaQuery.of(context).size.width * 0.5,
  //             //     decoration: BoxDecoration(
  //             //       borderRadius: BorderRadius.circular(30.0),
  //             //       color: Colors.white,
  //             //         boxShadow: [
  //             //           BoxShadow(
  //             //             color: Colors.white,
  //             //             spreadRadius: 5.0,
  //             //           ),]
  //             //
  //             //     ),
  //             //     child: Text(
  //             //       "Technician Login",
  //             //       style: TextStyle(
  //             //           height: 1.0,
  //             //           fontSize: 18,
  //             //           color: Colors.deepOrange,
  //             //           fontWeight: FontWeight.bold
  //             //       ),textAlign: TextAlign.center,
  //             //     ).marginOnly(right: 0.0).paddingSymmetric(horizontal:15.0,vertical: 5.0),
  //             //   ),
  //             // ),
  //           ],
  //         ),
  //       ),
  //
  //     ),
  //   );
  // }
}

