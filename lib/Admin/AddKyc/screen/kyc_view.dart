import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/kyc_controller.dart';


class KycView extends GetView<KycController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Complete KYC".tr,
          style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
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
          // Drop(),
          Drop1(),
          SizedBox(
            height: Get.height*0.008,
          ),

          Container(
            color: Colors.white,
            child:BlockButtonWidget(
              onPressed: () {
                // if(arg.toString()=="add"){
                //   Get.back();
                //
                // }else{
                //   Get.offAndToNamed(Routes.SUCCESS_MEMBER);
                // }
                Get.back();

              },
              color: Colors.orange,
              text: Text(
                "Submit".tr,
                style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
              ),
            ).paddingOnly(top:15,bottom:25,right: 20,left: 20),

          )

        ],
      ).marginOnly(top: 10),
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
    'AC',
    'Refrigerators',
    'Washing Machine',
    'Laptops',
  ];
  String? valueChoose1;
  List listItem1 = [
    'V-23',
    'V-25',
    'V-26',
    'A-61'
  ];

  var process;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 40, right: 40),
            margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
            //     borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            //     boxShadow: [
            //       BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
            //     ],
            //     border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                  ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Full Address',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),
                  ],
                ).paddingOnly(bottom: 10.0),
                Row(
                  children: [
                    // Icon(Icons.home,color: Colors.grey.shade500,).marginOnly(right: 14),
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/3203/3203071.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Address Line 1',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/3203/3203071.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Address Line 2',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/2942/2942076.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'City',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/5042/5042691.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'State',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                Row(
                  children: [
                    Container(
                        width: Get.height * 0.025,
                        height: Get.height * 0.025,
                        child: Icon(Icons.numbers,color: Colors.grey.shade500,)
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Postal Code',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/44/44386.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Country',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 10.0),

                // TextFormField(
                //   cursorColor: Colors.orange,
                //
                //   decoration: InputDecoration(
                //     isDense: true,
                //     contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                //     hintText: 'City',
                //     hintStyle: TextStyle(fontSize: 12),
                //     // labelText: 'Invoice title',
                //     labelStyle: TextStyle(color: Colors.black),
                //     enabledBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(color: page),
                //     ),
                //     focusedBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(color: theme1),
                //     ),
                //   ),
                // ).paddingOnly(bottom: 5.0),


              ],
            ),
          ),
          SizedBox(
            height: Get.height*0.008,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 40, right: 40),
            margin: EdgeInsets.only(left: 00, right: 00, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
                // borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                // boxShadow: [
                //   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                // ],
                // border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Category',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),

                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work_outline_outlined,color: Colors.grey.shade500,),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text(
                            'Please select category',
                            style: TextStyle(fontSize: size.width * ten),
                          ),
                          value: valueChoose,
                          icon: Icon(Icons.arrow_drop_down),
                          // iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * ten,
                              fontWeight: FontWeight.w500
                          ),
                          items: listItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(
                                valueItem,
                                style: TextStyle(
                                    fontSize: size.width * ten,
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height*0.008,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 40, right: 40),
            margin: EdgeInsets.only(left: 00, right: 00, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
                // borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                // boxShadow: [
                //   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                // ],
                // border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Model',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),

                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work_outline_outlined,color: Colors.grey.shade500,),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text(
                            'Please select model',
                            style: TextStyle(fontSize: size.width * ten),
                          ),
                          value: valueChoose1,
                          icon: Icon(Icons.arrow_drop_down),
                          // iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * ten,
                              fontWeight: FontWeight.w500
                          ),
                          items: listItem1.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(
                                valueItem,
                                style: TextStyle(
                                    fontSize: size.width * ten,
                                    color: textColor),
                              ),
                            );
                          }).toList(),
                          onChanged: (
                              newValue,
                              ) {
                            setState(() {
                              valueChoose1 = newValue as String?;
                            });
                          }).marginOnly(left: 14.0,right: 0.0,top: 0.0,bottom: 0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class Drop1 extends StatefulWidget {
  const Drop1({Key? key}) : super(key: key);

  @override
  State<Drop1> createState() => _Drop1State();
}

class _Drop1State extends State<Drop1> {
  String? valueChoose;
  List listItem = [
    'AC',
    'Refrigerators',
    'Washing Machine',
    'Laptops',
  ];
  String? valueChoose1;
  List listItem1 = [
    'V-23',
    'V-25',
    'V-26',
    'A-61'
  ];

  var type = "VAT";
  var process;

  File? file;
  ImagePicker imagePicker = ImagePicker();
  getcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }
  getgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 40, right: 40),
            margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            decoration: BoxDecoration(
              color: page,
              //     borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              //     boxShadow: [
              //       BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
              //     ],
              //     border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Full Address',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),
                  ],
                ).paddingOnly(bottom: 10.0),
                Row(
                  children: [
                    // Icon(Icons.home,color: Colors.grey.shade500,).marginOnly(right: 14),
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/3203/3203071.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Address Line 1',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/3203/3203071.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Address Line 2',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/2942/2942076.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'City',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/5042/5042691.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'State',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                Row(
                  children: [
                    Container(
                        width: Get.height * 0.025,
                        height: Get.height * 0.025,
                        child: Icon(Icons.numbers,color: Colors.grey.shade500,)
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Postal Code',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/44/44386.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Country',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 10.0),

              ],
            ),
          ),
          SizedBox(
            height: Get.height*0.008,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 40, right: 40),
            margin: EdgeInsets.only(left: 00, right: 00, top: 0, bottom: 0),
            decoration: BoxDecoration(
              color: page,
              // borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              // boxShadow: [
              //   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
              // ],
              // border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(type=="VAT"?'VAT':'GST',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(type=="VAT"){
                            type = "GST";
                          }else{
                          type = "VAT";

                          }
                        });
                      },
                      child: Text(type!="VAT"?'For VAT':'For GST',style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.orange)),
                        textAlign: TextAlign.start),
                    ),
                    // GestureDetector(
                    //   onTap: (){
                    //     setState(() {
                    //       type = "GST";
                    //     });
                    //   },
                    //   child: type!="GST"?Text('For GST',style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.orange)),
                    //     textAlign: TextAlign.end,):Container(),
                    // ),

                  ],
                ),
                type=="VAT"?
                Row(
                  children: [
                    Icon(Icons.percent,color: Colors.grey.shade500,).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        keyboardType: TextInputType.phone,

                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Please enter VAT',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingSymmetric(vertical: 10)
                    : Row(
                  children: [
                    Icon(Icons.list_alt_outlined,color: Colors.grey.shade500,).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Please enter GST',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingSymmetric(vertical: 10),

              ],
            ),
          ),
          SizedBox(
            height: Get.height*0.008,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 40, right: 40),
            margin: EdgeInsets.only(left: 00, right: 00, top: 0, bottom: 0),
            decoration: BoxDecoration(
              color: page,
              // borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              // boxShadow: [
              //   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius:10, offset: Offset(0, 5)),
              // ],
              // border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bank Name',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),

                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.home_outlined,color: Colors.grey.shade500,).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        keyboardType: TextInputType.text,

                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Please enter bank name',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingSymmetric(vertical: 10),

              ],
            ),
          ),
          SizedBox(
            height: Get.height*0.008,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 40, right: 40),
            margin: EdgeInsets.only(left: 00, right: 00, top: 0, bottom: 0),
            decoration: BoxDecoration(
              color: page,
              // borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              // boxShadow: [
              //   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
              // ],
              // border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bank Account Number',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),

                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.numbers_rounded,color: Colors.grey.shade500,).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        keyboardType: TextInputType.phone,

                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Please enter account number',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingSymmetric(vertical: 10),

              ],
            ),
          ),

          SizedBox(
            height: Get.height*0.008,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 40, right: 40),
            margin: EdgeInsets.only(left: 00, right: 00, top: 0, bottom: 0),
            decoration: BoxDecoration(
              color: page,
              // borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              // boxShadow: [
              //   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
              // ],
              // border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Account Holder Name',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.account_circle_outlined,color: Colors.grey.shade500,).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        keyboardType: TextInputType.text,

                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Please enter account holder name',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingSymmetric(vertical: 10),

              ],
            ),
          ),

          SizedBox(
            height: Get.height*0.008,
          ),
          // Container(
          //   padding: EdgeInsets.only(top: 20, bottom: 10, left: 40, right: 40),
          //   margin: EdgeInsets.only(left: 00, right: 00, top: 0, bottom: 0),
          //   decoration: BoxDecoration(
          //     color: page,
          //     // borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          //     // boxShadow: [
          //     //   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
          //     // ],
          //     // border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
          //   ),
          //   child: Column(
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text('Model',style: Get.textTheme.bodyText1,
          //             textAlign: TextAlign.start,),
          //
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           Icon(Icons.work_outline_outlined,color: Colors.grey.shade500,),
          //           Expanded(
          //             flex: 1,
          //             child: DropdownButton(
          //                 underline: SizedBox(),
          //                 hint: Text(
          //                   'Please select model',
          //                   style: TextStyle(fontSize: size.width * ten),
          //                 ),
          //                 value: valueChoose1,
          //                 icon: Icon(Icons.arrow_drop_down),
          //                 // iconSize: 36,
          //                 isExpanded: true,
          //                 style: TextStyle(
          //                     color: Colors.black,
          //                     fontSize: size.width * ten,
          //                     fontWeight: FontWeight.w500
          //                 ),
          //                 items: listItem1.map((valueItem) {
          //                   return DropdownMenuItem(
          //                     value: valueItem,
          //                     child: Text(
          //                       valueItem,
          //                       style: TextStyle(
          //                           fontSize: size.width * ten,
          //                           color: textColor),
          //                     ),
          //                   );
          //                 }).toList(),
          //                 onChanged: (
          //                     newValue,
          //                     ) {
          //                   setState(() {
          //                     valueChoose1 = newValue as String?;
          //                   });
          //                 }).marginOnly(left: 14.0,right: 0.0,top: 0.0,bottom: 0),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: Get.height*0.008,
          // ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
            margin: EdgeInsets.only(left:00, right: 00, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
                // borderRadius: buildBorderRadius,
                // boxShadow: [
                //   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                // ],
                // border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Passport/Government ID',style: Get.textTheme.bodyText1,
                            textAlign: TextAlign.start,),
                          GestureDetector(
                            onTap: (){
                              process = "proof";
                              _bottomsheet(context,process);
                            },
                            child: Text('Change',style: Get.textTheme.bodyText1,
                              textAlign: TextAlign.start,),
                          ),
                        ],
                      )),
                ),
                file == null ? Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        process = "proof";
                        _bottomsheet(context,process);
                      },
                      child:  Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.image,size: 30,),
                            Text('Add Image',style: TextStyle(fontSize: 14),)
                          ],
                        ).paddingSymmetric(horizontal: 20,vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade400
                        ),
                      ),
                    ),
                  ],
                ): Row(
                  children: [
                    Container(
                      child: Center(
                        child:  Image.file(
                          file!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _bottomsheet(BuildContext context, process) {
    showModalBottomSheet(context: context, isDismissible: true,builder: (context){
      return Container(
        color: Color(0xFF737373),
        height: 120,
        child: Container(
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      if (process.toString() == "process") {
                        getcam();
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_enhance_rounded,size: 40,),
                        SizedBox(height: 10,),
                        Text('Camera',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      if(process.toString()=="proof"){
                        getgall();
                      }
                      /*else if(process.toString()=="passport"){
                        getpgall();
                        // }else if(process.toString()=="wcompleted"){
                        //   selectMImage();
                      }*/
                      Navigator.pop(context);

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image,size: 40,),
                        SizedBox(height: 10,),
                        Text('Gallery',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  )
              ),

            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),

          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          //   boxShadow: [
          //     BoxShadow(color: Get.theme.focusColor.withOpacity(0.4), blurRadius: 30, offset: Offset(0, -30)),
          //   ],
          // ),

        ),
      );

    });



  }




}