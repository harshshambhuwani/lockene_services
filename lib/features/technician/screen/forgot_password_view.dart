import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles/styles.dart';
import '../../common/block_button_widget.dart';
import '../../common/circular_loading_widget.dart';
import '../../common/text_field_widget.dart';
import '../../common/ui.dart';
import '../service/auth_controller.dart';



class ForgotPasswordView extends GetView<AuthController> {
  // final Setting _settings = Get.find<SettingsService>().setting.value;

  @override
  Widget build(BuildContext context) {
    controller.forgotPasswordFormKey = new GlobalKey<FormState>();
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
        body: Form(
          key: controller.forgotPasswordFormKey,
          child: ListView(
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
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: Get.theme.focusColor.withOpacity(0.2), blurRadius: 10, offset: Offset(0, 5)),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 40),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            ('Lockene Services'),
                            style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white, fontSize: 24)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Welcome to the best service provider system!".tr,
                            style: Get.textTheme.caption!.merge(TextStyle(color: Colors.white)),
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
              Obx(() {
                if (controller.loading.isTrue)
                  return CircularLoadingWidget(height: 300);
                else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        labelText: "Email Address".tr,
                        hintText: "ram@gmail.com".tr,
                        // initialValue: (controller.currentUser.value.email)!,
                        // onSaved: (input) => controller.currentUser.value.email = input!,
                        validator: (input) => !GetUtils.isEmail(input!) ? "Should be a valid email".tr : null,
                        iconData: Icons.alternate_email,
                      ),
                      BlockButtonWidget(
                        onPressed:(){}/* controller.sendResetLink,*/,
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
                              Navigator.pop(context);
                            },
                            child: Text("Cancel".tr,style: TextStyle(color: Colors.orange),),
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
                  );
                }
              }),
            ],
          ),
        ));
  }
}
