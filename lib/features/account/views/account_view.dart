import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:service/Admin/new_modified_files/login_module/new_login_screen.dart';
import 'package:service/Admin/session/session.dart';
import 'package:service/features/profile/views/profile_view.dart';

import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../../common/my_webview_widget.dart';
import '../../common/notifications_button_widget.dart';
import '../../common/ui.dart';
import '../controllers/account_controller.dart';
import '../widgets/account_link_widget.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String name = "";
  String emailAddress = "";
  int? phoneNumber;
  String userAddress = "";
  int? userId;
  String userToken = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromSession();
  }

  @override
  Widget build(BuildContext context) {
    // var _currentUser = Get.find<AuthService>().user;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "More".tr,
            style: Get.textTheme.subtitle1!.merge(
                const TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.sort, color: Colors.white),
            onPressed: () => {Scaffold.of(context).openDrawer()},
          ),
          elevation: 0,
          actions: const [
            NotificationsButtonWidget(
              iconColor: Colors.white,
              labelColor: Colors.black,
            )
          ],
        ),
        body: ListView(
          primary: true,
          children: [
            // Obx(() {
            //   return
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 150,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Get.theme.focusColor.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5)),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 50),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          name.toString(),
                          style: Get.textTheme.headline6!.merge(const TextStyle(
                            color: Colors.white,
                          )),
                        ),
                        SizedBox(height: 10),
                        Text(emailAddress.toString(),
                            style: Get.textTheme.caption!.merge(TextStyle(
                              color: Colors.white,
                            ))),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: Ui.getBoxDecoration(
                    radius: 14,
                    border: Border.all(width: 5, color: Colors.white),
                    color: Colors.black,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.fitWidth,
                          width: 90,
                          height: 90,
                          imageUrl: /* _currentUser.value.avatar?.thumb ?? */
                              'https://cdn-icons-png.flaticon.com/512/2482/2482458.png',
                          placeholder: (context, url) => Image.asset(
                            'assets/img/loading.gif',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 90,
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error_outline),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // ;}),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: Ui.getBoxDecoration(),
              child: Column(
                children: [
                  AccountLinkWidget(
                    icon: Icon(Icons.person_outline, color: Colors.orange),
                    text: Text(
                      "My Profile".tr,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    onTap: (e) {
                      //  Get.toNamed(Routes.PROFILE);
                      Get.to(ProfileView(
                          userName: name.toString(),
                          phoneNumber: phoneNumber,
                          userEmailAddress: emailAddress.toString(),
                          userAddress: userAddress.toString(),
                          userTokenValue: userToken,
                          userIdValue: userId));
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.view_compact, color: Colors.orange),
                    text: Text("Installation History".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.find<RootController>().changePage(0);
                      Get.toNamed(Routes.SLIDE_DETAILS,
                          arguments: "Installation History");
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.build_outlined, color: Colors.orange),
                    text: Text("Service History".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.toNamed(Routes.NOTIFICATIONS);
                      Get.toNamed(Routes.SLIDE_DETAILS,
                          arguments: "Service History");
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.assignment_outlined, color: Colors.orange),
                    text: Text("On-Going Work".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.find<RootController>().changePage(2);
                      Get.toNamed(Routes.SLIDE_DETAILS,
                          arguments: "On-Going Work");
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: Ui.getBoxDecoration(),
              child: Column(
                children: [
                  AccountLinkWidget(
                    icon: Icon(Icons.post_add, color: Colors.orange),
                    text: Text(
                      "Manage Product".tr,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    onTap: (e) {
                      Get.toNamed(Routes.MANAGEPRODUCT);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.library_add, color: Colors.orange),
                    text: Text("Manage Custom Service".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      Get.toNamed(Routes.MANAGESERVICE);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.wallet, color: Colors.orange),
                    text: Text("Payment".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      Get.toNamed(Routes.PAYMENT);
                      // Get.toNamed(Routes.SLIDE_DETAILS,arguments: "Service History" );
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.assignment_outlined, color: Colors.orange),
                    text: Text("Commission".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      Get.toNamed(Routes.COMMISSION);
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: Ui.getBoxDecoration(),
              child: Column(
                children: [
                  AccountLinkWidget(
                    icon: Icon(Icons.apartment_outlined, color: Colors.orange),
                    text: Text("About Us".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      Get.toNamed(Routes.ABOUTUS);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.support_agent, color: Colors.orange),
                    text: Text("Support Us".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      Get.toNamed(Routes.SUPPORT);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.support_outlined, color: Colors.orange),
                    text: Text("Help & FAQ".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MyWebView(url: 'https://youtu.be/A0-xXtdZ1Zw'),
                        ),
                      );
                      print("hi");
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: Ui.getBoxDecoration(),
              child: Column(
                children: [
                  AccountLinkWidget(
                    icon: Icon(Icons.android, color: Colors.orange),
                    text: Text("App Version".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.toNamed(Routes.SETTINGS_THEME_MODE);
                      showDialog(
                          context: context,
                          builder: (_) {
                            // return CustomDialog();
                            return AppVersion();
                          });
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.system_update, color: Colors.orange),
                    text: Text("Update".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.toNamed(Routes.SETTINGS_THEME_MODE);
                      showDialog(
                          context: context,
                          builder: (_) {
                            // return CustomDialog();
                            return Update();
                          });
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.logout, color: Colors.orange),
                    text: Text("Logout".tr,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) async {
                      // await Get.find<AuthService>().removeCurrentUser();
                      // await Get.offNamedUntil(Routes.LOGIN, (Route route) {
                      //   if (route.settings.name == Routes.LOGIN) {
                      //     return true;
                      //   }
                      //   return false;
                      // });

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 100,
                              width: Get.size.width * 0.65,
                              color: Colors.transparent,
                              child: AlertDialog(
                                backgroundColor: Colors.white,
                                title: const Center(
                                    child: Text("Do you want to logout ?")),
                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          side: const BorderSide(width: 0.1),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      clearSession();
                                      Get.to(NewLoginScreen());
                                    },
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey[100]),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            side: const BorderSide(width: 0.1),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        "No",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                      //clearSession();
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Future<void> clearSession() async {
    await SessionManager().set(SessionDataKey().isLogin, false);
    await SessionManager().set(SessionDataKey().userId, "");
    await SessionManager().set(SessionDataKey().displayName, "");
    await SessionManager().set(SessionDataKey().lastName, "");
    await SessionManager().set(SessionDataKey().referralCode, "");
    await SessionManager().set(SessionDataKey().tspContactNumber, "");
    await SessionManager().set(SessionDataKey().tspBussinessName, "");
    await SessionManager().set(SessionDataKey().tspEmail, "");
    await SessionManager().set(SessionDataKey().tspDetailedAddress, "");
    await SessionManager().set(SessionDataKey().tspProfileImage, "");
    await SessionManager().set(SessionDataKey().tspTimeZone, "");
    await SessionManager().set(SessionDataKey().tspAbbrevation, "");
    await SessionManager().set(SessionDataKey().tspMfrName, "");
    await SessionManager().set(SessionDataKey().tspCurrencySymbol, "");
    await SessionManager().set(SessionDataKey().tspCountryName, "");
    await SessionManager().set(SessionDataKey().tspStateName, "");
    await SessionManager().set(SessionDataKey().tspCityName, "");
    await SessionManager().set(SessionDataKey().tspLoginToken, "");
  }

  Future<String> getUserToken() async {
    return await SessionManager().get(SessionDataKey().tspLoginToken);
  }

  Future<int> getUserId() async {
    return await SessionManager().get(SessionDataKey().userId);
  }

  Future<String> getUsername() async {
    return await SessionManager().get(SessionDataKey().displayName);
  }

  Future<int> getPhoneNumber() async {
    return await SessionManager().get(SessionDataKey().tspContactNumber);
  }

  Future<String> getUserAddress() async {
    return await SessionManager().get(SessionDataKey().tspDetailedAddress);
  }

  Future<String> getEmailAddress() async {
    return await SessionManager().get(SessionDataKey().tspEmail);
  }

  void getDataFromSession() {
    getUserToken().then((value) => {
          setState(() {
            userToken = value.toString();
          }),
        });
    getUserId().then((value) => {
          userId = value,
          setState(() {
            userId = value;
          }),
        });
    getUsername().then((value) => {
          name = value.toString(),
          setState(() {
            name = value.toString();
          }),
        });
    getPhoneNumber().then((value) => {
          phoneNumber = value,
          setState(() {
            phoneNumber = value;
          }),
        });
    getUserAddress().then((value) => {
          setState(() {
            userAddress = value.toString();
            //   pri
          }),
        });
    getEmailAddress().then((value) => {
          setState(() {
            emailAddress = value.toString();
            //   pri
          }),
        });
  }
}

class AppVersion extends StatefulWidget {
  const AppVersion({Key? key}) : super(key: key);

  @override
  State<AppVersion> createState() => _AppVersionState();
}

class _AppVersionState extends State<AppVersion> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        // title: Text('App Version').paddingOnly(bottom: 10),
        content: Container(
            width: size.width * 0.9,
            // height: size.height * 0.4,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'App Version',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * fourteen,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.cancel,
                        size: 30,
                      )),
                ],
              ).paddingOnly(left: 20, right: 20, bottom: 10, top: 20),
              Row(
                children: [
                  Text(
                    'Your current application version is ',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * twelve,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '1.0',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * twelve,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ).paddingOnly(left: 20, right: 20, bottom: 20),
              Container(
                padding: const EdgeInsets.only(right: 0, left: 12),
                child: MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.orange,
                  child: Text(
                    "Ok".tr,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  elevation: 5,
                ),
              ).paddingOnly(bottom: 20),

              // ClipOval(
              //   child: Icon(Icons.cancel,size: 30,),
              // ).paddingOnly(bottom: 20)
            ])));
  }
}

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        // title: Text('App Version').paddingOnly(bottom: 10),
        content: Container(
            width: size.width * 0.9,
            // height: size.height * 0.4,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Check Update',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * twelve,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.cancel,
                        size: 30,
                      )),
                ],
              ).paddingOnly(left: 20, right: 20, bottom: 10, top: 20),
              Row(
                children: [
                  Text(
                    'Your application is up-to-date ',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * twelve,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ).paddingOnly(left: 20, right: 20, bottom: 10),
              Row(
                children: [
                  Text(
                    'Your app version : 1.0',
                    style: TextStyle(
                      color: Colors.black /*,fontWeight: FontWeight.w500*/,
                      fontSize: size.width * twelve,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ).paddingOnly(left: 20, right: 20, bottom: 20),
              Container(
                padding: const EdgeInsets.only(right: 0, left: 12),
                child: MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.orange,
                  child: Text(
                    "Ok".tr,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  elevation: 5,
                ),
              ).paddingOnly(bottom: 20),

              // Row(
              //   children: [
              //     Text(
              //       'Update app version available : 1.1',
              //       style: TextStyle(color: Colors.grey.shade700/*,fontWeight: FontWeight.w500*/,fontSize: size.width * twelve,
              //       ),
              //       textAlign: TextAlign.start,
              //     ),
              //   ],
              // ).paddingOnly(left: 20,right: 20,bottom: 10),
              // ClipOval(
              //   child: Icon(Icons.cancel,size: 30,),
              // ).paddingOnly(bottom: 20)
            ])));
  }
}
