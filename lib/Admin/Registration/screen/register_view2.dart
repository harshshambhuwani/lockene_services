import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../features/common/text_field_widget.dart';
import '../../../features/common/ui.dart';
import '../../../features/profile/widgets/phone_field_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/companydetails_controller.dart';



class CompanyViewNew extends GetView<CompanyController>{


  @override
  Widget build(BuildContext context) {
    controller.loginFormKey = new GlobalKey<FormState>();


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Admin Register".tr,
            style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.orange)),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          elevation: 0,
          // leading: new IconButton(
          //   icon: new Icon(Icons.arrow_back_ios, color: page),
          //   onPressed: () => {Get.find<RootController>().changePageOutRoot(0)},
          // ),
        ),
        body: Form(
          key: controller.loginFormKey,
          child: ListView(
            primary: true,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  // Container(
                  //   height: 160,
                  //   width: Get.width,
                  //   decoration: BoxDecoration(
                  //     color: Colors.orange,
                  //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                  //     boxShadow: [
                  //       BoxShadow(color: Get.theme.focusColor.withOpacity(0.2), blurRadius: 10, offset: Offset(0, 5)),
                  //     ],
                  //   ),
                  //   margin: EdgeInsets.only(bottom: 50),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(20),
                  //     child: Column(
                  //       children: [
                  //         Text(
                  //           "Lockene Services",
                  //           style: Get.textTheme.headline6!.merge(TextStyle(color: page, fontSize: 24)),
                  //         ),
                  //         SizedBox(height: 5),
                  //         Text(
                  //           "Welcome to the best service provider system!".tr,
                  //           style: Get.textTheme.caption!.merge(TextStyle(color: page)),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         // Text("Fill the following credentials to login your account", style: Get.textTheme.caption!.merge(TextStyle(color: Get.theme.primaryColor))),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    decoration: Ui.getBoxDecoration(
                      radius: 14,
                      border: Border.all(width: 5, color: page),
                        color: Colors.black

                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/3188/3188580.png',
                          fit: BoxFit.fitWidth,
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text('Step  2 of 2'.tr,
                style: Get.textTheme.subtitle1!.merge(
                    TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),).paddingOnly(top: 15,bottom:5,right: 20,left: 20),
              Text('Set Up Your \nCompany'.tr,
                style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),).paddingOnly(top: 0,bottom:0,right: 20,left: 20),


              Obx(() {
                if (controller.loading.isTrue) {
                  return CircularLoadingWidget(height: 300);
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PhoneFieldWidget(
                        labelText: "Phone Number".tr,
                        hintText: "000 000 0000".tr,
                        // initialCountryCode: (controller.currentUser.value.getPhoneNumber().countryISOCode),
                        // initialValue: (controller.currentUser.value.getPhoneNumber().number),
                        onSaved: (phone) {
                          // return controller.currentUser?.value?.phoneNumber = phone.completeNumber;
                          // return controller.currentUser.value.phoneNumber = phone!.completeNumber;
                        },
                        isLast: false,
                        isFirst: true,
                      ),
                      // Dropdown(),
                      Drop(),

                      BlockButtonWidget(
                        onPressed: () {
                          // controller.login();
                          // Get.offAllNamed(Routes.ADLOGIN);
                          // Get.back();
                          // Get.back();
                          // showAlert();
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (_) {
                                // return CustomDialog();

                                return Alert();
                              });

                          print('hi');

                        },
                        color: Colors.orange,
                        text: Text(
                          "Submit".tr,
                          style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
                        ),
                      ).paddingOnly(top: 25,bottom:25,right: 20,left: 20),

                    ],
                  );
                }
              }),



            ],
          ),
        ),

        // bottomNavigationBar: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Wrap(
        //       crossAxisAlignment: WrapCrossAlignment.center,
        //       direction: Axis.vertical,
        //       children: [
        //         SizedBox(
        //           width: Get.width,
        //           child: BlockButtonWidget(
        //             onPressed: () {
        //               // controller.login();
        //               //Get.offAllNamed(Routes.PHONE_VERIFICATION);
        //             },
        //             color: Colors.orange,
        //             text: Text(
        //               "Next".tr,
        //               style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
        //             ),
        //           ).paddingOnly(top: 15, bottom: 5, right: 20, left: 20),
        //         ),
        //         TextButton(
        //           onPressed: () {
        //             // Get.toNamed(Routes.ADLOGIN);
        //           },
        //           child: Text("".tr,style: TextStyle(color: Colors.orange)),
        //         ).paddingOnly(bottom: 10),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }



}

class UploadDocument extends StatefulWidget {
   final String click;

