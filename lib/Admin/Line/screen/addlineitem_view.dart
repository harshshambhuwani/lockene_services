import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:service/Admin/session/session.dart';
import 'package:service/constants.dart';
import 'package:service/features/profile/widgets/phone_field_widget.dart';
import 'package:service/features/techniciandashboard/screen/techdashboard.dart';
import 'package:service/network/api_interface.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../features/common/text_field_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/addlineitem_controller.dart';


class AddLineitemView extends StatefulWidget {
  String? userID;
   AddLineitemView({Key? key, this.userID}) : super(key: key);

  @override
  State<AddLineitemView> createState() => _AddLineitemViewState();
}

class _AddLineitemViewState extends State<AddLineitemView> {

  final arg = Get.arguments;
  String? valueChoose;
  List listItem = [
    'Product',
    'Service',
  ];


  var process;
  TextEditingController itemNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  int totalValue = 0;
  int? userId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId().then((value) => {
      // userId = value,
      setState((){
        userId = value;
        print("fromGetUserId $userId");
      }),
    });
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //controller.loginFormKey = new GlobalKey<FormState>();

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

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Drop(),
                  Column(
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
                  TextFieldWidget(
                    labelText: "Name".tr,
                    hintText: "Item Name".tr,
                    controller:  itemNameController,
                    validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                    iconData: Icons.edit,
                    isFirst: false,
                    isLast: false,
                  ),
                  TextFieldWidget(
                    labelText: "Description".tr,
                    hintText: "Enter Description".tr,
                    controller: descriptionController,
                    validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                    iconData: Icons.sticky_note_2_rounded,
                    isFirst: false,
                    isLast: false,
                  ),
                  TextFieldWidget(
                    labelText: "Price".tr,
                    hintText: "Enter Unit Price".tr,
                    controller: priceController,
                    maxlenth: 4,
                    validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                    iconData: Icons.currency_rupee,
                    keyboardType:TextInputType.phone ,
                    isFirst: false,
                    isLast: false,
                  ),
                  TextFieldWidget(
                    labelText: "Quantity".tr,
                    hintText: "Enter Quantity".tr,
                    controller: quantityController,
                    onChanged: (value){
                      int priceValue = int.parse(priceController.text);
                      int quantityValue = int.parse(value);
                      setState(() {
                        totalValue = priceValue * quantityValue;
                        print("frromApiOnChange $totalValue");
                      });

                    },
                    validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                    iconData: Icons.numbers,
                    maxlenth: 4,
                    keyboardType:TextInputType.phone ,
                    isFirst: false,
                    isLast: true,
                  ),
                ],
              ),

              Row(
                // crossAxisAlignment: WrapCrossAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text('Total',style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),).paddingOnly(left: 5.0)),
                   Text('₹ ${totalValue.toString()}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                ],
              ).paddingSymmetric(horizontal: 20.0,vertical: 10),

              BlockButtonWidget(
                onPressed: () {
                  // if(arg.toString()=="add"){
                  //   Get.back();
                  //
                  // }else{
                  //   Get.back();
                  // }
                  print("fromApiCallTap");
                  if(valueChoose == ""){
                    showToast("Please select the type first");
                  }else if(itemNameController.text == ""){
                    showToast("Please the service or product name");
                  }else if(descriptionController.text == ""){
                    showToast("Please enter the description");
                  }else if(priceController.text == ""){
                    showToast("Please enter the price");
                  }
                  else if(quantityController.text == ""){
                    showToast("Please enter the quantity");
                  }else {
                    ApiInterface().saveLineList(
                        userId.toString(),
                        valueChoose!,
                        itemNameController.text,
                        descriptionController.text,
                        priceController.text,
                        quantityController.text,
                    totalValue.toString()).then((value) => {
                      if(value.status == "1"){
                        showToast(value.message.toString()),
                        Get.to(TechDash())
                      }
                    });
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

  Future<int> getUserId() async {
    return await SessionManager().get(SessionDataKey().userId);
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

