
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../../../styles/styles.dart';
import '../../common/block_button_widget.dart';
import '../../common/text_field_widget.dart';
import '../../home/widgets/booking_options_popup_menu_widget.dart';
import '../controllers/booking_controller.dart';

class BookingWarrantyWidget extends GetView<BookingController> {

  const BookingWarrantyWidget({
    Key? key,
  }) : super(key: key);

  @override
  void initState() {
    controller;      // Add code after super
  }




  @override
  Widget build(BuildContext context) {
    return  Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [
        BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5)),
      ],
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.end, children: [

        Expanded(
          child: BlockButtonWidget(
              text: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Warranty Details".tr,
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
                _showAlertDialog(context,controller);
              }),
        ),
    ]).paddingSymmetric(vertical: 10, horizontal: 20),
      );

    // ;});
  }
}

void _showAlertDialog(BuildContext context, [BookingController ? controller]) {
  final double _min = 150;
  final double _max = 1000;
  String? valueChoose;
  var size = MediaQuery.of(context).size;
  List listItem = [
    'On the way',
    'In process',
    'Worked completed',
    'Not served',
  ];





  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;
  bool check6 = false;




  final TextEditingController _remarkController = TextEditingController();
  // controller.loginFormKey = new GlobalKey<FormState>();





  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return
            AlertDialog(
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
                        'Select Status',
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

                  if(valueChoose=="In process")
                    Container(
                      // height: 80.0,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Please select image',
                            style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),




                    ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 0),
                  if(valueChoose=="In process")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                      children: [
                        MaterialButton(
                          onPressed: () {

                          },
                          height: 45,
                          minWidth: 45,
                          // padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: page,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                          elevation: 5,
                        ),
                        // SizedBox(width: 5.0,),
                        Text(
                          'OR',
                          style: TextStyle(color: Colors.black,fontSize: size.width * twelve,
                          ),
                          textAlign: TextAlign.start,
                        ).marginSymmetric(horizontal: 8.0),
                        MaterialButton(
                          onPressed: () {
                            print('click');
                            print(controller!.image);
                            setState(() {

                              controller.getImageGallery();

                            });
                          },
                          height: 40,
                          minWidth: 40,
                          // padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: page,
                          child: Icon(
                            Icons.image,
                            color: Colors.black,
                          ),
                          elevation: 5,
                        ),
                      ],
                    ),

                      if(valueChoose=="In process")
                      // if(controller!.image != null)
                        Container(
                          child: controller!.image == null ? Center(child: Container(
                            alignment: Alignment.center,
                              height: 80,
                              width: 80,
                              child: Text("Pick Image")),):
                          Container(
                            child: Center(
                              child:  Image.file(

                                File(controller.image!.path).absolute,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.black26)),
                        ),

                    ]
                  ).marginOnly(left: 20.0,right: 20.0,top: 0,bottom: 0),


                  if(valueChoose=="Worked completed")
                    Container(
                      // height: 80.0,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Please select servicing location image',
                            style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 0),

                  TextFormField(
                    minLines: 1,
                    maxLines: 5,  // allow user to enter 5 line in textfield
                    keyboardType: TextInputType.multiline,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      isDense: true,
                      // contentPadding: EdgeInsets.only(top: 13,bottom: 13,left: 13,right: 13),
                      labelText: "Remark",
                      labelStyle:TextStyle(color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Enter Remark",
                      fillColor: Colors.white,
                      focusColor: Colors.grey,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),//<-- SEE HERE
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),//<-- SEE HERE
                      ),

                    ),
                  ).marginOnly(left: 20.0,right: 20.0,bottom: 5.0 ),

                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      controller!.statusUpdated(showMessage: true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Text(
                          'Save',
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
        });
      });
}





