import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service/Admin/new_modified_files/forgot_password.dart';
import 'package:service/Admin/new_modified_files/registration_module/new_registration_screen.dart';
import 'package:service/Admin/session/session.dart';
import 'package:service/features/common/block_button_widget.dart';
import 'package:service/features/common/ui.dart';
import 'package:service/network/api_interface.dart';
import 'package:service/routes/app_routes.dart';
import 'package:service/styles/styles.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewLoginScreen extends StatefulWidget {
  String? localTimeZoneValue;
  NewLoginScreen({Key? key, this.localTimeZoneValue}) : super(key: key);

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool isLoadingButton = true;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("fromLoginScree ${widget.localTimeZoneValue}");
  }

  @override
  Widget build(BuildContext context) {
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
          child: ListView(primary: true, children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5)),
                    ],
                  ),
                  margin: const EdgeInsets.only(bottom: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Lockene Services",
                          style: Get.textTheme.headline6!.merge(const TextStyle(
                              color: Colors.white, fontSize: 24)),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Welcome to the best service provider system!",
                          style: TextStyle(color: page, fontSize: 12),
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
                      color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 14, left: 20, right: 20),
                  margin: const EdgeInsets.only(
                      left: 20, right: 10, top: 10, bottom: 10),
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
                        "Password" ?? "",
                        style: Get.textTheme.bodyText1!
                            .merge(const TextStyle(letterSpacing: 2)),
                        textAlign: TextAlign.start,
                      ),
                      TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        style: Get.textTheme.bodyText2,
                        obscureText: _obscureText,
                        textAlign: TextAlign.start,
                        cursorColor: Colors.orange,
                        decoration: Ui.getInputDecoration(
                          hintText: "Password" ?? '',
                          iconData: Icons.lock_outline,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _toggle();
                            },
                            color: Colors.grey,
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        //  Get.toNamed(Routes.ADFORGOT_PASSWORD);
                        Get.to(FogotPasswordPage());
                      },
                      child: Text(
                        "Forgot Password?".tr,
                        style: const TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20),
                Container(
                  width: Get.size.width,
                  height: 52,
                  //color: Colors.orange,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
                        if (emailController.text.toString() == "") {
                          showToast("Please Enter Email Address");
                        } else if (!validateMailField(
                            emailController.text.toString())) {
                          showToast("Email is Incorrect");
                        } else if (passwordController.text.toString() == "") {
                          showToast("Please Enter Password");
                        } else {
                          ApiInterface()
                              .loginUser(emailController.text.toString(),
                                  passwordController.text.toString())
                              .then((value) async {
                            if (value.response?.status == "success") {
                              setSessionData(value);
                              print(
                                  "fromDsdddaadadUseeee ${value.response?.data?.user![0].id}");
                              await Get.toNamed(Routes.TECHDASHBOARD,
                                  arguments: "admin");
                            } else if (value.response?.status ==
                                "email_not_exists") {
                              Fluttertoast.showToast(
                                msg: value.response?.message.toString() ??
                                    "Entered Email Not Exists!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                              );
                            } else if (value.response?.status ==
                                "account_inactive") {
                              Fluttertoast.showToast(
                                msg: value.response?.message.toString() ??
                                    "Account is not active! Please contact to your Manufacturer!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                              );
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
                        : const Text("Login",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ).paddingSymmetric(vertical: 5, horizontal: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Get.toNamed(Routes.REGISTER);
                        Get.to(NewRegistrationScreen());
                      },
                      child: Text("You don't have an account? Sign-Up".tr,
                          style: const TextStyle(color: Colors.orange)),
                    ),
                  ],
                ).paddingSymmetric(vertical: 10),
              ],
            )
          ]),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
  }

  bool validateMailField(String userInput) {
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(userInput)) {
      return false;
    } else {
      return true;
    }
  }
}
