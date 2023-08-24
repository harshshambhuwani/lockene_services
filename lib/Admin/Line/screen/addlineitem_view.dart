import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/features/profile/widgets/phone_field_widget.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../features/common/text_field_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/addlineitem_controller.dart';


class AddLineitemView extends GetView<AddLineitemController>{

  final arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    controller.loginFormKey = new GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Line Item".tr,
            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => {
              Get.back(),
            },
          ),
        ),
        body: Form(
          // key: controller.loginFormKey,
          child: ListView(
            primary: true,
            children: [

              Obx(() {
                if (controller.loading.isTrue) {
                  return CircularLoadingWidget(height: 300);
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Drop(),
                      TextFieldWidget(
                        labelText: "Name".tr,
                        hintText: "Item Name".tr,
                        // initialValue: (controller.currentUser.value.name)!,
                        // onSaved: (input) => controller.currentUser.value.name = input,
                        validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                        iconData: Icons.edit,
                        isFirst: false,
                        isLast: false,
                      ),
                      TextFieldWidget(
                        labelText: "Description".tr,
                        hintText: "Enter Description".tr,
                        // initialValue: (controller.currentUser.value.name)!,
                        // onSaved: (input) => controller.currentUser.value.name = input,
                        validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                        iconData: Icons.sticky_note_2_rounded,
                        isFirst: false,
                        isLast: false,
                      ),
                      TextFieldWidget(
                        labelText: "Price".tr,
                        hintText: "Enter Unit Price".tr,
                        // initialValue: (controller.currentUser.value.name)!,
                        // onSaved: (input) => controller.currentUser.value.name = input,
                        validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                        iconData: Icons.currency_rupee,
                        keyboardType:TextInputType.phone ,
                        isFirst: false,
                        isLast: false,
                      ),
                      TextFieldWidget(
                        labelText: "Quantity".tr,
                        hintText: "Enter Quantity".tr,
                        // initialValue: (controller.currentUser.value.name)!,
                        // onSaved: (input) => controller.currentUser.value.name = input,
                        validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                        iconData: Icons.numbers,
                        keyboardType:TextInputType.phone ,
                        isFirst: false,
                        isLast: true,
                      ),

                      // GetHours(),
                      // PhoneFieldWidget(
                      //   labelText: "Phone Number".tr,
                      //   hintText: "000 000 0000".tr,
                      //   // initialCountryCode: (controller.currentUser.value.getPhoneNumber().countryISOCode),
                      //   // initialValue: (controller.currentUser.value.getPhoneNumber().number),
                      //   onSaved: (phone) {
                      //     // return controller.currentUser?.value?.phoneNumber = phone.completeNumber;
                      //     // return controller.currentUser.value.phoneNumber = phone!.completeNumber;
                      //   },
                      //   isLast: false,
                      //   isFirst: false,
                      // ),

                    ],
                  );
                }
              }),

              Row(
                // crossAxisAlignment: WrapCrossAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text('Total',style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),).paddingOnly(left: 5.0)),
                  Text('₹ 2000',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                ],
              ).paddingSymmetric(horizontal: 20.0,vertical: 10),

              BlockButtonWidget(
                onPressed: () {
                  if(arg.toString()=="add"){
                    Get.back();

                  }else{
                    Get.back();
                  }
                },
                color: Colors.orange,
                text: Text(
                  "Save Line Item".tr,
                  style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
                ),
              ).paddingOnly(top:15,bottom:25,right: 20,left: 20),
            ],
          ),
        ),

      ),
    );
  }
}


class Drop extends StatefulWidget {
  const Drop({Key? key}) : super(key: key);

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
  String? valueChoose;
  List listItem = [
    'Product',
    'Service',
  ];


  var process;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                ],
                border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
            child: Column(
              children: [
                Container(

                  child: Text('Type',style: Get.textTheme.bodyText1,
                    textAlign: TextAlign.start,),
                  alignment: Alignment.topLeft,
                ),
                Row(
                  children: [
                    Icon(Icons.list,color: Colors.grey.shade500,),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text(
                            'Please select item type',
                            style: TextStyle(fontSize: size.width * thirteen),
                          ),
                          value: valueChoose,
                          icon: Icon(Icons.arrow_drop_down),
                          // iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * thirteen,
                              fontWeight: FontWeight.w500
                          ),
                          items: listItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(
                                valueItem,
                                style: TextStyle(
                                    fontSize: size.width * thirteen,
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
                          }).marginOnly(left: 14.0,right: 0.0,top: 0.0,bottom: 0),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}

