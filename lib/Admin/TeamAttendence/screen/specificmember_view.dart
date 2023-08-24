import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../features/attendence/widgets/attendence_list_item.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controllers/allteam_controller.dart';
import '../controllers/specificmember_controller.dart';
import '../widgets/filter_bottom_sheet_widget.dart';


class SpecificMembView extends GetView<SpecificMembController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Attendence".tr,
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
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                  shape: BoxShape.circle,
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
                ClipOval(
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/1077/1077114.png',
                    width: Get.width*0.15,
                    height: Get.width*0.15,
                  ).marginAll(15),
                ),
              ).marginOnly(right: 15),
              Expanded(child:
              Container(
                // width: Get.width * 0.81,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Expanded(flex: 2,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Name :',style: TextStyle(fontSize: Get.width * ten,color: Colors.black,fontWeight: FontWeight.w500),).paddingOnly(bottom: 6),
                        // Text('Email-Id :',style: TextStyle(fontSize: Get.width * ten,color: Colors.black,fontWeight: FontWeight.w500),).paddingOnly(bottom: 4),
                        // Text('Mobile No. :',style: TextStyle(fontSize: Get.width * ten,color: Colors.black,fontWeight: FontWeight.w500),).paddingOnly(bottom: 4),
                        //
                        Text('Timing :',style: TextStyle(fontSize: Get.width * ten,color: Colors.black,fontWeight: FontWeight.w500),).paddingOnly(bottom: 6),
                        Text('Details :',style: TextStyle(fontSize: Get.width * ten,color: Colors.black,fontWeight: FontWeight.w500),),

                  ],)),
                  Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                        Text('Vinod Thakur',style: TextStyle(fontSize: Get.width * ten,color: Colors.black),).paddingOnly(bottom: 6),
                        // Text('vinod@gmail.com',style: TextStyle(fontSize: Get.width * ten,color: Colors.black),).paddingOnly(bottom: 4),
                        // Text('9689455261',style: TextStyle(fontSize: Get.width * ten,color: Colors.black),).paddingOnly(bottom: 4),
                        Text('8 AM To 5 PM',style: TextStyle(fontSize: Get.width * ten,color: Colors.black),).paddingOnly(bottom: 6),

                        InkWell(
                            onTap: (){

                            Get.toNamed(Routes.EMPLOYEEPROFILE);
                              // CalenderDialog
                            },
                            child: Text('View More',style: TextStyle(fontSize: Get.width * ten,color: Colors.green,fontWeight: FontWeight.w500),)),

                  ],)),

                  // Text('Name :',style: TextStyle(fontSize: Get.width * twelve),),
                  // Text('Vinod Thakur',style: TextStyle(fontSize: Get.width * twelve),
                  // ),
                ],).paddingSymmetric(horizontal: 10,vertical: 15) ,
                // height: 20,
    ))
            ],
          ).paddingSymmetric(horizontal: Get.width*0.04,vertical: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Attendence details are ...'.tr,
                style: Get.textTheme.subtitle2!,).paddingSymmetric(vertical: 15),
              GestureDetector(
                  onTap: (){
                    Get.bottomSheet(
                      FilterBottomSheetWidget(),
                      isScrollControlled: true,
                    );
                  },
                  child: Icon(Icons.filter_alt_outlined, color: Get.theme.hintColor)),
            ],
          ).paddingSymmetric(horizontal: Get.width*0.04),
          ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            primary: false,
            shrinkWrap: true,
            itemCount: /*controller.bookings.length*/ 10,
            itemBuilder: ((_, index) {
              if (index == /*controller.bookings.length*/ 10) {
                return Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Center(
                      child: new Opacity(
                        opacity: controller.isLoading.value ? 1 : 0,
                        child: new CircularProgressIndicator(color: Colors.orange,),
                      ),
                    ),
                  );
                });
              } else {
                return Attendencelist_item();
              }
            }),
          ).paddingSymmetric(horizontal: Get.width*0.04),


        ],
      ),
    );
  }

}

class CalenderDialog extends StatefulWidget {
  const CalenderDialog({Key? key}) : super(key: key);

  @override
  State<CalenderDialog> createState() => _CalenderDialogState();
}

class _CalenderDialogState extends State<CalenderDialog> {

  DateTime? _selectedDate;
  DateTime? _selectedDate1;

  void _pickDateDialog(BuildContext context) {
    showDatePicker(
      context: context,

      initialDate: DateTime.now(),
      //which date will display when user open the picker
      lastDate : DateTime(2051),
      //what will be the previous supported year in picker

      firstDate: DateTime
          .now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
  }
  void _pickDateDialog1(BuildContext context) {
    showDatePicker(
      context: context,

      initialDate: DateTime.now(),
      //which date will display when user open the picker
      lastDate : DateTime(2051),
      //what will be the previous supported year in picker

      firstDate: DateTime
          .now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate1 = pickedDate;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.zero,
      title: Text('By Date'),
      content: Container(
        width: size.width * 0.9,
        // height: size.height * 0.4,
        child: Column(
          children: [

            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Text('From Date',textAlign: TextAlign.center,).paddingSymmetric(horizontal: 20.0),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Text('To Date',textAlign: TextAlign.center,).paddingSymmetric(horizontal: 20.0),
                ),
              ],
            ).marginSymmetric(horizontal: 20.0),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _pickDateDialog(context);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.33,
                    decoration: Ui.getBoxDecoration(
                      radius: 14,
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.black,
                    ),
                    child: Text(
                      _selectedDate ==
                              null //ternary expression to check if date is null
                          ? 'YY/MM/DD'
                          : '${DateFormat('dd-MM-yyyy').format(_selectedDate!)}',
                      textAlign: TextAlign.center,
                    ).paddingSymmetric(horizontal: 10.0),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03,
                ),
                InkWell(
                  onTap: (){
                    _pickDateDialog1(context);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.33,
                    decoration: Ui.getBoxDecoration(
                      radius: 14,
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.black,
                    ),
                    child: Text(
                      _selectedDate1 ==
                          null //ternary expression to check if date is null
                          ? 'YY/MM/DD'
                          : '${DateFormat('dd-MM-yyyy').format(_selectedDate1!)}',textAlign: TextAlign.center,).paddingSymmetric(horizontal: 10.0),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,
                ),
              ],
            ).marginSymmetric(horizontal: 20.0),


            GestureDetector(
              onTap: (){

                  Navigator.pop(context);
                // controller!.statusUpdated(showMessage: true);
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


