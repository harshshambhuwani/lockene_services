import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/ui.dart';
import '../../../styles/styles.dart';
import '../controller/payment_controller.dart';


class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payments".tr,
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
          //   onTap: (){
          //     print("Hi");
          //     showDialog(
          //         context: context,
          //         builder: (_) {
          //           return CustomDialog();
          //           // return CustomDialogService();
          //         });
          //   },
          //     child: Icon(Icons.add_circle_outline, color: Get.theme.hintColor).paddingSymmetric(horizontal: 20)),
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          // buildSearchBar(),
          // Text('My Custom Service are ...'.tr,
          //   style: Get.textTheme.subtitle2!,).marginSymmetric(horizontal: 20.0),

          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Type :',style: TextStyle(color: Colors.black,fontSize: Get.width *   fourteen ,fontWeight: FontWeight.w600  ),).paddingSymmetric(vertical: 2.0).marginOnly(top: 5.0),
                              Text('Service',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).paddingSymmetric(vertical: 2.0).marginOnly(top: 5.0,left: 5),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Text('Req No. :',style: TextStyle(color: Colors.black,fontSize: Get.width * eleven ),),
                          //     Text('91586',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * eleven ),).marginOnly(left: 5),
                          //   ],
                          // ).marginOnly(top: 5.0),
                          Row(
                            children: [
                              Text('Date :',style: TextStyle(color: Colors.black,fontSize: Get.width *   fourteen ,fontWeight: FontWeight.w600  ),),
                              Text('16 Mar 2023',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(left: 5),
                            ],
                          ).marginOnly(top: 5.0),
                          Row(
                            children: [
                              Text('Amount :',style: TextStyle(color: Colors.black,fontSize: Get.width *   fourteen ,fontWeight: FontWeight.w600  ),),
                              Text("₹ 5000",style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(left: 5),
                            ],
                          ).marginOnly(top: 5.0),
                          Row(
                            children: [
                              Text('Payment Status :',style: TextStyle(color: Colors.black,fontSize: Get.width *   fourteen ,fontWeight: FontWeight.w600  ),),
                              Text("Paid",style: TextStyle(color: Colors.green,fontSize: Get.width * fourteen,fontWeight: FontWeight.w500 ),).marginOnly(left: 5),
                            ],
                          ).marginOnly(top: 5.0),
                        ],
                      ),
                    ).paddingOnly(left: 20.0)),
                Expanded(
                    flex: 2,
                    child:
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            child: Column(
                              children: [
                                Text('Req. No.',style: TextStyle(color: Colors.black,fontSize: Get.width * twelve ),),
                                Text('986',style: TextStyle(color: Colors.white,fontSize: Get.width * twelve,fontWeight: FontWeight.w500 ),),
                              ],
                            )),
                      ],
                    )),


              ],
            ).paddingSymmetric(vertical: 15.0),
          ).marginOnly(left: 20.0,right: 20.0,top: 10),
          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Type :',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ,fontWeight: FontWeight.w600 ),).paddingSymmetric(vertical: 2.0).marginOnly(top: 5.0),
                              Text('Service',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).paddingSymmetric(vertical: 2.0).marginOnly(top: 5.0,left: 5),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Text('Req No. :',style: TextStyle(color: Colors.black,fontSize: Get.width * eleven ),),
                          //     Text('91586',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * eleven ),).marginOnly(left: 5),
                          //   ],
                          // ).marginOnly(top: 5.0),
                          Row(
                            children: [
                              Text('Date :',style: TextStyle(color: Colors.black,fontSize: Get.width *  fourteen ,fontWeight: FontWeight.w600 ),),
                              Text('16 Mar 2023',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(left: 5),
                            ],
                          ).marginOnly(top: 5.0),
                          Row(
                            children: [
                              Text('Amount :',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ,fontWeight: FontWeight.w600 ),),
                              Text("₹ 5000",style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(left: 5),
                            ],
                          ).marginOnly(top: 5.0),
                          Row(
                            children: [
                              Text('Payment Status :',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ,fontWeight: FontWeight.w600 ),),
                              Text("Un-Paid",style: TextStyle(color: Colors.red,fontSize: Get.width * fourteen,fontWeight: FontWeight.w500 ),).marginOnly(left: 5),
                            ],
                          ).marginOnly(top: 5.0),
                        ],
                      ),
                    ).paddingOnly(left: 20.0)),
                Expanded(
                    flex: 2,
                    child:
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            child: Column(
                              children: [
                                Text('Req. No.',style: TextStyle(color: Colors.black,fontSize: Get.width * twelve ),),
                                Text('986',style: TextStyle(color: Colors.white,fontSize: Get.width * twelve,fontWeight: FontWeight.w500  ),),
                              ],
                            )),
                      ],
                    )),


              ],
            ).paddingSymmetric(vertical: 15.0),
          ).marginOnly(left: 20.0,right: 20.0,top: 10),


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
