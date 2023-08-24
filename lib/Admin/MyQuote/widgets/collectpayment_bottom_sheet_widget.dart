/*
 * Copyright (c) 2020 .
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:service/Admin/MyQuote/widgets/payment_method_sheet_widget.dart';

import '../../../features/bookings/widgets/otp_text_field_widget.dart';
import '../../../features/common/block_button_widget.dart';
import '../../../features/common/ui.dart';
import '../../../styles/styles.dart';
import '../../AddClient/screen/addclient_view.dart';
import '../../Registration/widgets/phone_verification_bottom_sheet_widget.dart';
import '../controller/invoice_review_controller.dart';


class CollectBottomSheetWidget extends GetView<ReviewInvoiceController> {
  // int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.45,
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Get.theme.focusColor.withOpacity(0.4), blurRadius: 30, offset: Offset(0, -30)),
        ],
      ),
      child: ListView(children: [
            Container(
              height: 30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: (Get.width / 2) - 30),
              decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Get.theme.focusColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
                //child: SizedBox(height: 1,),
              ),
            ),

        Custom(),
        ]));
  }
}

class Custom extends StatefulWidget {
  const Custom({Key? key}) : super(key: key);

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  String? valueChoose;
  List listItem = [
    'Check',
    'Cash',
    'Bank Transfer',
    'Credit Card',
    'Money Order',
    'Other',
  ];
  var process;

  DateTime? _selectedDate;
  void _pickDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        lastDate : DateTime(2051),
        //what will be the previous supported year in picker

        firstDate: DateTime
            .now()) //what will be the up to supported date in picker
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


  List<Widget> _buildCustomTiles() {
    return [
    Align(
      alignment: Alignment.topLeft,
        child: Text("Collect Payment".tr,
            style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.black))
        )).paddingOnly(top: 10),
    Divider(color: Colors.grey,),

    Container(height: Get.height*0.1,
      color: Colors.grey.shade100,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Payment Amount',
          labelText: 'Payment Amount',
          labelStyle: TextStyle(color: Colors.black,fontSize: 14),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:theme1 ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme1),
          ),
        ),
      ).paddingSymmetric(horizontal: 10.0),
    ).marginOnly(top: 10.0),
    Container(color: Colors.grey.shade100,
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Payment Method",
            style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
          ).marginOnly(top: 10.0),
        DropdownButton(
            hint: Text(
              'Select Status',
              style: TextStyle(fontSize: Get.width * twelve),
            ),
            value: valueChoose,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            style: TextStyle(
              color: Colors.black,
              fontSize:Get.width* twelve,
            ),
            items: listItem.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(
                  valueItem,
                  style: TextStyle(
                      fontSize: Get.width * twelve,
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
            }).marginOnly(left: 0.0,right: 0.0,top:0.0,bottom: 10.0),


    ],
    ).paddingSymmetric(horizontal: 10.0),



    ).marginOnly(top: 10.0),
      if(valueChoose=="Check")
      Container(width: Get.width*1,
        color: Colors.grey.shade100,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: (){
              _pickDateDialog();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Date",
                style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
              ).marginOnly(top: 10.0),
              Text(
                _selectedDate ==
                    null //ternary expression to check if date is null
                    ? '${DateFormat.yMMMd().format(DateTime.now())}'
                    : '${DateFormat.yMMMd().format(_selectedDate!)}',
                style: TextStyle(color: Colors.black,fontSize: Get.width * twelve,),
              ).marginOnly(top: 5.0),
              TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Please enter check number',
                    labelText: 'Check Number',
                    labelStyle: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:theme1 ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme1),
                    ),
                  ),
                ).marginOnly(top: 8.0),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Please enter details',
                    labelText: 'Details',
                    labelStyle: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:theme1 ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme1),
                    ),
                  ),
                ).marginOnly(top: 8.0,bottom: 20)

            ],
            ).paddingSymmetric(horizontal: 10.0),
          ),
        ).marginOnly(top: 10.0),

      if(valueChoose=="Cash")
        Container(width: Get.width*1,
          color: Colors.grey.shade100,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: (){
              _pickDateDialog();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date",
                  style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                ).marginOnly(top: 10.0),
                Text(
                  _selectedDate ==
                      null //ternary expression to check if date is null
                      ? '${DateFormat.yMMMd().format(DateTime.now())}'
                      : '${DateFormat.yMMMd().format(_selectedDate!)}',
                  style: TextStyle(color: Colors.black,fontSize: Get.width * twelve,),
                ).marginOnly(top: 5.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Please enter details',
                    labelText: 'Details',
                    labelStyle: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:theme1 ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme1),
                    ),
                  ),
                ).marginOnly(top: 8.0,bottom: 20)

              ],
            ).paddingSymmetric(horizontal: 10.0),
          ),
        ).marginOnly(top: 10.0),

      if(valueChoose=="Bank Transfer")
        Container(width: Get.width*1,
          color: Colors.grey.shade100,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: (){
              _pickDateDialog();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date",
                  style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                ).marginOnly(top: 10.0),
                Text(
                  _selectedDate ==
                      null //ternary expression to check if date is null
                      ? '${DateFormat.yMMMd().format(DateTime.now())}'
                      : '${DateFormat.yMMMd().format(_selectedDate!)}',
                  style: TextStyle(color: Colors.black,fontSize: Get.width * twelve,),
                ).marginOnly(top: 5.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Please enter confirmation number',
                    labelText: 'Confirmation Number',
                    labelStyle: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:theme1 ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme1),
                    ),
                  ),
                ).marginOnly(top: 8.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Please enter details',
                    labelText: 'Details',
                    labelStyle: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:theme1 ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme1),
                    ),
                  ),
                ).marginOnly(top: 8.0,bottom: 20)

              ],
            ).paddingSymmetric(horizontal: 10.0),
          ),
        ).marginOnly(top: 10.0),

      if(valueChoose=="Credit Card")
        Container(width: Get.width*1,
          color: Colors.grey.shade100,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: (){
              _pickDateDialog();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date",
                  style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                ).marginOnly(top: 10.0),
                Text(
                  _selectedDate ==
                      null //ternary expression to check if date is null
                      ? '${DateFormat.yMMMd().format(DateTime.now())}'
                      : '${DateFormat.yMMMd().format(_selectedDate!)}',
                  style: TextStyle(color: Colors.black,fontSize: Get.width * twelve,),
                ).marginOnly(top: 5.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Please enter transfer number',
                    labelText: 'Transfer Number',
                    labelStyle: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:theme1 ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme1),
                    ),
                  ),
                ).marginOnly(top: 8.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Please enter details',
                    labelText: 'Details',
                    labelStyle: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:theme1 ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme1),
                    ),
                  ),
                ).marginOnly(top: 8.0,bottom: 20)

              ],
            ).paddingSymmetric(horizontal: 10.0),
          ),
        ).marginOnly(top: 10.0),

      if(valueChoose=="Money Order")
        Container(width: Get.width*1,
          color: Colors.grey.shade100,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: (){
              _pickDateDialog();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date",
                  style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                ).marginOnly(top: 10.0),
                Text(
                  _selectedDate ==
                      null //ternary expression to check if date is null
                      ? '${DateFormat.yMMMd().format(DateTime.now())}'
                      : '${DateFormat.yMMMd().format(_selectedDate!)}',
                  style: TextStyle(color: Colors.black,fontSize: Get.width * twelve,),
                ).marginOnly(top: 5.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Please enter details',
                    labelText: 'Details',
                    labelStyle: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:theme1 ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme1),
                    ),
                  ),
                ).marginOnly(top: 8.0,bottom: 20)

              ],
            ).paddingSymmetric(horizontal: 10.0),
          ),
        ).marginOnly(top: 10.0),

      if(valueChoose=="Other")
        Container(width: Get.width*1,
          color: Colors.grey.shade100,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: (){
              _pickDateDialog();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date",
                  style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                ).marginOnly(top: 10.0),
                Text(
                  _selectedDate ==
                      null //ternary expression to check if date is null
                      ? '${DateFormat.yMMMd().format(DateTime.now())}'
                      : '${DateFormat.yMMMd().format(_selectedDate!)}',
                  style: TextStyle(color: Colors.black,fontSize: Get.width * twelve,),
                ).marginOnly(top: 5.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Please enter details',
                    labelText: 'Details',
                    labelStyle: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:theme1 ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme1),
                    ),
                  ),
                ).marginOnly(top: 8.0,bottom: 20)

              ],
            ).paddingSymmetric(horizontal: 10.0),
          ),
        ).marginOnly(top: 10.0),

        GestureDetector(
          onTap: (){
            // Get.back();
            // showDialog(
            //     context: context,
            //     builder: (_) {
            //       return OTPDialog();
            //     });

            Get.back();
            Get.showSnackbar(Ui.SuccessSnackBar(message: "Payment has successfully collected".tr));

          },
          child:
          Container(
      alignment: Alignment.center,
      height: Get.height*0.07,
      width: Get.width * 1,
      decoration: BoxDecoration(color: Colors.orange,
      borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius:5.0,
                spreadRadius: 5.0,
              color: Colors.black12,
              offset: Offset(0,5)
            )
          ]
      ),
      child: Text('Collect Payment',
            style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white,fontWeight: FontWeight.w500))
      ),
    ).marginOnly(top: 10.0),
        )


    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  _buildCustomTiles(),).paddingOnly(top: 00, bottom: 10, left: 20, right: 20);
  }
}

// children:  _buildCustomTiles(),).paddingOnly(top: 00, bottom: 0, left: 4, right: 4);


class OTPDialog extends StatefulWidget {
  const OTPDialog({Key? key}) : super(key: key);

  @override
  State<OTPDialog> createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      scrollable: true,

      contentPadding: EdgeInsets.zero,
      title: Text('OTP Send Successfully'),
      content: Container(
        width: size.width * 0.9,
        // height: size.height * 0.4,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "We sent the OTP code to your Email-Id, please enter below to complete your collect payment".tr,
        style: Get.textTheme.bodyText1,
        textAlign: TextAlign.left,
      ).paddingSymmetric( vertical: 10,horizontal: 20),
      TextFieldWidget(
        labelText: "OTP Code".tr,
        hintText: "----  ----  ----  ----  ----  ----".tr,
        style: Get.textTheme.headline4!.merge(TextStyle(letterSpacing: 6)),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        // onChanged: (input) => controller.smsSent.value = input,
      ),

      // Coundown(),
      StartT(),
      GestureDetector(
        onTap: (){
          Get.back();
          Get.back();
          Get.showSnackbar(Ui.SuccessSnackBar(message: "Payment has successfully collected".tr));

        },
        child: Container(
          alignment: Alignment.center,
          height: Get.height*0.07,
          width: Get.width * 1,
          decoration: BoxDecoration(color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    blurRadius:5.0,
                    spreadRadius: 5.0,
                    color: Colors.black12,
                    offset: Offset(0,5)
                )
              ]
          ),
          child: Text('Verify',
              style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white,fontWeight: FontWeight.w500))
          ),
        ).marginOnly(top: 10.0,left: 20,right: 20,bottom: 20.0),
      ),

    ]
    ),
      )
    );

  }


}