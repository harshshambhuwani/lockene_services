import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:service/Admin/AdminLogin/controller/auth_controller.dart';
import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../features/common/text_field_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';

import 'forgot_password_view.dart';


class AdminLogin extends GetView<AuthADController> {

  // late GlobalKey<FormState> loginFormKey;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    controller.loginFormKey = new GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Admin Login",
            style: TextStyle(color: page),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: Form(
          // key: controller.loginFormKey,
          child: ListView(
            primary: true,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color:Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 40),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Lockene Services",
                            style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white, fontSize: 24)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Welcome to the best service provider system!",
                            style: TextStyle(color: page,fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                          // Text("Fill the following credentials to login your account", style: Get.textTheme.caption.merge(TextStyle(color: page))),
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          'assets/images/admin_ic.png',
                          fit: BoxFit.fitWidth,
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() {
                if (controller.loading.isTrue)
                  return CircularLoadingWidget(height: 300);
                else {
                  return
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        labelText: "Email Address",
                        hintText: "ram@gmail.com",
                        // initialValue: (controller.currentUser.value.email)!,
                        // onSaved: (input) => controller.currentUser.value.email = input,
                        validator: (input) => !input!.contains('@') ? "Should be a valid email address".tr : null,
                        iconData: Icons.alternate_email,
                        keyboardType: TextInputType.emailAddress,

                      ),
                      Obx(() {
                        return TextFieldWidget(
                          labelText: "Password".tr,
                          hintText: "••••••••••••".tr,
                          // initialValue: (controller.currentUser.value.password)!,
                          // onSaved: (input) => controller.currentUser.value.password = input,
                          validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                          obscureText: controller.hidePassword.value,
                          iconData: Icons.lock_outline,
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.hidePassword.value = !controller.hidePassword.value;
                            },
                            color: Colors.grey,
                            icon: Icon(controller.hidePassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                          ),
                        );
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ForgotPasswordView()),
                              // );
                              Get.toNamed(Routes.ADFORGOT_PASSWORD);
                              print("clicked");
                            },
                            child: Text("Forgot Password?".tr,style: TextStyle(color: Colors.orange),),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20),
                      BlockButtonWidget(
                onPressed: () async {
                await Get.toNamed(Routes.TECHDASHBOARD,arguments: "admin");

                },
                        // {
                        //   controller.login();
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => TechDash()),
                        //   );
                        //   await Get.toNamed(Routes.TECHDASHBOARD,arguments:0);
                        //
                        // },
                        color: Colors.orange,
                        text: Text(
                          "Login".tr,
                          style: Get.textTheme.headline6!.merge(TextStyle(color: page)),
                        ),
                      ).paddingSymmetric(vertical: 5, horizontal: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.REGISTER);

                            },
                            child: Text("You don't have an account? Sign-Up".tr,style: TextStyle(color: Colors.orange)),
                          ),
                        ],
                      ).paddingSymmetric(vertical: 10),
                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
