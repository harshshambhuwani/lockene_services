import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/subscriptionhistory_controller.dart';


class SubscriptionHistory extends GetView<SubscriptionHistoryController> {
  final _controller = PageController(initialPage: 0);
  // final PageController controller = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subscription History".tr,
          style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => Get.back(),
        ),
        actions: [
          // InkWell(
          //     onTap: (){
          //       print("Hi");
          //       Get.toNamed(Routes.MYSUBSCRIPTION);
          //     },
          //     child:
          //     Text('My Plans',
          //       // textAlign: TextAlign.center,
          //       style: TextStyle(
          //           color: Colors.orange,
          //           fontSize: Get.width * fourteen,
          //           fontWeight: FontWeight.w500),
          //     ).paddingSymmetric(horizontal: 20,vertical: 20)),
        ],

        elevation: 0,
      ),
      body: ListView(
        children: [

          // Text(
          //   "Subscription history".tr,
          //   style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
          // ).paddingOnly(left: 20,right: 20.0,top: 20,bottom: 10.0),
          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "07/04/23 ".tr,
                      style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.blue)),
                    ),
                    Text(
                      "\$ 6,300".tr,
                      style: Get.textTheme.subtitle1!.merge(TextStyle(color: Colors.black)),
                    ),
                  ],
                ).paddingSymmetric(vertical: 5.0),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Core Pack".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                    ),
                    Text(
                      "Active".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.green)),
                    ),
                  ],
                ).paddingSymmetric(vertical: 3.0),
                Text(
                  "07/04/23 - 06/05/23".tr,
                  style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                ).paddingSymmetric(vertical: 3.0),
                SizedBox(height: 8,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment type :".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                    ),
                    Text(
                      "Card".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
                    ).paddingOnly(left: 10),
                  ],
                ).paddingSymmetric(vertical: 3.0),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaction Id :".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                    ),
                    Text(
                      "#5115151".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
                    ).paddingOnly(left: 10),
                  ],
                ).paddingSymmetric(vertical: 3.0),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GST (%) :".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                    ),
                    Text(
                      "18 %".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
                    ).paddingOnly(left: 10),
                  ],
                ).paddingSymmetric(vertical: 3.0),



              ],
            ).paddingSymmetric(vertical: 15.0,horizontal: 20),
          ).marginOnly(left: 20.0,right: 20.0,top: 5),
          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "07/03/23 ".tr,
                      style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.blue)),
                    ),
                    Text(
                      "\$ 6,300".tr,
                      style: Get.textTheme.subtitle1!.merge(TextStyle(color: Colors.black)),
                    ),
                  ],
                ).paddingSymmetric(vertical: 5.0),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Core Pack".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                    ),
                    Text(
                      "Expired".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.red)),
                    ),
                  ],
                ).paddingSymmetric(vertical: 3.0),
                Text(
                  "07/03/23 - 06/04/23".tr,
                  style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                ).paddingSymmetric(vertical: 3.0),
                SizedBox(height: 8,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment type :".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                    ),
                    Text(
                      "UPI".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
                    ).paddingOnly(left: 10),
                  ],
                ).paddingSymmetric(vertical: 3.0),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaction Id :".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                    ),
                    Text(
                      "#5115151".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
                    ).paddingOnly(left: 10),
                  ],
                ).paddingSymmetric(vertical: 3.0),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GST (%) :".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                    ),
                    Text(
                      "18 %".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
                    ).paddingOnly(left: 10),
                  ],
                ).paddingSymmetric(vertical: 3.0),



              ],
            ).paddingSymmetric(vertical: 15.0,horizontal: 20),
          ).marginOnly(left: 20.0,right: 20.0,top: 5),
          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "07/02/23 ".tr,
                      style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.blue)),
                    ),
                    Text(
                      "\$ 6,300".tr,
                      style: Get.textTheme.subtitle1!.merge(TextStyle(color: Colors.black)),
                    ),
                  ],
                ).paddingSymmetric(vertical: 5.0),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Core Pack".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                    ),
                    Text(
                      "Expired".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.red)),
                    ),
                  ],
                ).paddingSymmetric(vertical: 3.0),
                Text(
                  "07/02/23 - 06/03/23".tr,
                  style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                ).paddingSymmetric(vertical: 3.0),
                SizedBox(height: 8,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment type :".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                    ),
                    Text(
                      "Card".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
                    ).paddingOnly(left: 10),
                  ],
                ).paddingSymmetric(vertical: 3.0),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaction Id :".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                    ),
                    Text(
                      "#5115151".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
                    ).paddingOnly(left: 10),
                  ],
                ).paddingSymmetric(vertical: 3.0),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GST (%) :".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                    ),
                    Text(
                      "18 %".tr,
                      style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
                    ).paddingOnly(left: 10),
                  ],
                ).paddingSymmetric(vertical: 3.0),



              ],
            ).paddingSymmetric(vertical: 15.0,horizontal: 20),
          ).marginOnly(left: 20.0,right: 20.0,top: 5),
          SizedBox(height: 20,)

        ],

      ),
    );
  }

}
