import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/my_webview_widget.dart';
import '../../../features/common/ui.dart';
import '../controller/aboutus_controller.dart';


class AboutUsView extends GetView<AboutUsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us".tr,
          style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => Get.back(),
        ),
        // actions: [
        //   Row(
        //     children: [
        //       Text('Due : ',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen,fontWeight: FontWeight.w500 ),),
        //       Text('500',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),),
        //       Text('₹',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(left: 5.0),
        //
        //     ],
        //   ).marginOnly(right: 20.0),
        // ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Column(
              children: [
                Container(
                  height: Get.height*0.15,
                  width: Get.width*0.5,
                  child: Image.asset('assets/images/logo_img.png'),
                ),
                Text('Lockene FSM',
                  style: Get.textTheme.headline6!.merge(TextStyle(fontWeight: FontWeight.w500)),

                ).paddingOnly(bottom: 25),
                Row(
                  children: [
                    Text('Company Details',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),

                    ).paddingOnly(bottom: 5),
                  ],
                ).paddingSymmetric(horizontal:30.0),
                Row(children: [
                  Icon(Icons.business,size: 22,color: Colors.orange,).paddingOnly(right: 15),
                  Text('Lockene,Inc.',
                    style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),

                  )
                ],).paddingSymmetric(horizontal: 30.0,vertical: 5),
                Row(children: [
                  Icon(Icons.email_outlined,size: 22,color: Colors.orange,).paddingOnly(right: 15),
                  Text('info@lockene.us',
                    style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),

                  )
                ],).paddingSymmetric(horizontal: 30.0,vertical: 5).marginOnly(bottom: 25),
                // Row(children: [
                //   Icon(Icons.call,size: 22,color: Colors.orange,).paddingOnly(right: 15),
                //   Text('02071 531-531',
                //     style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                //
                //   )
                // ],).paddingSymmetric(horizontal: 30.0,vertical: 5),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //   Icon(Icons.location_on,size: 22,color: Colors.orange,).paddingOnly(right: 15),
                //   Flexible(
                //     child: Text('Plot No.74,Deshpande Layout,Nagpur,Maharashtra 440008.',
                //       style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                //
                //     ),
                //   )
                // ],).paddingSymmetric(horizontal: 30.0,vertical: 5).marginOnly(bottom: 25),


              ],
            ),
          ).marginOnly(left: 20.0,right: 20.0,top: 5,bottom: 10),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyWebView(url: 'https://lockene.us/privacy-policy/'),
                ),
              );

              },
            child: Container(
              // height: 80,
              decoration: Ui.getBoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.sticky_note_2_rounded,
                        size: 22,
                        color: Colors.orange,
                      ).paddingOnly(right: 15),
                      Text(
                        'Privacy Policy',
                        style: Get.textTheme.subtitle2!
                            .merge(TextStyle(fontWeight: FontWeight.w500)),
                      )
                    ],
                  ).paddingOnly(left: 30.0, top: 5, bottom: 5.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 22,
                    color: Colors.orange,
                  ),

                ],

              ).paddingOnly(top: 10,bottom: 10,right: 30),
            ).paddingSymmetric(horizontal: 20),
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyWebView(url: 'https://lockene.us/terms-condition/'),
                ),
              );
            },
            child: Container(
              // height: 80,
              decoration: Ui.getBoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.list_alt_outlined,
                        size: 22,
                        color: Colors.orange,
                      ).paddingOnly(right: 15),
                      Text(
                        'Terms of service',
                        style: Get.textTheme.subtitle2!
                            .merge(TextStyle(fontWeight: FontWeight.w500)),
                      )
                    ],
                  ).paddingOnly(left: 30.0, top: 5,bottom: 5.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 22,
                    color: Colors.orange,
                  ),

                ],

              ).paddingOnly(top: 10,bottom: 10,right: 30),
            ).paddingSymmetric(horizontal: 20,vertical: 10),
          ),
        ],

      ),
    );
  }

  Widget buildSearchBar() {
    return Hero(
      tag: Get.arguments ?? '',
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(
              color: Get.theme.focusColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 0),
              child: Icon(Icons.search, color: Colors.black),
            ),
            Expanded(
              child: Material(
                color: Colors.grey.shade100,
                child: TextField(
                  // controller: controller.textEditingController,
                  style: Get.textTheme.bodyText2,
                  onSubmitted: (value) {
                    controller.searchEServices(keywords: value);
                  },
                  autofocus: true,
                  cursorColor: Get.theme.focusColor,
                  decoration: Ui.getInputDecoration(hintText: "Search for service...".tr),
                ),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
