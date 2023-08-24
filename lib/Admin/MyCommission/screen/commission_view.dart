import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/ui.dart';
import '../../../styles/styles.dart';
import '../controller/commission_controller.dart';


class CommissionView extends GetView<CommissionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Commission".tr,
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
          Row(
            children: [
              Text('Due : ',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen,fontWeight: FontWeight.w500 ),),
              Text('500',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),),
              Text('₹',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(left: 5.0),

            ],
          ).marginOnly(right: 20.0),
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [

          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Due Status ',style: TextStyle(color: Colors.black,fontSize: Get.width * sixteen,fontWeight: FontWeight.w600 ),),
                          Divider(color: Colors.grey,thickness: 1,),

                          Text('Type ',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).paddingSymmetric(vertical: 2.0),
                          Text('Req No. ',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('Completed On ',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('Tax Id',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('Payment Status',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('Payment Method',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),

                        ],
                      ),
                    ).paddingOnly(left: 20.0)),
                Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [


                          Text("Paid",style: TextStyle(color: Colors.green,fontSize: Get.width * sixteen,fontWeight: FontWeight.w600),).marginOnly(left: 5),
                          Divider(color: Colors.grey,thickness: 1,),
                          Text('Service',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).paddingSymmetric(vertical: 2.0),
                          Text('91586',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(left: 5).marginOnly(top: 5.0),
                          Text('16 Mar 2023',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(left: 5).marginOnly(top: 5.0),
                          Text('pay_jbabaj',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('Captured',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('UPI',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),

                        ],
                      ),
                    ).paddingOnly(right: 20.0)),


              ],
            ).paddingSymmetric(vertical: 15.0),
          ).marginOnly(left: 20.0,right: 20.0,top: 5),
          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Due Status ',style: TextStyle(color: Colors.black,fontSize: Get.width * sixteen,fontWeight: FontWeight.w600),),
                          Divider(color: Colors.grey,thickness: 1,),

                          Text('Type ',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).paddingSymmetric(vertical: 2.0),
                          Text('Req No. ',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('Completed On ',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('Tax Id',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('Payment Status',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('Payment Method',style: TextStyle(color: Colors.black,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),

                        ],
                      ),
                    ).paddingOnly(left: 20.0)),
                Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Un-Paid",style: TextStyle(color: Colors.red,fontSize: Get.width * sixteen,fontWeight: FontWeight.w600 ),).marginOnly(left: 5),
                          Divider(color: Colors.grey,thickness: 1,),
                          Text('Installation',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).paddingSymmetric(vertical: 2.0),
                          Text('91586',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(left: 5).marginOnly(top: 5.0),
                          Text('16 Mar 2023',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(left: 5).marginOnly(top: 5.0),
                          Text('-',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ,),).marginOnly(top: 5.0),
                          Text('-',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),
                          Text('-',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * fourteen ),).marginOnly(top: 5.0),

                        ],
                      ),
                    ).paddingOnly(right: 20.0)),


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
