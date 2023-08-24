import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/ui.dart';
import '../../../styles/styles.dart';
import '../controllers/manageservice_controller.dart';


class ManageServiceView extends GetView<ManageServiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage Custom Service".tr,
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
              showDialog(
                  context: context,
                  builder: (_) {
                    return CustomDialog();
                    // return CustomDialogService();
                  });
            },
              child: Icon(Icons.add_circle_outline, color: Get.theme.hintColor).paddingSymmetric(horizontal: 20)),
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          buildSearchBar(),
          Text('My Custom Service are ...'.tr,
            style: Get.textTheme.subtitle2!,).marginSymmetric(horizontal: 20.0),

          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Icon(Icons.pages_rounded,color: Colors.orange,size: 25,)),
                Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Plumber',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * twelve ),).paddingSymmetric(vertical: 2.0).marginOnly(top: 5.0),
                        ],
                      ),
                    )),
                InkWell(
                    onTap: (){
                      showDialog(
                        barrierDismissible: false,
                          context: context,
                          builder: (_) {
                            return DeleteDialog();
                            // return CustomDialogService();
                          });

                    },
                    child: Icon(Icons.delete_forever,color: Colors.red,).marginOnly(right: 10)),

              ],
            ).paddingSymmetric(vertical: 15.0),
          ).marginOnly(left: 20.0,right: 20.0,top: 10),
          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Icon(Icons.pages_rounded,color: Colors.orange,size: 25,)),
                Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Carpenter',style: TextStyle(color: Colors.blueGrey,fontSize: Get.width * twelve ),).paddingSymmetric(vertical: 2.0).marginOnly(top: 5.0),
                        ],
                      ),
                    )),
                InkWell(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (_) {
                          return DeleteDialog();
                          // return CustomDialogService();
                        });
                  },
                    child: Icon(Icons.delete_forever,color: Colors.red,).marginOnly(right: 10)),

              ],
            ).paddingSymmetric(vertical: 15.0),
          ).marginOnly(left: 20.0,right: 20.0,top: 10),


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
                  decoration: Ui.getInputDecoration(hintText: "Search for service...".tr),
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

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {

  String? valueChoose;
  List brand = [
    'Plumber',
    'Four Wheeler',
    'Two Wheeler',
    'Salon',
    'Electrician',
    'Carpenter',
  ];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.zero,
      title: Text('Add Custom Service'),
      content: Container(
        width: size.width * 0.9,
        child: Column(
          children: [
            DropdownButton(
                hint: Text(
                  'Select Service',
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
                items: brand.map((valueItem) {
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
                }).marginOnly(left: 20.0,right: 20.0,top: 20.0,bottom: 10),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Get.showSnackbar(Ui.SuccessSnackBar(message: "New custom service added successfully".tr));

                // controller!.statusUpdated(showMessage: true);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Text(
                    'Add',
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

            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text('Cancel').marginOnly(bottom: 15))

          ],
        ),
      ),
    );

  }


}


class DeleteDialog extends StatefulWidget {
  const DeleteDialog({Key? key}) : super(key: key);

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.zero,
      title: Text('Delete Service',),
      content: Container(
        width: size.width * 0.9,
        child: Column(
          children: [

            // Icon(Icons.delete,color: Colors.red,size: 85,),
            Text('Are you sure you want to delete this service ?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),).paddingSymmetric(horizontal: 20.0,vertical: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    primary: Colors.green,
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Get.showSnackbar(Ui.SuccessSnackBar(message: "Custom service deleted successfully".tr));

                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    primary: Colors.red,
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ).paddingOnly(left: 20.0),
              ],
            ).marginSymmetric(vertical: 20.0,horizontal: 20.0)
          ],
        ),
      ),
    );

  }


}

