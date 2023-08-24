import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/my_webview_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/subscription_controller.dart';


class SubscriptionView extends GetView<SubscriptionController> {
  final _controller = PageController(initialPage: 0);
  // final PageController controller = PageController(initialPage: 0);

  List<String> name = [
    "Lite Monthly",
    "Core Monthly",
    "Connect Monthly",
    "Grow Monthly",
  ];
  List<String> price = [
    "₹ 990",
    "₹ 6,300",
    "₹ 15,500",
    "₹ 30,000",
  ];
  List<String> quote = [
    "Impress clients and get paid faster with online quotes and invoices",
    "Everything you need to stay organized,get paid and grow.",
    "Build efficiently processes that better connect your team and impress your customers.",
    "Scale your business with powerful scales and marketing automation tools.",
  ];

  List<String> icon1 = [
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
  ];
  List<String> icon2 = [
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
  ];
  List<String> icon3 = [
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
  ];
  List<String> icon4 = [
    "https://cdn-icons-png.flaticon.com/512/4196/4196790.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
  ];
  List<String> icon5 = [
    "https://cdn-icons-png.flaticon.com/512/4196/4196790.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
    "https://cdn-icons-png.flaticon.com/512/1828/1828743.png",
  ];

  List<String> text1 = [
    "Manage unlimited clients.",
    "All Lite Monthly features included.",
    "All Core Monthly features included.",
    "All Connect Monthly features included.",
  ];
  List<String> text2 = [
    "Send unlimited invoices and quotes.",
    "1 User included.",
    "Up to 5 users.",
    "Up to 15 users.",
  ];
  List<String> text3 = [
    "Accept and track payment.",
    "Unlimited clients,invoices and quotes.",
    "GPS and routing.",
    "Advanced quoting features.",
  ];
  List<String> text4 = [
    "Real-time scheduling for jobs.",
    "Real-time scheduling for jobs.",
    "Time and expense tracking.",
    "Two-way text messaging.",
  ];
  List<String> text5 = [
    "Get real-time jobs updates.",
    "1-on-1 product support.",
    "Online booking to capture leads.",
    "Lead management.",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose a plan".tr,
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
          InkWell(
              onTap: (){
                print("Hi");
                Get.toNamed(Routes.MYSUBSCRIPTION);
              },
              child:
              Text('My Plans',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: Get.width * fourteen,
                    fontWeight: FontWeight.w500),
              ).paddingSymmetric(horizontal: 20,vertical: 20)),
        ],

        elevation: 0,
      ),
      body: ListView(
        children: [

          Container(
            height: Get.height*0.835,
            child: PageView.builder(
              controller: _controller,
              itemCount: name.length,
              scrollDirection: Axis.horizontal,

              itemBuilder: (BuildContext context, int index) {
                // return YourWidget(data: yourData[index]);
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.0,vertical: Get.height*0.005),
                  child: Container(
                    // width: 300,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(
                        //     color: Colors
                        //         .black26),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          // spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1,
                      ),
                      /* borderRadius: BorderRadius.circular(16)*/),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Get.width * twentyeight,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height:   Get.height*0.01,
                          ),
                          Text(
                            price[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Get.width * twentysix,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height:  Get.height*0.01,
                          ),
                          Text(
                           quote[index],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: Get.width * sixteen,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height:  Get.height*0.01,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(icon1[index],scale: 30,color: Colors.green,).marginOnly(left: 5.0),
                              Expanded(
                                child: Text(
                                  text1[index],
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Get.width * sixteen,
                                      fontWeight: FontWeight.w500),
                                ).marginOnly(left: 10),
                              ),

                            ],).marginOnly(top:  Get.height*0.01,bottom:   Get.height*0.01),
                          Divider(color: Colors.grey,thickness: 1,),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(icon2[index],scale: 30,color: Colors.green,).marginOnly(left: 5.0),
                              Expanded(
                                child: Text(
                                  text2[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Get.width * sixteen,
                                      fontWeight: FontWeight.w500),
                                ).marginOnly(left: 10),
                              ),

                            ],).marginOnly(top: Get.height*0.01,bottom:Get.height*0.01),
                          Divider(color: Colors.grey,thickness: 1,),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(icon3[index],scale: 30,color: Colors.green,).marginOnly(left: 5.0),
                              Expanded(
                                child:  Text(
                                text3[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Get.width * sixteen,
                                    fontWeight: FontWeight.w500),
                              ).marginOnly(left: 10),),

                            ],).marginOnly(top:Get.height*0.01,bottom: Get.height*0.01),
                          Divider(color: Colors.grey,thickness: 1,),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(icon4[index],scale: 30,color: Colors.red,).marginOnly(left: 5.0),
                              Expanded(
                                child: Text(
                                  text4[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Get.width * sixteen,
                                      fontWeight: FontWeight.w500),
                                ).marginOnly(left: 10),
                              ),

                            ],).marginOnly(top : Get.height*0.01,bottom : Get.height*0.01),
                          Divider(color: Colors.grey,thickness: 1,),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(icon5[index],scale: 30,color: Colors.red,).marginOnly(left: 5.0),
                              Expanded(
                                child:Text(
                                text5[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Get.width * sixteen,
                                    fontWeight: FontWeight.w500),
                              ).marginOnly(left: 10),),

                            ],).marginOnly(top: Get.height*0.01,bottom: Get.height*0.01),
                          Divider(color: Colors.grey,thickness: 1,),
                          SizedBox(
                            height:  Get.height*0.025,
                          ),
                          BlockButtonWidget(
                              text: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Choose Plan".tr,
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
                              }),
                          SizedBox(
                            height: Get.height*0.005,
                          ),

                        ]),
                  ),
                );
                ;
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //3 buttons -> send + pay + bills
          Container(
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: _controller,
              count: name.length,
              effect:
              ExpandingDotsEffect(
                // double offset = 16.0,
                // double dotWidth = 16.0,
                // double dotHeight = 16.0,
                // double spacing = 8.0,
                // double radius = 16.0,
                // Color activeDotColor = Colors.indigo,
                // Color dotColor = Colors.grey,
                // double strokeWidth = 1.0,
                // radius: 8,
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: Colors.grey.shade800,),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Once you subscribe,your plan will be charged to your Google Play Store Account at the time of purchase and automatically renews unless cancelled at least 24 hours before the end of the current period.Cancel your subscription at anytime throught your Google Play Store Account",
            style: TextStyle(
                color: Colors.grey,
                fontSize: Get.width * fourteen,
                fontWeight: FontWeight.w500),
          ).paddingOnly(left: 25,right: 25.0),
          SizedBox(
            height: 10,
          ),

          Text(
            "Previously subscribed ?".tr,
            style: TextStyle(
                color: Colors.black,
                fontSize: Get.width * sixteen,
                fontWeight: FontWeight.w500),
          ).paddingOnly(left: 25,right: 25.0),
          SizedBox(
            height: 5,
          ),
          Text(
            "Restore Purchases".tr,
            style: TextStyle(
                color: Colors.orange,
                fontSize: Get.width * fourteen,
                fontWeight: FontWeight.w500),
          ).paddingOnly(left: 25,right: 25.0),
          SizedBox(
            height: 10.0,
          ),
          Wrap(children: [
            Text(
              "Read our".tr,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.width * fourteen,
                  fontWeight: FontWeight.w500),
            ).paddingOnly(left: 25),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyWebView(url: 'https://lockene.us/privacy-policy/'),
                  ),
                );

              },              child: Text(
                "Privacy Policy".tr,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.orange,
                    fontSize: Get.width * fourteen,
                    fontWeight: FontWeight.w500),
              ).marginOnly(left: 5.0,right: 5.0),
            ),
            Text(
              "and".tr,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.width * fourteen,
                  fontWeight: FontWeight.w500),
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
              child: Text(
                "Terms of Services".tr,
                style: TextStyle(
                    decoration: TextDecoration.underline,

                    color: Colors.orange,
                    fontSize: Get.width * fourteen,
                    fontWeight: FontWeight.w500),
              ).marginOnly(left: 5.0),
            ),

          ],).marginOnly(bottom: 40)


        ],

      ),
    );
  }

}
