import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service/features/bookings/widgets/otp_text_field_widget.dart';
import 'package:service/features/common/block_button_widget.dart';
import 'package:service/features/common/ui.dart';
import 'package:service/routes/app_routes.dart';
import 'package:service/styles/styles.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../network/model/login_model.dart';

class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({Key? key}) : super(key: key);

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


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
          child: ListView(
              primary: true,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 5)),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 40),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              "Lockene Services",
                              style: Get.textTheme.headline6!.merge(
                                  const TextStyle(color: Colors.white, fontSize: 24)),
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
                          color: Colors.black
                      ),
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
                            "Email Address" ?? "",
                            style: Get.textTheme.bodyText1!.merge(const TextStyle(
                                letterSpacing: 2)),
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
                            "Password" ?? "",
                            style: Get.textTheme.bodyText1!.merge(
                                const TextStyle(letterSpacing: 2)),
                            textAlign: TextAlign.start,
                          ),
                          TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            style: Get.textTheme.bodyText2,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            cursorColor: Colors.orange,
                            decoration: Ui.getInputDecoration(
                              hintText: "Password" ?? '',
                              iconData: Icons.lock_outline,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  //   controller.hidePassword.value = !controller.hidePassword.value;
                                },
                                color: Colors.grey,
                                icon: const Icon(Icons.visibility_outlined),
                              ),
                              // suffix: suffix,
                              // errorText: errorText,
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
                            print("clicked");
                          },
                          child: Text("Forgot Password?".tr, style: const TextStyle(
                              color: Colors.orange),),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 20),
                    BlockButtonWidget(
                      onPressed: () async {
                        //  await Get.toNamed(Routes.TECHDASHBOARD,arguments: "admin");
                        if (emailController.text.toString() == "") {
                          Fluttertoast.showToast(
                              msg: "Please Enter Email Address",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                          );
                        } else if (passwordController.text.toString() == "") {
                          Fluttertoast.showToast(
                              msg: "Please Enter Password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,

                          );
                        } else {
                          loginUser(emailController.text.toString(),
                              passwordController.text.toString()).then((value) async {
                                if(value.response?.status == "success"){
                                  await Get.toNamed(Routes.TECHDASHBOARD,arguments: "admin");
                                }
                          });
                        }
                      },
                      color: Colors.orange,
                      text: Text(
                        "Login".tr,
                        style: Get.textTheme.headline6!.merge(
                            TextStyle(color: page)),
                      ),
                    ).paddingSymmetric(vertical: 5, horizontal: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            //  Get.toNamed(Routes.REGISTER);
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

  Future<LoginModel> loginUser(String username, String password) async {
    var url = 'https://mistrichacha.com/tsit/Fsm/FsmLogin'; // Replace with your API endpoint

    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      Map<String, String> headers = {
        'Auth-Key': 'ExVfMAc9A8vQcE3zY0',
        'Client-Service': 'frontend-client'
      };
      request.fields['language'] = "en";
      request.fields['email'] = username;
      request.fields['password'] = password;
      request.headers.addAll(headers);

      try {
       // var response = await request.send();
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        if (response.statusCode == 200) {
          print('Login successful');

          return LoginModel.fromJson(jsonDecode(response.body));
        //  print(await response.stream.bytesToString()); // Print the response body
        } else {
          print('Login failed with status: ${response.statusCode}');
          return LoginModel.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        print('Error during login: $e');
      }
      return LoginModel();
    }
  }
}

