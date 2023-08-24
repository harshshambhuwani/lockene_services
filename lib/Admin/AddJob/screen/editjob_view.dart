import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/addjob_controller.dart';
import '../controller/editjob_controller.dart';



class EditJobView extends GetView<EditJobController>{

  final arg = Get.arguments;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    controller.loginFormKey = new GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Job".tr,
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
        body: ListView(
          primary: true,
          children: [
            Text('Service for',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.ALL_CLIENT);
              },
              child: Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: arg.toString()!="back"?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(Icons.person_outline_sharp,size: 27,),
                      Text('Client',
                        style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),

                      ).paddingOnly(left: 10.0)
                    ],),
                    Icon(Icons.add,size: 27,color: Colors.orange,)
                  ],
                ).paddingSymmetric(horizontal: 20.0,vertical: 20.0)
                    :Column(
                      children: [
                        Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        Row(children: [
                          Icon(Icons.person,size: 27,),
                          Text('Ankush Thengne',
                            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),

                          ).paddingOnly(left: 10.0)
                        ],),
                        Icon(Icons.edit_outlined,size: 25,color: Colors.black,)
                  ],
                ),
                        Row(children: [
                          Icon(Icons.work_outline_outlined,size: 27,color: Colors.grey.shade600),
                          Text('Web Developer',
                            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),

                          ).paddingOnly(left: 10.0)
                        ],).paddingOnly(top: 5.0),

                      ],
                    ).paddingSymmetric(horizontal: 20.0,vertical: 20.0),

              ),
            ),
            Text('Overview',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            Container(
              // height: size.height * 0.08,
              color: Colors.white,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Job title',
                  labelText: 'Job title',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme1),
                  ),
                ),
              ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            ),
            Text('Work',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.ALL_LINE);

              },
              child: arg.toString()!="back1"?
            Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(Icons.business_center_outlined,size: 27,),
                      Text('Line Item',
                        style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),

                      ).paddingOnly(left: 10.0)
                    ],),
                    Icon(Icons.add,size: 27,color: Colors.orange,)
                  ],
                ).paddingSymmetric(horizontal: 20.0,vertical: 20.0),
              ):Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.business_center_outlined,size: 27,),
                          Text('Line Item',
                            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),

                          ).paddingOnly(left: 10.0)
                        ],),
                        Icon(Icons.add,size: 27,color: Colors.orange,)
                      ],
                    ),
                    Text('Web Developer',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),

                    ).paddingOnly(top: 5.0),
                    Text('Test',
                      style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),

                    ).paddingOnly(top: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text('1 x ',
                            style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),

                          ),
                          Text('₹ 1,000',
                            style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),

                          ),
                        ],),
                        Text('₹ 1,000 ',
                          style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),

                        ),

                      ],
                    ),
                  ],

                ).paddingSymmetric(horizontal: 20.0,vertical: 20.0),
              ),
            ),
            SizedBox(
              height: size.height*0.01,
            ),
            Container(
              // height: size.height * 0.08,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                  ),
                  Text(
                    '₹ 0.00',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                  )
                ],
              ).paddingSymmetric(horizontal: 20.0,vertical: 20.0),
            ),
            Text('Schedule',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            GetHours(),
            Text('Team',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.ALL_MEMBER);
              },
              child: Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: arg.toString()!="back"?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(Icons.person_outline_sharp,size: 27,),
                      Text('Add Team',
                        style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),

                      ).paddingOnly(left: 10.0)
                    ],),
                    Icon(Icons.add,size: 27,color: Colors.orange,)
                  ],
                ).paddingSymmetric(horizontal: 20.0,vertical: 20.0)
                    :Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.person,size: 27,),
                          Text('Ankush Thengne',
                            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),

                          ).paddingOnly(left: 10.0)
                        ],),
                        Icon(Icons.edit_outlined,size: 25,color: Colors.black,)
                      ],
                    ),
                    Row(children: [
                      Icon(Icons.call,size: 27,color: Colors.grey.shade600),
                      Text('Carpenter',
                        style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),

                      ).paddingOnly(left: 10.0)
                    ],).paddingOnly(top: 5.0),

                  ],
                ).paddingSymmetric(horizontal: 20.0,vertical: 20.0),

              ),
            ),
            Container(color: Colors.white,
              child: BlockButtonWidget(
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) {
                        // return CustomDialog();

                        return Alert();
                      });
                },
                color: Colors.orange,
                text: Text(
                  "Submit".tr,
                  style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
                ),
              ).paddingOnly(top: 15,bottom:15,left: 20,right: 20.0),
            ).paddingOnly(top:size.height*0.01,),


          ],
        ),

      ),
    );
  }
}

class GetHours extends StatefulWidget {
  const GetHours({Key? key}) : super(key: key);

  @override
  State<GetHours> createState() => _GetHoursState();
}

class _GetHoursState extends State<GetHours> {
  DateTime? _selectedDate;

  TimeOfDay? _selectedTime /*= TimeOfDay.now()*/;
  TimeOfDay? _selectedTime1 /*= TimeOfDay.now()*/;


  //Method for showing the time picker
  void _showTimePicker() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  //Method for showing the time picker
  void _showTimePicker1() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        _selectedTime1 = time;
      });
    }
  }

  //Method for showing the date picker
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



  @override
    Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _pickDateDialog();
          },
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Select Date :',
                      style: Get.textTheme.subtitle2!.merge(TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black)),
                    ),
                    Text(
                      _selectedDate ==
                              null //ternary expression to check if date is null
                          ? 'Please select date to schedule'
                          : '${DateFormat.yMMMd().format(_selectedDate!)}',
                      style: Get.textTheme.subtitle2!.merge(TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.orange)),
                    ).paddingOnly(left: 10.0),
                  ],
                ).paddingOnly(top: 20.0, left: 20.0,right: 20.0,bottom: 1.0)
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap:(){
            _showTimePicker();
            // print(_selectedTime);
          },
          child: Container(
            color: Colors.white,
          child:  Row(children: [
                  Text(
                    'Start Time :',
                    style: Get.textTheme.subtitle2!.merge(TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(_selectedTime==null? "Please select start time":
                      _selectedTime!.format(context),
                      style: TextStyle(fontSize: 14,color: Colors.orange,fontWeight: FontWeight.w500),
                    ),
                  ),

                ],).paddingOnly(right: 20,left: 20.0,bottom: 10.0,top: 0.0)
          ),
        ),
        // GestureDetector(
        //   onTap:(){
        //     _showTimePicker1();
        //     // print(_selectedTime);
        //   },
        //   child: Container(
        //     color: Colors.white,
        //   child:  Row(children: [
        //           Text(
        //             'End Time : ',
        //             style: Get.textTheme.subtitle2!.merge(TextStyle(
        //                 fontWeight: FontWeight.w500, color: Colors.black)),
        //           ),
        //           Container(
        //             // padding: EdgeInsets.all(16),
        //             child: Text(_selectedTime1==null? "Please select start time":
        //               _selectedTime1!.format(context),
        //               style: TextStyle(fontSize: 14,color: Colors.orange,fontWeight: FontWeight.w500),
        //             ),
        //           ),
        //
        //         ],).paddingOnly(right: 20,left: 20.0,bottom: 20.0,top: 0.0)
        //   ),
        // ),

      ],
    );
  }
}


class Alert extends StatefulWidget {
  const Alert({Key? key}) : super(key: key);

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
                child: Lottie.network('https://assets5.lottiefiles.com/temporary_files/ofgUtS.json')),
            Text('Job Added Successful'.tr,
              style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
              Get.back();
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