   UploadDocument(this.click);

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return widget.click.toString()=="true"?
      Container(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
      decoration: BoxDecoration(
          color: page,
          // borderRadius: buildBorderRadius,
          boxShadow: [
            BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
          ],
          border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
      child: Container(
          alignment: Alignment.bottomLeft,
          child: Text('Photo Identity Proof',style: Get.textTheme.bodyText1,
            textAlign: TextAlign.start,)),
    ):Container(
      height: 20,
      width: 20.0,
      color: Colors.black,);  }
}


class Drop extends StatefulWidget {
  const Drop({Key? key}) : super(key: key);

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
  String? valueChoose;
  List listItem = [
    'Authorized',
    'Private',
  ];
  String? valueChoose1;
  List listItem1 = [
    'Redmi',
    'Videocon',
    'Onida',
    'Sony',
    'Samsung',
  ];
  bool last = false;
  var click = "false";

  File? file;
  File? wpart;
  ImagePicker imagePicker = ImagePicker();
  getcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }
  getgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    // wpart = File(img!.path);
    setState(() {
      file = File(img!.path);
    });
  }
  getpcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      wpart = File(img!.path);
    });
  }
  getpgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    // wpart = File(img!.path);
    setState(() {
      wpart = File(img!.path);
    });
  }

  var process;

  List<String> selectedFruits = [];


  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'AC & Refrigrators',
      'TV & Washing Machine',
      'Carpenter',
      'Electrician',
      'Computer & CCTV',];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }
  bool radius = true;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
                // borderRadius: buildBorderRadius,
                boxShadow: [
                  BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                ],
                border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Text('Company Type',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,)),
                Row(
                  children: [
                    Icon(Icons.apartment_outlined,color: Colors.grey.shade500,),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text(
                            'Please select company type',
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
                              if(valueChoose.toString()=="Private"){
                                last = false;
                                click = "false";
                                radius = true;
                                print(click);

                              }else{
                                last = true;
                                click = 'true';
                                print(click);
                                radius = false;

                              }
                            });
                          }).marginOnly(left: 14.0,right: 0.0,top: 0.0,bottom: 0),
                    ),
                  ],
                ),


              ],
            ),
          ),
          valueChoose.toString()=="Private"?
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
                // borderRadius: buildBorderRadius,
                boxShadow: [
                  BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                ],
                border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
            child: GestureDetector(
              onTap: (){
                _showMultiSelect();
                print('hi');
              },
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: Text('Company Industry',style: Get.textTheme.bodyText1,
                        textAlign: TextAlign.start,)),


                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 15),
                    child: Row(
                      children: [
                        _selectedItems.isEmpty ?
                        Icon(
                          Icons.work,
                          color: Colors.grey,
                          // size: 20.09,
                        ):Container(),
                        _selectedItems.isEmpty ?
                        Expanded(
                          flex: 1,
                          child:  Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                              'Select your industry',
                              style: TextStyle(fontSize: size.width * thirteen,color: Colors.grey.shade600),
                            ),
                          ),
                        )
                            : Expanded(
                          flex: 1,
                          child: Wrap(
                            // alignment: WrapAlignment.center,
                            children: _selectedItems
                                .map((e) => Padding(
                              padding: const EdgeInsets.only(
                                  left: 3.0, right: 3.0),
                              child: Chip(
                                label: Text(e),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                          // size: 20.09,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ): Container(),
          click.toString()=="true"?
          Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                  decoration: BoxDecoration(
                      color: page,
                      borderRadius: buildBorderRadius,
                      boxShadow: [
                        BoxShadow(
                            color: Get.theme.focusColor.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5)),
                      ],
                      border: Border.all(
                          color: Get.theme.focusColor.withOpacity(0.05))),
                  child: Column(children: [
                    Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Company Name',
                          style: Get.textTheme.bodyText1,
                          textAlign: TextAlign.start,
                        )),
                    Row(
                      children: [
                        Icon(Icons.build_circle_outlined,color: Colors.grey.shade500,),
                        Expanded(
                          flex: 1,
                          child: DropdownButton(
                              underline: SizedBox(),
                              hint: Text(
                                'Please select company name',
                                style: TextStyle(fontSize: size.width * thirteen),
                              ),
                              value: valueChoose1,
                              icon: Icon(Icons.arrow_drop_down),
                              // iconSize: 36,
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.width * thirteen,
                                  fontWeight: FontWeight.w500
                              ),
                              items: listItem1.map((valueItem) {
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
                                  valueChoose1 = newValue as String?;
                                  // if(valueChoose.toString()=="Private"){
                                  //   last = false;
                                  //   // click = "false";
                                  //   print(click);
                                  //
                                  // }else{
                                  //   last = true;
                                  //   click = 'true';
                                  //   print(click);
                                  //
                                  // }
                                });
                              }).marginOnly(left: 14.0,right: 0.0,top: 0.0,bottom: 0),
                        ),
                      ],
                    ),

                  ]))
              : Container(),
          TextFieldWidget(
            labelText: "Company Address".tr,
            hintText: "Please enter company address".tr,
            // initialValue: (controller.currentUser.value.name)!,
            // onSaved: (input) => controller.currentUser.value.name = input,
            validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
            iconData: Icons.location_on,
            isFirst: false,
            isLast: radius,
          ),

          click.toString()=="true"?
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
                // borderRadius: buildBorderRadius,
                boxShadow: [
                  BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                ],
                border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Authorized Certificate Image',style: Get.textTheme.bodyText1,
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
          ):Container(),
          click.toString()=="true"?
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                ],
                border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Passport Size Photo',style: Get.textTheme.bodyText1,
                            textAlign: TextAlign.start,),
                          GestureDetector(
                            onTap: (){
                              process = "passport";
                              _bottomsheet(context,process);
                            },
                            child: Text('Change',style: Get.textTheme.bodyText1,
                              textAlign: TextAlign.start,),
                          ),
                        ],
                      )),
                ),
                wpart == null ? Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        process = "passport";
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
                          wpart!,
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
          ):Container(),

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
                          }else if(process.toString()=="passport"){
                            getpcam();
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
                      }else if(process.toString()=="passport"){
                        getpgall();
                      // }else if(process.toString()=="wcompleted"){
                      //   selectMImage();
                      }
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


  BorderRadius get buildBorderRadius {
    if (last) {
      return BorderRadius.vertical(bottom: Radius.circular(0));
    }
    if (!last ) {
      return BorderRadius.vertical(bottom: Radius.circular(10));
    }
    return BorderRadius.all(Radius.circular(10));
  }
}

