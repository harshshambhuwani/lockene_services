import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/ui.dart';
import '../../../styles/styles.dart';
import '../../TeamAttendence/screen/specificmember_view.dart';
import '../controller/emp_profile_controller.dart';
import '../controller/emp_report_controller.dart';


class EmployeeReportView extends GetView<EmployeeReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report".tr,
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
                showDialog(
                    context: context,
                    builder: (_) {
                      // return CustomDialog();
                      return CalenderDialog();
                    });
              },
              child: Icon(Icons.calendar_today_outlined,color: Colors.black,).paddingOnly(right: 20)),
        ],        elevation: 0,
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
                      width: Get.width*0.06,
                      height: Get.width*0.06,
                    ).marginAll(10),
                  ),
                ).marginOnly(right: 15),


                Text('Vinod Thakur',style: TextStyle(fontSize: Get.width * twelve),
                ),

              ],
            ).paddingSymmetric(horizontal: 20,vertical: 10.0),
          ).paddingSymmetric(horizontal: Get.width*0.04,vertical: 10),
          Text('Current Month',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*twelve),).paddingSymmetric(horizontal: Get.width*0.04,vertical: 12.5) ,

          Container(
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
              // shape: BoxShape.circle,
            ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Text('Summary',textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*twelve),).paddingSymmetric(horizontal: Get.width*0.04,vertical: 12.5) ,

             Row(children: [
               Icon(Icons.done,size: 35,color: Colors.orange,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Present Days',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*ten,color: Colors.grey),).paddingOnly(bottom: 5.0),
                   Text('0 Days',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*eleven,color: Colors.black,letterSpacing: 2),)

                 ],).paddingSymmetric(horizontal: 15)
             ],).paddingOnly(left: Get.width*0.04,right: Get.width*0.04,top: 0,bottom: 5),
               Row(children: [
               Icon(Icons.dangerous,size: 35,color: Colors.orange,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Absent Days',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*ten,color: Colors.grey),).paddingOnly(bottom: 5.0),
                   Text('0 Days',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*eleven,color: Colors.black),)

                 ],).paddingSymmetric(horizontal: 15)
             ],).paddingSymmetric(horizontal: Get.width*0.04,vertical: 5),
               Row(children: [
                 Icon(Icons.watch_later_outlined,size: 35,color: Colors.orange,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Work Hours',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*ten,color: Colors.grey),).paddingOnly(bottom: 5.0),
                     Text('00h 00m',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*eleven,color: Colors.black),)

                   ],).paddingSymmetric(horizontal: 15)
               ],).paddingSymmetric(horizontal: Get.width*0.04,vertical: 5),

               Row(children: [
               Icon(Icons.directions_walk,size: 35,color: Colors.orange,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Day Worked',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*ten,color: Colors.grey),).paddingOnly(bottom: 5.0),
                   Text('0 Days',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*eleven,color: Colors.black),)

                 ],).paddingSymmetric(horizontal: 15)
             ],).paddingSymmetric(horizontal: Get.width*0.04,vertical: 5),
             Row(children: [
               Icon(Icons.work_outline_outlined,size: 35,color: Colors.orange,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Hours Worked',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*ten,color: Colors.grey),).paddingOnly(bottom: 5.0),
                   Text('00h 00m',style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width*eleven,color: Colors.black),)

                 ],).paddingSymmetric(horizontal: 15)
             ],).paddingOnly(left: Get.width*0.04,right: Get.width*0.04,top: 5.0,bottom: 18),

           ],),
          ).paddingSymmetric(horizontal: 20.0),


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

