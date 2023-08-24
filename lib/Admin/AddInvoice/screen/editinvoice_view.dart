import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/addinvoice_controller.dart';
import '../controller/editinvoice_controller.dart';



class EditInvoiceView extends GetView<EditInvoiceController>{

  final arg = Get.arguments;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    controller.loginFormKey = new GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Invoice".tr,
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
            Text('Billed to',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.ALL_CLIENT);
              },
              child: Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child:Column(
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
                initialValue: 'Garden Cleaning',
                decoration: InputDecoration(
                  hintText: 'Invoice title',
                  labelText: 'Invoice title',
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
            GetHours(),
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
            SizedBox(
              height: size.height*0.01,
            ),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.DISCT_QUOTE);
              },
              child: Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(
                          color: Colors.black)),
                    ),
                    Text(
                      '₹ 0.00',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.orange)),
                    )
                  ],
                ).paddingSymmetric(horizontal: 20.0,vertical: 20.0),
              ),
            ),
            SizedBox(
              height: size.height*0.01,
            ),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.TAX_QUOTE);

              },
              child: Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(
                          color: Colors.black)),
                    ),
                    Text(
                      '₹ 0.00',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.orange)),
                    )
                  ],
                ).paddingSymmetric(horizontal: 20.0,vertical: 20.0),
              ),
            ),
            Container(
              // height: size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(
                        color: Colors.black)),
                  ),
                  Text(
                    '₹ 0.00',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                  )
                ],
              ).paddingSymmetric(horizontal: 20.0,vertical: 20.0),
            ),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.DEPOSIT_QUOTE);

              },
              child: Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Required deposit',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(
                          color: Colors.black)),
                    ),
                    Text(
                      '₹ 0.00',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.orange)),
                    )
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
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Instructions',
                  labelText: 'Instructions',
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
            Container(color: Colors.white,
              child: BlockButtonWidget(
                onPressed: () async {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) {
                        return Alert();
                      });
                  // await Get.toNamed(Routes.TECHDASHBOARD,arguments: "admin");
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

  String? valueChoose;
  List listItem = [
    'Date Send',
    'Custom',
  ];
  DateTime? _selectedDate;
  String? valueChoose1;
  List listItem1 = [
    'Upto receipt',
    'Net 15',
    'Net 30',
    'Net 45',
    'Custom',
  ];
  DateTime? _selectedDate1;
  //Method for showing the date picker
  void _pickDateDialog() {
    // String dateString = "2022-02-28"; // the date string you want to set as initial date
    // DateTime initialDate = DateTime.parse(dateString); // convert the string to a DateTime object

    showDatePicker(
        context: context,
        // initialDate: initialDate,
        initialDate:DateTime.now(),
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
        if(_selectedDate1==null){
          print('date null');
        }else{
          print('date');
          print(_selectedDate1);

        }
      });
    });
  }
  void _pickDateDialog1() {
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
        _selectedDate1 = pickedDate;
        if(_selectedDate1==null){
          print('date null');
        }else{
          print('date');
        }
      });
    });
  }


  var process;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 00, left:0, right: 0),
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Issued Date',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),
                    valueChoose=="Custom"?
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          valueChoose="Date Send";
                        });
                      },
                      child: Text('Set Default',style: Get.textTheme.caption!.merge(TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                        textAlign: TextAlign.start,),
                    ):Container(),
                  ],
                ),
                valueChoose!="Custom"?
                Row(
                  children: [
                    Icon(Icons.calendar_today_rounded,color: Colors.grey.shade700,size: 20,),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text(
                            'Please select issued date',
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
                ):GestureDetector(
                  onTap: _pickDateDialog,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_rounded,size: 20,),
                        Text(
                          _selectedDate ==
                              null //ternary expression to check if date is null
                              ? 'Please select issued date'
                              : '${DateFormat.yMMMd().format(_selectedDate!)}',
                          style: Get.textTheme.subtitle2!.merge(TextStyle(
                              fontWeight: FontWeight.w500)),
                        ).paddingOnly(left: 10.0),
                      ],
                    ),

                  ).paddingOnly(top: 10),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 00, left:0, right: 0),
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment Due',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),
                    valueChoose1=="Custom"?
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          valueChoose1="Upto receipt";
                        });
                      },
                      child: Text('Set Default',style: Get.textTheme.caption!.merge(TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                        textAlign: TextAlign.start,),
                    ):Container(),
                  ],
                ),
                valueChoose1!="Custom"?
                Row(
                  children: [
                    Icon(Icons.calendar_today_rounded,color: Colors.grey.shade700,size: 20,),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text(
                            'Please select payment due',
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
                ):GestureDetector(
                  onTap: _pickDateDialog1,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_rounded,size: 20,),
                        Text(
                          _selectedDate1 ==
                              null //ternary expression to check if date is null
                              ? 'Please select payment due'
                              : '${DateFormat.yMMMd().format(_selectedDate1!)}',
                          style: Get.textTheme.subtitle2!.merge(TextStyle(
                              fontWeight: FontWeight.w500)),
                        ).paddingOnly(left: 10.0),
                      ],
                    ),

                  ).paddingOnly(top: 10),
                ),
              ],
            ),
          ),

        ],
      ).paddingOnly(bottom: 20.0),
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
            Text('Invoice Added Successful'.tr,
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
