import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';


import '../../../styles/styles.dart';
import '../../account/widgets/profile_widget.dart';
import '../../common/block_button_widget.dart';
import '../../common/text_field_widget.dart';
import '../../common/ui.dart';
import '../../../routes/app_routes.dart';
import '../controllers/profile_controller.dart';
import '../widgets/delete_account_widget.dart';
import '../widgets/image_field_widget.dart';
import '../widgets/phone_field_widget.dart';

class ProfileView extends GetView<ProfileController> {
  final bool hideAppBar;

  ProfileView({this.hideAppBar = false}) {
    // controller.profileForm = new GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    controller.profileForm = new GlobalKey<FormState>();
    return Scaffold(
        appBar: hideAppBar
            ? null
            : AppBar(
                title: Text(
                  "My Profile".tr,
                  style: context.textTheme.subtitle1,
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                  onPressed: () => Get.back(),
                ),
                elevation: 0,
          actions: [
            InkWell(onTap:(){
                  Get.toNamed(Routes.EDITPROFILE);
            },
                child: Row(
                  children: [
                    Text('Edit',style:context.textTheme.subtitle1!.merge(TextStyle(color: Colors.black),)),
                    Icon(Icons.edit,size: 18,color: Colors.black,).paddingOnly(left: 5.0)
                  ],
                ).paddingSymmetric(horizontal: 20,vertical: 20))
          ],
              ),
        body: ListView(
          primary: true,
          children: [
            Text("Rajat Kumar".tr, style: Get.textTheme.headline5,textAlign:  TextAlign.center,).paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: Ui.getBoxDecoration(
                    radius: 14,
                    border: Border.all(width: 5, color: Colors.white),
                    color: Colors.black,

                  ),
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(

                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.fitWidth,
                          width: 90,
                          height: 90,
                          imageUrl:'https://cdn-icons-png.flaticon.com/512/2482/2482458.png',
                          placeholder: (context, url) => Image.asset(
                            'assets/img/loading.gif',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 90,
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error_outline),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: Ui.getBoxDecoration(),
              child: Column(
                children: [
                  AccountLinkWidget(
                    icon: Icon(Icons.person_outline, color: Colors.orange),
                    text: Text("Rajat Kumar ".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500),),
                    onTap: (e) {
                      // Get.toNamed(Routes.PROFILE);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.phone_android_outlined, color: Colors.orange),
                    text: Text("9689455261".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.find<RootController>().changePage(0);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.alternate_email, color: Colors.orange),
                    text: Text("rajat@gmail.com".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.toNamed(Routes.NOTIFICATIONS);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.location_on, color: Colors.orange),
                    text: Text("Duplex No. 60, Lokhvihar Park,Bhilgaon,Nagpur".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.find<RootController>().changePage(2);
                    },
                  ),
                ],
              ),
            ),


            // BlockButtonWidget(
            //     text: Stack(
            //       alignment: AlignmentDirectional.center,
            //       children: [
            //         SizedBox(
            //           width: double.infinity,
            //           child: Text(
            //             "Edit Profile".tr,
            //             textAlign: TextAlign.center,
            //             style: Get.textTheme.headline6!.merge(
            //               TextStyle(color: page),
            //             ),
            //           ),
            //         ),
            //         // Icon(Icons.check, color: page, size: 22)
            //       ],
            //     ),
            //     color: Colors.orange,
            //     onPressed: () {
            //       // EDITPROFILE
            //       Get.toNamed(Routes.EDITPROFILE);
            //
            //
            //     }).marginSymmetric(horizontal: 20.0),
            BlockButtonWidget(
                text: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Complete KYC".tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headline6!.merge(
                      TextStyle(color: page),
                    ),
                  ),
                ),
                color: Colors.grey,
                onPressed: () {
                  // ADD_KYC
                  Get.toNamed(Routes.ADD_KYC);
                  // Get.toNamed(Routes.VIEW_JOB, arguments:0);
                }).marginSymmetric(horizontal: 20.0,vertical: 10),
            // BlockButtonWidget(
            //     text: Stack(
            //       alignment: AlignmentDirectional.center,
            //       children: [
            //         SizedBox(
            //           width: double.infinity,
            //           child: Text(
            //             "Mark Attendence".tr,
            //             textAlign: TextAlign.center,
            //             style: Get.textTheme.headline6!.merge(
            //               TextStyle(color: page),
            //             ),
            //           ),
            //         ),
            //         // Icon(Icons.check, color: page, size: 22)
            //       ],
            //     ),
            //     color: Colors.orange,
            //     onPressed: () {
            //       // Get.offAndToNamed(Routes.MARKATTENDENCE);
            //
            //     }).marginSymmetric(horizontal: 20.0,vertical: 10),
          ],
        ));
  }
}
