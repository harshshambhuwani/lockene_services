/*
 * Copyright (c) 2020 .
 */

import 'dart:ui';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../styles/styles.dart';
import '../controller/invoice_review_controller.dart';


class PaymentMBottomSheetWidget extends GetView<ReviewInvoiceController> {
  // int _value = 1;
  // String? selectedValue;
  // PaymentMBottomSheetWidget(this.selectedValue);
  // selectedValue.value = value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.35,
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

        Custom(/*selectedValue*/),
        ]));
  }
}

class Custom extends StatefulWidget {
  // String? selectedValue;
  // Custom(this.selectedValue);
  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  int? _selectedValue;

  List<Widget> _buildCustomTiles() {
    return [
    Align(
      alignment: Alignment.topLeft,
        child: Text("Select payment method".tr,
            style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.black))
        )).paddingOnly(top: 10),

    // Divider(color: Colors.grey,),
      SizedBox(height: 20.0,),
      Column(
        children: <Widget>[
          CustomRadioButton(
            elevation: 0,
            absoluteZeroSpacing: false,
            enableButtonWrap: true,
            unSelectedBorderColor: Colors.black,
            selectedBorderColor: Colors.orange,
            enableShape: true,
            width: Get.width*0.43,
            height: Get.width*0.1 ,
            padding: 20,
            margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
            // shapeRadius: 10,
            unSelectedColor: Colors.white,
            buttonLables: [
              'Check',
              'Cash',
              'Bank Transfer',
              'Credit card',
              'Money order',
              'Other',
            ],
            buttonValues: [
              'Check',
              'Cash',
              'Bank Transfer',
              'Credit card',
              'Money order',
              'Other',
            ],
            buttonTextStyle: ButtonTextStyle(
                selectedColor: Colors.white,
                unSelectedColor: Colors.black,
                textStyle: TextStyle(fontSize: 16)),
            radioButtonValue: (value) {
              print(value);
              Get.back();


            },
            selectedColor: Colors.orange.shade400,
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  _buildCustomTiles(),).paddingOnly(top: 00, bottom: 0, left: 20, right: 20);
  }
}

// children:  _buildCustomTiles(),).paddingOnly(top: 00, bottom: 0, left: 4, right: 4);
