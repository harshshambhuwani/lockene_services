import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:service/Admin/AdminLogin/controller/auth_controller.dart';
import 'package:service/Admin/new_modified_files/login_module/new_login_screen.dart';
import 'package:service/features/common/ui.dart';
import 'package:service/network/api_interface.dart';

import '../../../features/bookings/widgets/otp_text_field_widget.dart';
import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../styles/styles.dart';




class FogotPasswordPage extends StatelessWidget{
  // final Setting _settings = Get.find<SettingsService>().setting.value;

  TextEditingController emailController = TextEditingController();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
   // controller.forgotPasswordFormKey = new GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Forgot Password".tr,
            style: Get.textTheme.headline6!.merge(TextStyle(color: page)),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: ListView(
          primary: true,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 180,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(color: Get.theme.focusColor.withOpacity(0.2), blurRadius: 10, offset: Offset(0, 5)),
                    ],
                  ),
                  margin: const EdgeInsets.only(bottom: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          ('Lockene Services'),
                          style: Get.textTheme.headline6!.merge(const TextStyle(color: Colors.white, fontSize: 24)),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Welcome to the best service provider system!".tr,
                          style: Get.textTheme.caption!.merge(const TextStyle(color: Colors.white)),
                          textAlign: TextAlign.center,
                        ),
                        // Text("Fill the following credentials to login your account", style: Get.textTheme.caption.merge(TextStyle(color: Colors.white))),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: Ui.getBoxDecoration(
                      radius: 14,
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.black
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        'assets/images/team_ic.png',
                        fit: BoxFit.fill,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 14, left: 20, right: 20),
                  margin: const EdgeInsets.only(
                      left: 20, right: 10, top: 10, bottom: 20),
                  decoration: BoxDecoration(
                      color: page,
                      borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Get.theme.focusColor.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5)),
                      ],
                      border: Border.all(
                          color: Get.theme.focusColor.withOpacity(0.05))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Email Address" ?? "",
                        style: Get.textTheme.bodyText1!
                            .merge(const TextStyle(letterSpacing: 2)),
                        textAlign: TextAlign.start,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: emailController,
                        style: Get.textTheme.bodyText2,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        cursorColor: Colors.orange,
                        decoration: Ui.getInputDecoration(
                          hintText: "Email Address" ?? '',
                          iconData: Icons.alternate_email,
                        ),
                      ),
                    ],
                  ),
                ),
                BlockButtonWidget(
                  onPressed:(){
                    print("fromOnTappp");
                   if(emailController.text == ""){
                     showToast("Please enter the email Address");
                   }else{
                      ApiInterface().sendPasswordResetLink(emailController.text).then((value) => {
                        if(value.status == "1"){
                          showToast("Password is sent to your Email!"),
                          Get.to( NewLoginScreen()),
                        }else if(value.status == "0"){
                          showToast("Email is not register with us!!"),
                        }
                      });
                   }
                  }/* controller.sendResetLink,*/,
                  color: Colors.orange,
                  text: Text(
                    "Send Reset Link".tr,
                    style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
                  ),
                ).paddingSymmetric(vertical: 35, horizontal: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                       // Navigator.pop(context);

                      },
                      child: Text("Cancel".tr,style: const TextStyle(color: Colors.orange),),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("You remember my password!".tr,style: TextStyle(color: Colors.orange),),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }
}
