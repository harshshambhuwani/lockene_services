import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/Admin/MySupport/widgets/ask_query_widget.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/ui.dart';
import '../../../styles/styles.dart';
import '../controller/asksupport_controller.dart';
import '../controller/support_controller.dart';


class AskQueryView extends GetView<AskQueryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ask Query".tr,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            // width: Get.width*0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/free-vector/flat-design-illustration-customer-support_23-2148887720.jpg?w=740&t=st=1681726719~exp=1681727319~hmac=fe2fd86c8d9dea710cb65870198a119ad91add88fb9e1518d3545702a67b24c5'),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Row(
            children: [
              Text('Ask your query here...',textAlign: TextAlign.start,
                style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
              ),
            ],
          ).paddingOnly(bottom: 15),
          AskQueryWidget(
            icon: Icon(Icons.edit, color: Colors.orange,size: 22,),
            text:
            TextFormField(
              cursorColor: Colors.orange,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
              decoration: InputDecoration(
                isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 5),
                hintText: 'Please enter subject',
                hintStyle: TextStyle(fontSize: 14),
                // labelText: 'Invoice title',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                hintMaxLines: 2
              ),
            ),
            onTap: (e) {
              // Get.toNamed(Routes.PROFILE);
            },
          ),
          AskQueryWidget(
            icon: Icon(Icons.format_list_bulleted, color: Colors.orange,size: 22,),
            text:
            TextFormField(
              cursorColor: Colors.orange,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(bottom: 5),
                hintText: 'Please enter description',
                hintStyle: TextStyle(fontSize: 14),
                // labelText: 'Invoice title',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                hintMaxLines: 2,
              ),
            ),
            onTap: (e) {
              // Get.toNamed(Routes.PROFILE);
            },
          ),
          SizedBox(height: 10,),
          BlockButtonWidget(
              text: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Submit".tr,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline6!.merge(
                        TextStyle(color: page),
                      ),
                    ),
                  ),
                  // Icon(Icons.check, color: page, size: 22)
                ],
              ),
              color: Colors.orange,
              onPressed: () {

               Get.back();

              }).marginSymmetric(horizontal: 10.0).paddingOnly(bottom: 20),
          SizedBox(height: 10,),

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
