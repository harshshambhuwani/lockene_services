import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../controller/support_controller.dart';


class SupportView extends GetView<SupportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Support Us".tr,
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
          InkWell(onTap: (){
              Get.toNamed(Routes.ASKQUERY);
          },
              child: Icon(Icons.add_circle_outline,size: 20,color: Colors.orange,).marginOnly(right: 20.0)/*.paddingOnly(left: 10)*/),
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [

      Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: Ui.getBoxDecoration(),
      child: Column(
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Text('22 Apr,2023')
           ],
         ),
          Row(
            children: [
              Text("Subject :".tr,style: TextStyle( color: Colors.orange,fontWeight: FontWeight.w500,),),
                    Flexible(
                        child: Text(
                      "Complaint regarding salary issues.".tr,
                      style: TextStyle(color: Colors.black),
                      maxLines: 3,
                      softWrap: false,
                    ).paddingOnly(left: 10)),
                  ],
          ).paddingOnly(bottom: 10,top: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description :".tr,style: TextStyle( color: Colors.orange,fontWeight: FontWeight.w500)),
              Flexible(
                  child: Text("Complaint regarding salary issuess,I got less salary then my working hours".tr,style: TextStyle( color: Colors.black),maxLines: 5,).paddingOnly(left: 10)),
            ],
          )
        ],

      ),
    ),
      Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: Ui.getBoxDecoration(),
      child: Column(
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Text('24 Apr,2023')
           ],
         ),
          Row(
            children: [
              Text("Subject :".tr,style: TextStyle( color: Colors.orange,fontWeight: FontWeight.w500,),),
                    Flexible(
                        child: Text(
                      "Complaint regarding salary issues.".tr,
                      style: TextStyle(color: Colors.black),
                      maxLines: 3,
                      softWrap: false,
                    ).paddingOnly(left: 10)),
                  ],
          ).paddingOnly(bottom: 10,top: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description :".tr,style: TextStyle( color: Colors.orange,fontWeight: FontWeight.w500)),
              Flexible(
                  child: Text("Complaint regarding salary issuess,I got less salary then my working hours".tr,style: TextStyle( color: Colors.black),maxLines: 5,).paddingOnly(left: 10)),
            ],
          )
        ],

      ),
    ),
    ])
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
