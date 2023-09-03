/*
 * Copyright (c) 2020 .
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/features/profile/views/profile_view.dart';


import '../../../routes/app_routes.dart';
import '../../common/drawer_link_widget.dart';
import '../controllers/root_controller.dart';
// import '../techniciandashboard/controllers/root_controller.dart';
// import 'drawer_link_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        children: [
          // Obx(() {
          //   // if (!Get.find<AuthService>().isAuth) {
          //
          //     return
          //       GestureDetector(
          //       onTap: () {
          //         // Get.toNamed(Routes.LOGIN);
          //       },
          //       child: Container(
          //         padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          //         decoration: BoxDecoration(
          //           color: Theme.of(context).hintColor.withOpacity(0.1),
          //         ),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text("Welcome".tr, style: Get.textTheme.headline5!.merge(TextStyle(color: Get.theme.colorScheme.secondary))),
          //             SizedBox(height: 5),
          //             Text("Login account or create new one for free".tr, style: Get.textTheme.bodyText1),
          //             SizedBox(height: 15),
          //             Wrap(
          //               spacing: 10,
          //               children: <Widget>[
          //                 MaterialButton(
          //                   onPressed: () {
          //                     Get.toNamed(Routes.LOGIN);
          //                   },
          //                   color: Get.theme.colorScheme.secondary,
          //                   height: 40,
          //                   elevation: 0,
          //                   child: Wrap(
          //                     runAlignment: WrapAlignment.center,
          //                     crossAxisAlignment: WrapCrossAlignment.center,
          //                     spacing: 9,
          //                     children: [
          //                       Icon(Icons.exit_to_app_outlined, color: Get.theme.primaryColor, size: 24),
          //                       Text(
          //                         "Login".tr,
          //                         style: Get.textTheme.subtitle1!.merge(TextStyle(color: Get.theme.primaryColor)),
          //                       ),
          //                     ],
          //                   ),
          //                   shape: StadiumBorder(),
          //                 ),
          //                 MaterialButton(
          //                   color: Get.theme.focusColor.withOpacity(0.2),
          //                   height: 40,
          //                   elevation: 0,
          //                   onPressed: () {
          //                     // Get.toNamed(Routes.REGISTER);
          //                   },
          //                   child: Wrap(
          //                     runAlignment: WrapAlignment.center,
          //                     crossAxisAlignment: WrapCrossAlignment.center,
          //                     spacing: 9,
          //                     children: [
          //                       Icon(Icons.person_add_outlined, color: Get.theme.hintColor, size: 24),
          //                       Text(
          //                         "Register".tr,
          //                         style: Get.textTheme.subtitle1!.merge(TextStyle(color: Get.theme.hintColor)),
          //                       ),
          //                     ],
          //                   ),
          //                   shape: StadiumBorder(),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
            // }
            // else {
            //   return
            GestureDetector(
                onTap: () {
                  // Get.find<RootController>().changePageOutRoot(3);
                  Get.back();
                 // Get.toNamed(Routes.PROFILE);
                 // Get.to(ProfileView(userName : name.toString(),phoneNumber : phoneNumber,userEmailAddress : emailAddress.toString(),userAddress : userAddress.toString(),userTokenValue : userToken,userIdValue : userId));

                },
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                  ),
                  accountName: Text("Rajat M",
                    // Get.find<AuthService>().user.value.name!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  accountEmail: Text("rajat@gmail.com",
                    /*Get.find<AuthService>().user.value.email!,*/
                    style: Theme.of(context).textTheme.caption,
                  ),
                  currentAccountPicture: Stack(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                          child: CachedNetworkImage(
                            height: 80,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: "https://cdn-icons-png.flaticon.com/512/4140/4140048.png",
                            placeholder: (context, url) => Image.asset(
                              'assets/img/loading.gif',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 80,
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(Icons.check_circle, color: Get.theme.colorScheme.secondary, size: 24),
                      )
                    ],
                  ),
                ),
              ),
            // }
          // }
          // ),
          SizedBox(height: 20),
          // if (Get.find<AuthService>().user.value.isProvider)
            DrawerLinkWidget(
              icon: Icons.assignment_outlined,
              text: "My Bookings",
              onTap: (e) {
                Get.back();
                // Get.find<RootController>().changePage(0);
                Get.toNamed(Routes.SLIDE_DETAILS,arguments: "My Bookings" );

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
            icon: Icons.person_outline_sharp,
            text: "My Providers",
            onTap: (e) {
              // Get.offAndToNamed(Routes.E_PROVIDERS);
            },
          ),
          // DrawerLinkWidget(
          //   icon: Icons.person_add_outlined,
          //   text: "Add Member",
          //   onTap: (e) {
          //     Get.offAndToNamed(Routes.ADD_MEMBER);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.people_outline_rounded,
          //   text: "All Member",
          //   onTap: (e) {
          //     Get.offAndToNamed(Routes.ALL_MEMBER);
          //   },
          // ),
          DrawerLinkWidget(
            icon: Icons.notifications_none_outlined,
            text: "Notifications",
            onTap: (e) {
              // Get.offAndToNamed(Routes.NOTIFICATIONS);
            },
          ),
          // if (Get.find<AuthService>().user.value.isProvider)
          //   DrawerLinkWidget(
          //     icon: Icons.chat_outlined,
          //     text: "Messages",
          //     onTap: (e) {
          //       Get.back();
          //       // Get.find<RootController>().changePage(2);
          //     },
          //   ),
          // if (Get.find<AuthService>().user.value.isProvider)
          //   if (Get.find<SettingsService>().setting.value.modules!.contains("Subscription"))
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
          // if (Get.find<AuthService>().user.value.isProvider)
          //   if (Get.find<SettingsService>().setting.value.modules!.contains("Subscription"))
              DrawerLinkWidget(
                icon: Icons.account_circle_outlined,
                text: "My Profile",
                onTap: (e) async {
                  // await Get.offAndToNamed(Routes.WALLETS);
                  Get.back();
                  Get.toNamed(Routes.PROFILE);
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
          DrawerLinkWidget(
            icon: Icons.settings_outlined,
            text: "Settings",
            onTap: (e) {
              // Get.offAndToNamed(Routes.SETTINGS);
            },
          ),
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
}