class Dropdown extends StatefulWidget {
  // final List<String> items;

  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {



  List<String> selectedFruits = [];


  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'AC & Refrigrators',
      'TV & Washing Machine',
      'Carpenter',
      'Electrician',
      'Computer & CCTV',];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
      Container(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
      decoration: BoxDecoration(
          color: page,
          // borderRadius: buildBorderRadius,
          boxShadow: [
            BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
          ],
          border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
      child: GestureDetector(
        onTap: (){
          _showMultiSelect();
          print('hi');
        },
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
                child: Text('Company Industry',style: Get.textTheme.bodyText1,
                  textAlign: TextAlign.start,)),


            Padding(
              padding: const EdgeInsets.only(top: 10.0,bottom: 15),
              child: Row(
                children: [
                  _selectedItems.isEmpty ?
                  Icon(
                    Icons.work,
                    color: Colors.grey,
                    // size: 20.09,
                  ):Container(),
              _selectedItems.isEmpty ?
                  Expanded(
                    flex: 1,
                    child:  Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                              'Select your industry',
                              style: TextStyle(fontSize: size.width * thirteen,color: Colors.grey.shade600),
                            ),
                          ),
                        )
                      : Expanded(
                          flex: 1,
                          child: Wrap(
                            // alignment: WrapAlignment.center,
                            children: _selectedItems
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3.0, right: 3.0),
                                      child: Chip(
                                        label: Text(e),
                                      ),
                                    ))
                                .toList(),
                          ),
                      ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                    // size: 20.09,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];


// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text('Select your industry'),
      content: Container(
        width: size.width * 0.9,
        child: SingleChildScrollView(
          child: ListBody(
            children: widget.items
                .map((item) => CheckboxListTile(
              value: _selectedItems.contains(item),
              title: Text(item),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (isChecked) => _itemChange(item, isChecked!),
            ))
                .toList(),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel',style: TextStyle(color: Colors.black,),),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: ElevatedButton(
            onPressed: _submit,
            child: const Text('Submit'),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              //onPrimary: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class Alert extends StatefulWidget {
  const

  Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.zero,
      // title: Text('Update Status'),
    content: Container(
    width: size.width * 0.9,
    child: Column(children: [
      Container(
        height: size.width *0.4,
        width: size.width *0.4,
        child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_sjeuhlxx.json')),
      Text('Registration Successful'.tr,
        style: TextStyle(
            color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
      ElevatedButton(onPressed: (){
        Navigator.of(context).pop();
        Get.offAndToNamed(Routes.ADLOGIN);

        // Get.back();
      }
      , child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
        child: Text('Ok',style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16)),
      ),
        style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.orange),
      ).marginOnly(bottom: 20.0,top: 8.0),

    ],),
    )
    );

  }
}








