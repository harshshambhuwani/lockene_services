import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:ticket_pass_package/ticket_pass.dart';

import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/mysubscription_controller.dart';


class MySubscriptionView extends GetView<MySubscriptionController> {
  final _controller = PageController(initialPage: 0);
  // final PageController controller = PageController(initialPage: 0);


  List<String> sample = <String>[
    "Manage unlimited clients.",
    "Send unlimited invoices and quotes.",
    "Accept and track payment.",
    "Real-time scheduling for jobs.",
    "Get real-time jobs updates.",

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Plans".tr,
          style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => Get.back(),
        ),

        elevation: 0,
      ),
      body: ListView(
        children: [
          Text(
            "Active Plan".tr,
            style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
          ).paddingOnly(left: 20,right: 20.0,top: 10,bottom: 10.0),


          Container(
             height: 190.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/subscript.png'),
                    fit: BoxFit.cover, // or BoxFit.contain, depending on your needs
                  ),
                  // color:Colors.orange,
                  boxShadow: [
                    BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                  ],
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10) )
              ),
              child: Row(
                children: [
                  Expanded(
                    flex:2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Core Pack',
                            style: Get.textTheme.subtitle1!.merge(TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)
                            ),
                          ),

                          Column(
                            children: [
                              Text(
                                '\$ 6,300',
                                style: Get.textTheme.headline6!.merge(TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                              ),
                              Text(
                                'per month',
                                style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                              ),

                            ],
                          ),

                        ],
                      ).paddingOnly(left: 10)),
                  Expanded(flex:5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height:   Get.height*0.028,
                          // ),
                          Text(
                            'Features',
                            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                          ),
                          SizedBox(
                            height:   Get.height*0.01,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.circle,size: 8,color: Colors.white,)/*.paddingOnly(left: 5.0)*/,
                              Flexible(
                                child: Text(
                                  // maxLines: 3,
                                  // overflow: TextOverflow.ellipsis,
                                  // softWrap: true,
                                  'All Lite Monthly features included.',
                                  style: Get.textTheme.bodyText2!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.white)),
                                ).marginOnly(left: 10,right: 5.0),
                              ),

                            ],).paddingSymmetric(vertical: 3.0),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.circle,size: 8,color: Colors.white,)/*.paddingOnly(left: 5.0)*/,
                              Flexible(
                                child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  '1 User included.',
                                  style: Get.textTheme.bodyText2!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.white)),
                                ).marginOnly(left: 10),
                              ),

                            ],).paddingSymmetric(vertical: 3.0),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.circle,size: 8,color: Colors.white,)/*.paddingOnly(left: 5.0)*/,
                              Flexible(
                                child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  'Real-time scheduling for jobs.',
                                  style: Get.textTheme.bodyText2!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.white)),
                                ).marginOnly(left: 10),
                              ),

                            ],).paddingSymmetric(vertical: 3.0),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.circle,size: 8,color: Colors.white,)/*.paddingOnly(left: 5.0)*/,
                              Flexible(
                                child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,

                                  '1-on-1 product support.',
                                  style: Get.textTheme.bodyText2!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.white)),
                                ).marginOnly(left: 10),
                              ),

                            ],).paddingSymmetric(vertical: 3.0),
                          // SizedBox(
                          //   height:   Get.height*0.028,
                          // ),
                        ],).paddingOnly(left: 25)),
                ],
              )).paddingSymmetric(horizontal: 15),


          Text(
            "Other Details ".tr,
            style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
          ).paddingOnly(left: 20,right: 20.0,top: 20,bottom: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Package Status :".tr,
                style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
              ),
              Text(
                "Active".tr,
                style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.green)),
              ),
            ],
          ).paddingOnly(left: 20,right: 20.0,top: 5,bottom: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Package Activation Date :".tr,
                style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
              ),
              Text(
                "23 Feb 2023".tr,
                style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
              ),
            ],
          ).paddingOnly(left: 20,right: 20.0,top: 5,bottom: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Package Expiry Date :".tr,
                style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
              ),
              Text(
                "24 May 2023".tr,
                style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black)),
              ),
            ],
          ).paddingOnly(left: 20,right: 20.0,top: 5,bottom: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subscription History".tr,
                style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
              ),
              Container(
                padding: const EdgeInsets.only(right: 0, left: 12),
                child: MaterialButton(
                  onPressed: () {
                    Get.toNamed(Routes.SUBSCRIPTIONHISTORY);

                  },
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.orange,
                  child: Text(
                    "View".tr, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),

                  ),
                  elevation: 5,
                ),
              ),
            ],
          ).paddingOnly(left: 20,right: 20.0,top: 5,bottom: 5.0),




        ],

      ),
    );
  }

}


