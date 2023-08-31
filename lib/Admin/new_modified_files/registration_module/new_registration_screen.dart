import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:service/Admin/Registration/widgets/phone_verification_bottom_sheet_widget.dart';
import 'package:service/Admin/new_modified_files/login_module/new_login_screen.dart';
import 'package:service/features/common/block_button_widget.dart';
import 'package:service/features/common/ui.dart';
import 'package:service/network/api_interface.dart';
import 'package:service/styles/styles.dart';

class NewRegistrationScreen extends StatefulWidget {
  const NewRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<NewRegistrationScreen> createState() => _NewRegistrationScreenState();
}

class _NewRegistrationScreenState extends State<NewRegistrationScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Register",
          style: Get.textTheme.headline6!
              .merge(const TextStyle(color: Colors.orange)),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade50,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => {
            Get.back(),
          },
        ),
      ),
      body: ListView(
              primary: true,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      decoration: Ui.getBoxDecoration(
                          radius: 14,
                          border: Border.all(width: 5, color: page),
                          color: Colors.black),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                Text(
                  'Step  1 of 2'.tr,
                  style: Get.textTheme.subtitle1!.merge(const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500)),
                ).paddingOnly(top: 15, bottom: 5, right: 20, left: 20),
                Text(
                  'Create Your \nProfile'.tr,
                  style: Get.textTheme.headline6!.merge(const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
                ).paddingOnly(top: 0, bottom: 0, right: 20, left: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      margin: const EdgeInsets.only(
                          top: 5, left: 20, right: 10, bottom: 0),
                      decoration: BoxDecoration(
                          color: page,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10)),
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
                            "Full Name" ?? "",
                            style: Get.textTheme.bodyText1!
                                .merge(const TextStyle(letterSpacing: 2)),
                            textAlign: TextAlign.start,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: fullNameController,
                            style: Get.textTheme.bodyText2,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            cursorColor: Colors.orange,
                            decoration: Ui.getInputDecoration(
                              hintText: "Enter your full name" ?? '',
                              iconData: Icons.person_outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      margin: const EdgeInsets.only(
                          top: 0, left: 20, right: 10, bottom: 0),
                      decoration: BoxDecoration(
                          color: page,
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
                            "Company Name" ?? "",
                            style: Get.textTheme.bodyText1!
                                .merge(const TextStyle(letterSpacing: 2)),
                            textAlign: TextAlign.start,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: companyNameController,
                            style: Get.textTheme.bodyText2,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            cursorColor: Colors.orange,
                            decoration: Ui.getInputDecoration(
                              hintText: "Enter your company name" ?? '',
                              iconData: Icons.apartment_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      margin: const EdgeInsets.only(
                          top: 0, left: 20, right: 10, bottom: 0),
                      decoration: BoxDecoration(
                          color: page,
                          // borderRadius: const BorderRadius.vertical(
                          //     top: Radius.circular(10)),
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
                            controller: emailAddressController,
                            style: Get.textTheme.bodyText2,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            cursorColor: Colors.orange,
                            decoration: Ui.getInputDecoration(
                              hintText: "Enter your email address" ?? '',
                              iconData: Icons.alternate_email,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      margin: const EdgeInsets.only(
                          top: 0, left: 20, right: 10, bottom: 20),
                      decoration: BoxDecoration(
                          color: page,
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
                            "Password" ?? "",
                            style: Get.textTheme.bodyText1!
                                .merge(const TextStyle(letterSpacing: 2)),
                            textAlign: TextAlign.start,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            style: Get.textTheme.bodyText2,
                            obscureText: _obscureText,
                            textAlign: TextAlign.start,
                            cursorColor: Colors.orange,
                            decoration: Ui.getInputDecoration(
                              hintText: "Enter your password" ?? '',
                              iconData: Icons.lock_outline,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _toggle();
                                },
                                color: Colors.grey,
                                icon: Icon(_obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // BlockButtonWidget(
                //   onPressed: () {
                //     if (fullNameController.text == "") {
                //       showToast("Please enter your full name");
                //     } else if (companyNameController.text == "") {
                //       showToast("Please enter your company name");
                //     } else if (emailAddressController.text == "") {
                //       showToast("Please enter your email address");
                //     } else if (passwordController.text == "") {
                //       showToast("Please enter your password");
                //     } else {
                //       ApiInterface()
                //           .sendOtp(
                //               fullNameController.text.toString(),
                //               companyNameController.text.toString(),
                //               emailAddressController.text.toString(),
                //               passwordController.text.toString())
                //           .then((value) => {
                //                 if (value.status == "1")
                //                   {
                //                     showToast(value.message.toString()),
                //                     Get.bottomSheet(
                //                       isDismissible: false,
                //                       PhoneVerificationBottomSheetWidget(
                //                           fullName: fullNameController.text,
                //                           companyName:
                //                               companyNameController.text,
                //                           emailAddress:
                //                               emailAddressController.text,
                //                           passwordValue:
                //                               passwordController.text,
                //                           otpValue: value.otp),
                //                       isScrollControlled: false,
                //                     )
                //                   }
                //               });
                //     }
                //   },
                //   color: Colors.orange,
                //   text: Text(
                //     "Next".tr,
                //     style: Get.textTheme.headline6!
                //         .merge(const TextStyle(color: Colors.white)),
                //   ),
                // ).paddingOnly(top: 15, bottom: 5, right: 20, left: 20),


                Container(
                  width: Get.size.width,
                  height: 52,
                  //color: Colors.orange,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 2));
                      setState(() {
                        isLoading = false;
                      });
                      if (isLoading == false) {
                        if (fullNameController.text == "") {
                          showToast("Please enter your full name");
                        } else if (companyNameController.text == "") {
                          showToast("Please enter your company name");
                        } else if (emailAddressController.text == "") {
                          showToast("Please enter your email address");
                        } else if (passwordController.text == "") {
                          showToast("Please enter your password");
                        } else {
                          ApiInterface()
                              .sendOtp(
                              fullNameController.text.toString(),
                              companyNameController.text.toString(),
                              emailAddressController.text.toString(),
                              passwordController.text.toString())
                              .then((value) => {
                            if (value.status == "1")
                              {
                                showToast(value.message.toString()),
                                Get.bottomSheet(
                                  isDismissible: false,
                                  PhoneVerificationBottomSheetWidget(
                                      fullName: fullNameController.text,
                                      companyName:
                                      companyNameController.text,
                                      emailAddress:
                                      emailAddressController.text,
                                      passwordValue:
                                      passwordController.text,
                                      otpValue: value.otp),
                                  isScrollControlled: false,
                                )
                              }
                          });
                        }
                      }
                    },
                    child: (isLoading)
                        ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.5,
                        ))
                        : const Text("Next",
                        style: TextStyle(fontSize: 20,color: Colors.white)),
                  ),
                ).paddingSymmetric(vertical: 5, horizontal: 20),
                TextButton(
                  onPressed: () {
                    Get.to(const NewLoginScreen());
                  },
                  child: Text("You already have an account?".tr,
                      style: const TextStyle(color: Colors.orange)),
                ).paddingOnly(bottom: 10),
              ],
            ),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
