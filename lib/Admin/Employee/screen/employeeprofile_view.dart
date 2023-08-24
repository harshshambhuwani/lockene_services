import 'dart:ui';

// import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../features/common/ui.dart';
import '../../../styles/styles.dart';
import '../controller/emp_profile_controller.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;


class EmployeeProfileView extends GetView<EmployeeProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Employee Details".tr,
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
              // showDialog(
              //     context: context,
              //     builder: (_) {
              //       return StatusDialog();
              //       // return CustomDialogService();
              //     });
              Get.toNamed(Routes.EDITEMPLOYEE);
            },
              child: Icon(Icons.edit, color: Get.theme.hintColor).paddingSymmetric(horizontal: 20)),
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [

          Container(
            width: Get.width * 1,
            // height: Get.width * 0.4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,

                        shape: BoxShape.circle,
                      ),
                      child:
                      ClipOval(
                        child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/1077/1077114.png',
                          width: Get.width*0.12,
                          height: Get.width*0.12,
                        ).marginAll(15),
                      ),
                    ).marginOnly(right: 15),

                        Expanded(flex: 2,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name :',style: TextStyle(fontSize: Get.width * ten,color: Colors.black,fontWeight: FontWeight.w500),).paddingOnly(bottom: 6),

                                Text('Contact :',style: TextStyle(fontSize: Get.width * ten,color: Colors.black,fontWeight: FontWeight.w500),).paddingOnly(bottom: 6),
                                Text('Service :',style: TextStyle(fontSize: Get.width * ten,color: Colors.black,fontWeight: FontWeight.w500),),

                              ],)),
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text('Vinod Thakur',style: TextStyle(fontSize: Get.width * ten,color: Colors.black),).paddingOnly(bottom: 6),
                                // Text('vinod@gmail.com',style: TextStyle(fontSize: Get.width * ten,color: Colors.black),).paddingOnly(bottom: 4),
                                // Text('9689455261',style: TextStyle(fontSize: Get.width * ten,color: Colors.black),).paddingOnly(bottom: 4),
                                Text('9689455261',style: TextStyle(fontSize: Get.width * ten,color: Colors.black),).paddingOnly(bottom: 6),

                                Text('Carpenter',style: TextStyle(fontSize: Get.width * ten,color: Colors.black),),

                              ],)),

                        // Text('Name :',style: TextStyle(fontSize: Get.width * twelve),),
                        // Text('Vinod Thakur',style: TextStyle(fontSize: Get.width * twelve),
                        // ),

                  ],
                ).paddingSymmetric(horizontal: 20,vertical: 10.0),
                Row(children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        UrlLauncher.launch("tel://9689455261");

                      },
                      child: Column(children: [
                      Icon(Icons.call,size: 30,color: Colors.orange,).marginOnly(bottom: 5.0),
                      Text('Call',style: TextStyle(fontSize: Get.width*twelve,fontWeight: FontWeight.w500),)

                  ],),
                    ),),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        launch('mailto:rajatmeshrams11@gmail.com?''subject=From Lockene Services');
                      },
                      child: Column(children: [
                      Icon(Icons.email_outlined,size: 30,color: Colors.orange,).marginOnly(bottom: 5.0),
                      Text('E-Mail',style: TextStyle(fontSize: Get.width*twelve,fontWeight: FontWeight.w500),)

                  ],),
                    ),),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        Get.toNamed(Routes.EMPLOYEEREPORT);
                      },
                      child: Column(children: [
                      Icon(Icons.description,size: 30,color: Colors.orange,).marginOnly(bottom: 5.0),
                      Text('Report',style: TextStyle(fontSize: Get.width*twelve,fontWeight: FontWeight.w500),)

                  ],),
                    ),),
                ],).paddingSymmetric(horizontal: 20.0,vertical: 10),
              ],
            ),
          ).paddingSymmetric(horizontal: Get.width*0.04,vertical: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Change User Status',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*twelve),),
              CustomSwitch1()
            ],
          ).paddingOnly(left: Get.width*0.04,right:Get.width*0.04,top: 20.0) ,

          Text('Other Details',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*twelve),).paddingSymmetric(horizontal: Get.width*0.04,vertical: 12.5) ,
          Row(children: [
            Icon(Icons.verified_user,size: 35,color: Colors.orange,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('User Status',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*ten,color: Colors.grey),).paddingOnly(bottom: 5.0),
              Text('Active',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*eleven,color: Colors.black),)

            ],).paddingSymmetric(horizontal: 15)
          ],).paddingSymmetric(horizontal: Get.width*0.04,vertical: 5),
          Row(children: [
            Icon(Icons.watch_later,size: 35,color: Colors.orange,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Shift Time',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*ten,color: Colors.grey),).paddingOnly(bottom: 5.0),
              Text('9 to 6',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*eleven,color: Colors.black),)

            ],).paddingSymmetric(horizontal: 15)
          ],).paddingSymmetric(horizontal: Get.width*0.04,vertical: 5),
          Row(children: [
            Icon(Icons.work,size: 35,color: Colors.orange,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Salary Based On',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*ten,color: Colors.grey),).paddingOnly(bottom: 5.0),
              Text('Working Hours',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*eleven,color: Colors.black),)

            ],).paddingSymmetric(horizontal: 15)
          ],).paddingSymmetric(horizontal: Get.width*0.04,vertical: 5),
          Row(children: [
            Icon(Icons.attach_money,size: 35,color: Colors.orange,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Earning',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*ten,color: Colors.grey),).paddingOnly(bottom: 5.0),
              Text("400 Dollar",style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*eleven,color: Colors.black),)

            ],).paddingSymmetric(horizontal: 15)
          ],).paddingSymmetric(horizontal: Get.width*0.04,vertical: 5),
          // CustomSwitch
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
                  decoration: Ui.getInputDecoration(hintText: "Search for product...".tr),
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

class StatusDialog extends StatefulWidget {
  const StatusDialog({Key? key}) : super(key: key);

  @override
  State<StatusDialog> createState() => _StatusDialogState();
}

class _StatusDialogState extends State<StatusDialog> {
  String? valueChoose;
  List listItem = [
    'Active',
    'In-Active',
  ];
  var process;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.zero,
      title: Text('Update Status'),
      content: Container(
        width: size.width * 0.9,
        // height: size.height * 0.4,
        child: Column(
          children: [
            DropdownButton(
                hint: Text(
                  'Please select status',
                  style: TextStyle(fontSize: size.width * twelve),
                ),
                value: valueChoose,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * twelve,
                ),
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(
                      valueItem,
                      style: TextStyle(
                          fontSize: size.width * twelve,
                          color: textColor),
                    ),
                  );
                }).toList(),
                onChanged: (
                    newValue,
                    ) {
                  setState(() {
                    valueChoose = newValue as String?;
                  });
                }).marginOnly(left: 20.0,right: 20.0,top: 20.0,bottom: 0),


            GestureDetector(
              onTap: (){

                Navigator.pop(context);
                // controller!.StatusDialogUpdated(showMessage: true);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: size.width * fourteen,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class CustomSwitch1 extends StatefulWidget {

  @override
  _CustomSwitch1State createState() => _CustomSwitch1State();
}

class _CustomSwitch1State extends State<CustomSwitch1> {

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Switch(
    onChanged: toggleSwitch,
    value: isSwitched,
    activeColor: Colors.orange.shade400,
    activeTrackColor: Colors.orange.shade200,
    // inactiveThumbColor: Colors.redAccent,
    // inactiveTrackColor: Colors.orange,
        )
    ;
  }
}