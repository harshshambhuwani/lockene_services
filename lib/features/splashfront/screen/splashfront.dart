import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:service/Admin/new_modified_files/login_module/new_login_screen.dart';
import 'package:service/Admin/new_modified_files/registration_module/new_registration_screen.dart';
import 'package:service/Admin/session/session.dart';

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
  String? localTimezone;
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    getTimeZone();
    _controller = VideoPlayerController.asset(
        'assets/videos/vid.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});

        getSessionValue().then((value) => {
          if(value != null){
            isLogin = value,
          }else{
            isLogin = false,
          },

          print("fromGetSessionValue ${isLogin}"),
        });



      });
  }

  // final controller = MultiImagePickerController(
  //     maxImages: 5, allowedImageTypes: const ['jpg', 'jpeg', 'png']);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => willPopCallback(context),
      child: Scaffold(
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
                          onTap: () async {
                          //  Get.toNamed(Routes.ADLOGIN);
                            isLogin ? await Get.toNamed(Routes.TECHDASHBOARD, arguments: "admin")  : Get.to( NewLoginScreen(localTimeZoneValue : localTimezone ));
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
                           // Get.toNamed(Routes.LOGIN);
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
                         // Get.toNamed(Routes.REGISTER);
                          Get.to(NewRegistrationScreen(localTimeZoneValue : localTimezone ));
                        },
                        child: Text('Sign Up',
                          style: Get.textTheme.headline6!.merge(const TextStyle(
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
      ),
    );
  }

  Future<bool> getSessionValue() async {
    return await SessionManager().get(SessionDataKey().isLogin);
  }

  void getTimeZone() async{
    const MethodChannel channel = MethodChannel('flutter_native_timezone');
    localTimezone = await channel.invokeMethod("getLocalTimezone");
    print("LocalTimeZone ${localTimezone}");
  }

  Future<bool> willPopCallback(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  AlertDialog buildExitDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Text(
        "Do you want to exit the App ?",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(),
          child: Text("No",
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        TextButton(
          // onPressed: () => Get.to(const Info()),
          onPressed: () {
            SystemNavigator.pop();
          },
          child: Text("Yes",
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }

}

