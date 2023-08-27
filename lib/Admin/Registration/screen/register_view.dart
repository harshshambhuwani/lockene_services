import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/Admin/Registration/widgets/phone_verification_bottom_sheet_widget.dart';
import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../features/common/text_field_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/regist_controller.dart';



class RegisterView extends GetView<RegistController>{


  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    controller.loginFormKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Admin Register".tr,
            style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.orange)),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => {
              Get.back(),
            },
          ),
        ),
        body: Form(
          key: controller.loginFormKey,
          child: ListView(
            primary: true,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: Ui.getBoxDecoration(
                      radius: 14,
                      border: Border.all(width: 5, color: page),
                        color: Colors.black

                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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

              Text('Step  1 of 2'.tr,
                style: Get.textTheme.subtitle1!.merge(const TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),).paddingOnly(top: 15,bottom:5,right: 20,left: 20),
              Text('Create Your \nProfile'.tr,
                style: Get.textTheme.headline6!.merge(const TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),).paddingOnly(top: 0,bottom:0,right: 20,left: 20),

              Obx(() {
                if (controller.loading.isTrue) {
                  return CircularLoadingWidget(height: 300);
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldWidget(
                        labelText: "Full Name".tr,
                        hintText: "John Doe".tr,
                        // initialValue: (controller.currentUser.value.name)!,
                        // onSaved: (input) => controller.currentUser.value.name = input,
                        validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                        iconData: Icons.person_outline,
                        isFirst: true,
                        isLast: false,
                      ),
                      TextFieldWidget(
                        labelText: "Company Name".tr,
                        hintText: "John Deer Pvt".tr,
                        // initialValue: (controller.currentUser.value.name)!,
                        // onSaved: (input) => controller.currentUser.value.name = input,
                        validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                        iconData: Icons.apartment_outlined,
                        isFirst: false,
                        isLast: false,
                      ),
                      TextFieldWidget(
                        labelText: "Email Address".tr,
                        hintText: "johndoe@gmail.com".tr,
                        // initialValue: (controller.currentUser.value.email)!,
                        // onSaved: (input) => controller.currentUser.value.email = input,
                        validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
                        iconData: Icons.alternate_email,
                        isFirst: false,
                        isLast: false,
                      ),

                      // PhoneFieldWidget(
                      //   labelText: "Phone Number".tr,
                      //   hintText: "000 000 0000".tr,
                      //   // initialCountryCode: (controller.currentUser.value.getPhoneNumber().countryISOCode),
                      //   // initialValue: (controller.currentUser.value.getPhoneNumber().number),
                      //   onSaved: (phone) {
                      //     // return controller.currentUser?.value?.phoneNumber = phone.completeNumber;
                      //     // return controller.currentUser.value.phoneNumber = phone!.completeNumber;
                      //   },
                      //   isLast: false,
                      //   isFirst: false,
                      // ),

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
                          isLast: true,
                          isFirst: false,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.hidePassword.value = !controller.hidePassword.value;
                            },
                            color: Theme.of(context).focusColor,
                            icon: Icon(controller.hidePassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                          ),
                        );
                      }),
                    ],
                  );
                }
              }),

              BlockButtonWidget(
                onPressed: () {
                  // controller.login();
                  Get.bottomSheet(
                    isDismissible: false,
                    PhoneVerificationBottomSheetWidget(),
                    isScrollControlled: false,
                  );
                  // PhoneVerificationBottomSheetWidget();
                  // print("cd");

                   Get.offAllNamed(Routes.COMPANY);
                },
                color: Colors.orange,
                text: Text(
                  "Next".tr,
                  style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
                ),
              ).paddingOnly(top: 15,bottom:5,right: 20,left: 20),
              TextButton(
                onPressed: () {
                 // Get.toNamed(Routes.ADLOGIN);
                  print("fromApi");

                },
                child: Text("You already have an account?".tr,style: TextStyle(color: Colors.orange)),
              ).paddingOnly(bottom:10),


            ],
          ),
        ),

        // bottomNavigationBar: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Wrap(
        //       crossAxisAlignment: WrapCrossAlignment.center,
        //       direction: Axis.vertical,
        //       children: [
        //         SizedBox(
        //           width: Get.width,
        //           child:
        //           BlockButtonWidget(
        //             onPressed: () {
        //               controller.login();
        //               // Get.offAllNamed(Routes.COMPANY);
        //             },
        //             color: Colors.orange,
        //             text: Text(
        //               "Next".tr,
        //               style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
        //             ),
        //           ).paddingOnly(top: 15, bottom: 5, right: 20, left: 20),
        //         ),
        //         TextButton(
        //           onPressed: () {
        //             Get.toNamed(Routes.ADLOGIN);
        //           },
        //           child: Text("You already have an account?".tr,style: TextStyle(color: Colors.orange)),
        //         ).paddingOnly(bottom: 10),
        //       ],
        //     ),
        //   ],
        // ),

      ),
    );
  }
}
