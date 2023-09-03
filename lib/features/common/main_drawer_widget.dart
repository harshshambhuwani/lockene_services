/*
 * Copyright (c) 2020 .
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:service/Admin/session/session.dart';
import 'package:service/features/profile/views/profile_view.dart';

import '../../../routes/app_routes.dart';
import '../../Admin/MyQuote/widgets/booking_actions_widget.dart';
import '../techniciandashboard/controllers/root_controller.dart';
import '../techniciandashboard/widget/check_country.dart';
import 'drawer_link_widget.dart';

class AdminDrawerWidget extends StatefulWidget {
  @override
  State<AdminDrawerWidget> createState() => _AdminDrawerWidgetState();
}

class _AdminDrawerWidgetState extends State<AdminDrawerWidget> {

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
    var size = MediaQuery.of(context).size;

    return Drawer(
      elevation: 0,
      child: ListView(
        children: [
            GestureDetector(
                onTap: () {
                  // Get.find<RootController>().changePageOutRoot(3);
                  Get.back();
                 // Get.toNamed(Routes.PROFILE);
                  Get.to(ProfileView(userName : name.toString(),phoneNumber : phoneNumber,userEmailAddress : emailAddress.toString(),userAddress : userAddress.toString(),userTokenValue : userToken,userIdValue : userId));

                },
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                  ),
                  accountName: Text(name.toString(),
                    // Get.find<AuthService>().user.value.name!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  accountEmail: Text(emailAddress.toString(),
                    /*Get.find<AuthService>().user.value.email!,*/
                    style: Theme.of(context).textTheme.caption,
                  ),

                  currentAccountPicture: Stack(
                    children: [
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                          child: CachedNetworkImage(
                            height: 75,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl:"https://cdn-icons-png.flaticon.com/512/4140/4140048.png",
                            placeholder: (context, url) => Image.asset(
                              'assets/img/loading.gif',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 75,
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error_outline),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(Icons.check_circle, color:Colors.black, size: 24),
                      )
                    ],
                  ),

                ),
              ),


          // }
          // }
          // ),
          // SizedBox(height: 20),
          // if (Get.find<AuthService>().user.value.isProvider)
          GestureDetector(
            onTap: (){
              Get.back();
              showDialog(
                barrierDismissible: false,
                  context: context,
                  builder: (_) {
                    return CheckCountry();
                    // return CustomDialogService();
                  });

              // Get.toNamed(Routes.ADD_KYC);

            },
            child: Container(
              height: 30,
              width: double.infinity,
              // color: Colors.orange,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Unlock More Features',
                      style: Get.textTheme.bodyText2!.merge(TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500))

                  ),
                  Text('Click Here',
                      style: Get.textTheme.bodyText2!.merge(TextStyle(fontSize: 14,color: Colors.orange,fontWeight: FontWeight.w500))

                  ),
                ],
              ),
            ).marginSymmetric(horizontal: 20.0),
          ),
            DrawerLinkWidget(
              icon: Icons.assignment_outlined,
              text: "My Bookings",
              onTap: (e) {
                Get.back();
                // Get.find<RootController>().changePage(0);
                Get.toNamed(Routes.SLIDE_DETAILS,arguments: "My Bookings");
              },
            ),
          DrawerLinkWidget(
            icon: Icons.folder_special_outlined,
            text: "My Attendence",
            onTap: (e) {
              Get.offAndToNamed(Routes.ATTENDENCE);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.person_add_outlined,
            text: "Add Team Member",
            onTap: (e) {
              Get.offAndToNamed(Routes.ADD_MEMBER);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.people_outline_rounded,
            text: "My Team",
            onTap: (e) {
              // Get.offAndToNamed(Routes.ALL_MEMBER);
              Get.offAndToNamed(Routes.ALLTEAM);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.sticky_note_2_outlined,
            text: "My Quote",
            onTap: (e) {
              Get.offAndToNamed(Routes.All_QUOTE,arguments: "Total Quotes");
            },
          ),
          DrawerLinkWidget(
            icon: Icons.work_outline_outlined,
            text: "My Job",
            onTap: (e) {
              Get.offAndToNamed(Routes.All_QUOTE,arguments: "Total Jobs");
            },
          ),
          DrawerLinkWidget(
            icon: Icons.monetization_on_outlined,
            text: "My Invoice",
            onTap: (e) {
              Get.offAndToNamed(Routes.All_QUOTE,arguments: "Total Invoice");

            },
          ),
          DrawerLinkWidget(
            icon: Icons.notifications_none_outlined,
            text: "Notifications",
            onTap: (e) {
              // Get.offAndToNamed(Routes.NOTIFICATIONS);
            },
          ),
          ListTile(
                dense: true,
                title: Text(
                  "Report & Reviews".tr,
                  style: Get.textTheme.caption,
                ),
                trailing: Icon(
                  Icons.remove,
                  color: Get.theme.focusColor.withOpacity(0.3),
                ),
              ),
          // if (Get.find<AuthService>().user.value.isProvider)
          //   if (Get.find<SettingsService>().setting.value.modules!.contains("Subscription"))
              DrawerLinkWidget(
                icon: Icons.fact_check_outlined,
                text: "My Reviews",
                onTap: (e) {
                  Get.back();
                  Get.find<RootController>().currentIndex(1);
                },
              ),
          // if (Get.find<AuthService>().user.value.isProvider)
          //   if (Get.find<SettingsService>().setting.value.modules!.contains("Subscription"))
              DrawerLinkWidget(
                icon: Icons.auto_awesome_mosaic_outlined,
                text: "My Report",
                onTap: (e) {
                  // Get.offAndToNamed(Routes.PACKAGES);
                },
              ),

          DrawerLinkWidget(
                icon: Icons.account_circle_outlined,
                text: "My Profile",
                onTap: (e) async {
                  Get.back();
                  Get.to(ProfileView(userName : name.toString(),phoneNumber : phoneNumber,userEmailAddress : emailAddress.toString(),userAddress : userAddress.toString(),userTokenValue : userToken,userIdValue : userId));
                },
              ),
              DrawerLinkWidget(
                icon: Icons.list_alt_outlined,
                text: "Subscription Plans",
                onTap: (e) async {
                  // await Get.offAndToNamed(Routes.WALLETS);
                  Get.back();
                  Get.toNamed(Routes.SUBSCRIPTIONSPACKAGES);
                },
              ),
          ListTile(
            dense: true,
            title: Text(
              "Application preferences".tr,
              style: Get.textTheme.caption,
            ),
            trailing: Icon(
              Icons.remove,
              color: Get.theme.focusColor.withOpacity(0.3),
            ),
          ),
          // if (Get.find<AuthService>().user.value.isProvider)
            DrawerLinkWidget(
              icon: Icons.person_outline,
              text: "Account",
              onTap: (e) {
                Get.back();
                Get.find<RootController>().currentIndex(2);
              },
            ),
          // DrawerLinkWidget(
          //   icon: Icons.settings_outlined,
          //   text: "Settings",
          //   onTap: (e) {
          //     // Get.offAndToNamed(Routes.SETTINGS);
          //   },
          // ),

          // DrawerLinkWidget(
          //   icon: Icons.translate_outlined,
          //   text: "Languages",
          //   onTap: (e) {
          //     // Get.offAndToNamed(Routes.SETTINGS_LANGUAGE);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.brightness_6_outlined,
          //   text: Get.isDarkMode ? "Light Theme" : "Dark Theme",
          //   onTap: (e) {
          //     // Get.offAndToNamed(Routes.SETTINGS_THEME_MODE);
          //   },
          // ),
          ListTile(
            dense: true,
            title: Text(
              "Help & Privacy",
              style: Get.textTheme.caption,
            ),
            trailing: Icon(
              Icons.remove,
              // color: Get.theme.focusColor.withOpacity(0.3),
            ),
          ),
          DrawerLinkWidget(
            icon: Icons.help_outline,
            text: "Help & FAQ",
            onTap: (e) {
              // Get.offAndToNamed(Routes.HELP);
            },
          ),
          // if (Get.find<AuthService>().user.value.isProvider) CustomPageDrawerLinkWidget(),
          // Obx(() {
          //   // if (Get.find<AuthService>().isAuth) {
          //     return DrawerLinkWidget(
          //       icon: Icons.logout,
          //       text: "Logout",
          //       onTap: (e) async {
          //         // await Get.find<AuthService>().removeCurrentUser();
          //         // await Get.offNamedUntil(Routes.LOGIN, (Route route) {
          //         //   if (route.settings.name == Routes.LOGIN) {
          //         //     return true;
          //         //   }
          //         //   return false;
          //         // });
          //       },
          //     );
          //     }
          // //   } else {
          // //     return SizedBox(height: 0);
          // //   }
          // // }),
          // // if (Get.find<SettingsService>().setting.value.enableVersion!)
          // //   ListTile(
          // //     dense: true,
          // //     title: Text(
          // //       "Version".tr + " " + Get.find<SettingsService>().setting.value.appVersion!,
          // //       style: Get.textTheme.caption,
          // //     ),
          // //     trailing: Icon(
          // //       Icons.remove,
          // //       color: Get.theme.focusColor.withOpacity(0.3),
          // //     ),
          // //   )
          //   ,),
        ],
      ),
    );
  }

  void getDataFromSession() {
    getUserToken().then((value) => {
      setState((){
        userToken = value.toString();
      }),
    });
    getUserId().then((value) => {
      userId = value,
      setState((){
        userId = value;
      }),
    });
    getUsername().then((value) => {
      name = value.toString(),
      setState((){
        name = value.toString();
      }),
    });
    getPhoneNumber().then((value) => {
      phoneNumber = value,
      setState((){
        phoneNumber = value;
      }),
    });
    getUserAddress().then((value) => {
      setState((){
        userAddress = value.toString();
        //   pri
      }),
    });
    getEmailAddress().then((value) => {
      setState((){
        emailAddress = value.toString();
        //   pri
      }),
    });
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
}
