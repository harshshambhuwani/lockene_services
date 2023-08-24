import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../controller/discount_controller.dart';


class DiscountView extends GetView<DiscountController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Discount".tr,
          style: Get.textTheme.subtitle1!.merge(
              TextStyle(fontWeight: FontWeight.w500)),
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


          CustomRadio(),

        ],
      ),
    );
  }
}


class CustomRadio extends StatefulWidget {
  const CustomRadio({Key? key}) : super(key: key);

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  String ? show="Percentage";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomRadioButton(
                    elevation: 0,
                    unSelectedColor: Colors.grey.shade100,
                    unSelectedBorderColor: Colors.grey.shade100,
                    shapeRadius: 50,
                    enableShape: true,
                    buttonLables: [
                      'Percentage',
                      'Fixed',
                      // 'Teacher',
                    ],
                    buttonValues: [
                      'Percentage',
                      'Fixed',
                      // "TEACHER",
                    ],
                    buttonTextStyle: ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: Colors.black,
                        textStyle: TextStyle(fontSize: 16)),
                    radioButtonValue: (value) {
                      print(value);
                      setState(() {
                        show = value as String?;
                        print(show);
                      });


                    },
                    selectedColor: Colors.black,
                    selectedBorderColor: Colors.black,
                    width: 150,
                    padding: 10,
                    spacing: 0,
                    defaultSelected: "Percentage",
                    horizontal: false,
                    enableButtonWrap: false,
                    // width: 40,
                    absoluteZeroSpacing: false,
                    // padding: 100.0,
                  ),
                ),
              ],
            ).marginSymmetric(vertical: 10.0),
          ),
          show=="Percentage"?
          Container(
            // height: size.height * 0.08,
            color: Colors.white,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Discount',
                labelText: 'Discount',
                suffixIcon: Icon(Icons.percent),
                suffixIconColor: Colors.black,
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color:  Colors.black38),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
              ),

            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
          ):Container(
            // height: size.height * 0.08,
            color: Colors.white,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Discount',
                labelText: 'Discount',
                suffixIcon: Icon(Icons.currency_rupee),
                suffixIconColor: Colors.black,
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color:  Colors.black38),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
              ),

            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
          ),

          Container(
            color: Colors.white,
            width: double.infinity,
            child: BlockButtonWidget(
              onPressed: () {

              },
              color: Colors.orange,
              text: Text(
                "Add Discount".tr,
                style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
              ),
            ).paddingOnly(top: 25,bottom:25,left: 20,right: 20.0),
          ).marginOnly(top:8.0),


        ],
      ),
    );
  }
}

