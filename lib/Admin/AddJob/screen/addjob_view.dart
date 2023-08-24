
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
// import 'package:toggle_switch/toggle_switch.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/addjob_controller.dart';



class AddJobView extends GetView<AddJobController>{

  final arg = Get.arguments;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    controller.loginFormKey = new GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create New Job".tr,
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
                Get.toNamed(Routes.ALL_LINE,arguments: "jobadd");

              },
              child: arg.toString()!="back2"?
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

            Text('Select Warranty',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),

            // GetWarranty(),
            MyButtons(),
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
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
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
  void _pickDateDialog(BuildContext context) {
    showDatePicker(
        context: context,

        initialDate: DateTime.now(),
        //which date will display when user open the picker
        lastDate : DateTime(2051),
        //what will be the previous supported year in picker

        firstDate: DateTime
            .now(),
        builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.orange, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.black, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
    ) //what will be the up to supported date in picker
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
            _pickDateDialog(context);
          },
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    // Text(
                    //   'Select Date :',
                    //   style: Get.textTheme.subtitle2!.merge(TextStyle(
                    //       fontWeight: FontWeight.w500, color: Colors.black)),
                    // ),
                    Icon(Icons.calendar_today_rounded),
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
                  // Text(
                  //   'Start Time :',
                  //   style: Get.textTheme.subtitle2!.merge(TextStyle(
                  //       fontWeight: FontWeight.w500, color: Colors.black)),
                  // ),
            Icon(Icons.access_time).paddingOnly(top: 1.0),

            Container(
                    padding: EdgeInsets.only(top: 16,left: 10,right: 10,bottom: 16),
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
class MyButtons extends StatefulWidget {
  @override
  _MyButtonsState createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  bool _isButtonEnabled = false;
  bool _isButtonEnabled1 = false;

  void _handleButtonClick() {
    setState(() {
      _isButtonEnabled = !_isButtonEnabled;
    });
  }



  @override
  Widget build(BuildContext context) {
    Color button1Color =
    _isButtonEnabled ? Colors.orange : Colors.grey.shade400; // define color based on boolean
    Color button2Color =
    !_isButtonEnabled ? Colors.orange : Colors.grey.shade400; // define color based on boolean

    MaterialStateProperty<Color> containerColor = MaterialStateProperty.all<Color>(button1Color);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                    if(!_isButtonEnabled){
                      setState(() {
                        print("hi");
                        _isButtonEnabled=true;
                        Color button1Color = Colors.orange;
                        Color button2Color = Colors.grey.shade200;

                      });
                    }
                    print('CLICKED 1');
                    showDialog(
                        // barrierDismissible: false,
                        context: context,
                        builder: (_) {
                          return Upload();
                          // return CustomDialogService();
                        });

                    // Upload();
              },
              child: Container(
                height: Get.width*0.33,
                width:  Get.width*0.33,
                decoration: BoxDecoration(
                    color: button1Color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Icon(Icons.verified_user,size: 75,color: Colors.white),
                Text('WARRANTY',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: Get.width * eleven),).paddingOnly(left: 10,right: 10)
              ],),
              ),
            ),
            GestureDetector(
              onTap: (){
                    if(_isButtonEnabled ){
                      setState(() {
                        print("hi1");
                        _isButtonEnabled=false;
                        Color button1Color = Colors.grey.shade200;
                        Color button2Color = Colors.orange;
                      });
                    }
                    print('CLICKED 2');


              },
              child: Container(
                height: Get.width*0.33,
                width:  Get.width*0.33,
                decoration: BoxDecoration(
                  color: button2Color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Icon(Icons.shield_sharp,size: 75,color: Colors.white),
                Text('NON\nWARRANTY',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: Get.width * eleven),).paddingOnly(left: 10,right: 10)
              ],).paddingOnly(left: 10,right: 10),
              ).marginOnly(left:Get.width * 0.1),
            ),
          ],
        )

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

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  File? file;
  File? uwfile;
  File? wpart;
  File? wmachine;
  ImagePicker imagePicker = ImagePicker();
  var process;
  List<XFile> imageFileList = [];
  List<XFile> wpartlist = [];
  List<XFile> wmachinelist = [];
  List<XFile> unwarrantylist = [];
  bool _value1 = false;
  bool _value = false;



  getcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  void selectWImage() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();

    setState(() {
      if(wpartlist.isEmpty){
        wpartlist.addAll(selectedImages!);
      }else{
        wpartlist.addAll(selectedImages!);
      }
    });
  }

  void selectMImage() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();

    setState(() {
      if(wmachinelist.isEmpty){
        wmachinelist.addAll(selectedImages!);
      }else{
        wmachinelist.addAll(selectedImages!);
      }
    });
  }

  getwpgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      wpart = File(img!.path);
    });
  }
  getwpcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      wpart = File(img!.path);
    });
  }
  getmpgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      wmachine = File(img!.path);
    });
  }
  getmpcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      wmachine = File(img!.path);
    });
  }





  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        title: Text('Update Documents'),
        content: Container(
          width: size.width * 0.9,
          child: Column(children: [
            CheckboxListTile
              (
              title: const Text("I don't have bill"),
              // subtitle: const Text('A computer science portal for geeks.'),
              // secondary: const Icon(Icons.code),
              controlAffinity: ListTileControlAffinity.leading,
              autofocus: false,
              activeColor: Colors.orange,
              checkColor: Colors.white,
              selected: _value1,
              value: _value1,
              onChanged: (value) {
                setState(() {
                  _value1 = value!;
                  print(value);
                });
              },
            ),

              if(_value1==false)
                Column(children: [
                  Container(
                    // height: 80.0,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          'Upload Bill',
                          style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        if(wpartlist.isNotEmpty)
                          GestureDetector(
                            onTap: (){
                              process = "Part change required";
                              _bottomsheet(context,process);
                            },
                            child: Row(
                              children: [
                                Text('Add more',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
                                Icon(Icons.add,color: Colors.orange,),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),

                  if( wpartlist.isEmpty)
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            process = "Part change required";
                            _bottomsheet(context, process);
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 50,
                                ),
                                Text(
                                  'Add Image',
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ).paddingSymmetric(horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade400),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 20,vertical: 5.0),

                  if( wpartlist.isNotEmpty)
                    Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: wpartlist.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (BuildContext context,int index){
                              return Container(
                                decoration: BoxDecoration(color: Colors.white,),
                                child: Padding(
                                  padding: const EdgeInsets.all (2.0),
                                  child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Image.file(
                                          File(wpartlist[index].path),
                                          fit: BoxFit.cover,
                                        ), // Image.file
                                        Positioned(
                                          right: 00,
                                          left: 0,
                                          child: GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                wpartlist.removeAt(index);
                                              });
                                            },
                                            child: Container(
                                              color: Color.fromRGBO (167, 167, 167, 0.5019607843137255),
                                              child: Icon(Icons.delete,color: Colors.orange,),
                                            ),
                                          ), // Container
                                        ),
                                      ]), // Stack
                                ),
                                // Image.file(File(imageFileList[index].path),fit: BoxFit.cover,).paddingSymmetric(horizontal: 5.0,vertical: 5.0)
                              );
                            })).paddingSymmetric(horizontal: 20.0),

                ],),

            CheckboxListTile
              (
              title: const Text("I don't have warranty card"),
              // subtitle: const Text('A computer science portal for geeks.'),
              // secondary: const Icon(Icons.code),
              controlAffinity: ListTileControlAffinity.leading,
              autofocus: false,
              activeColor: Colors.orange,
              checkColor: Colors.white,
              selected: _value,
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value!;
                  print(value);
                });
              },
            ),
            if(_value==false)
             Column(children: [
               Container(
                 // height: 80.0,
                 width: double.infinity,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       'Upload Warranty Card',
                       style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w500,fontSize: size.width * twelve,
                       ),
                       textAlign: TextAlign.start,
                     ),
                     if(wmachinelist.isNotEmpty)
                       GestureDetector(
                         onTap: (){
                           process = "Part change required 1";
                           _bottomsheet(context,process);
                         },
                         child: Row(
                           children: [
                             Text('Add more',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
                             Icon(Icons.add,color: Colors.orange,),
                           ],
                         ),
                       ),
                   ],
                 ),
               ).marginOnly(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),

               if( wmachinelist.isEmpty)
                 Row(
                   children: [
                     GestureDetector(
                       onTap: () {
                         process = "Part change required 1";
                         _bottomsheet(context, process);
                       },
                       child: Container(
                         alignment: Alignment.centerLeft,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.image,
                               size: 50,
                             ),
                             Text(
                               'Add Image',
                               style: TextStyle(fontSize: 14),
                             )
                           ],
                         ).paddingSymmetric(horizontal: 20, vertical: 20),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.grey.shade400),
                       ),
                     ),
                   ],
                 ).paddingSymmetric(horizontal: 20,vertical: 5.0),

               if( wmachinelist.isNotEmpty)
                 Container(
                     height: 120,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20.0),
                     ),
                     child: GridView.builder(
                         scrollDirection: Axis.vertical,
                         itemCount: wmachinelist.length,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 3,
                         ),
                         itemBuilder: (BuildContext context,int index){
                           return Container(
                             decoration: BoxDecoration(color: Colors.white,),
                             child: Padding(
                               padding: const EdgeInsets.all (2.0),
                               child: Stack(
                                   fit: StackFit.expand,
                                   children: [
                                     Image.file(
                                       File(wmachinelist[index].path),
                                       fit: BoxFit.cover,
                                     ), // Image.file
                                     Positioned(
                                       right: 00,
                                       left: 0,
                                       child: GestureDetector(
                                         onTap: (){
                                           setState(() {
                                             wmachinelist.removeAt(index);
                                           });
                                         },
                                         child: Container(
                                           color: Color.fromRGBO (167, 167, 167, 0.5019607843137255),
                                           child: Icon(Icons.delete,color: Colors.orange,),
                                         ),
                                       ), // Container
                                     ),
                                   ]), // Stack
                             ),
                             // Image.file(File(imageFileList[index].path),fit: BoxFit.cover,).paddingSymmetric(horizontal: 5.0,vertical: 5.0)
                           );
                         })).paddingSymmetric(horizontal: 20.0),

             ],),





            // ElevatedButton(onPressed: (){
            //   Navigator.of(context).pop();
            //   Get.back();
            // }
            //   , child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
            //     child: Text('Ok',style: TextStyle(
            //         color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16)),
            //   ),
            //   style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.orange),
            // ).marginOnly(bottom: 20.0,top: 8.0),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                // controller!.statusUpdated(showMessage: true);
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

          ],),
        )
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
                      getcam();
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
                      // 'Part change required',
                      // 'Part replacement under warranty',
                      // 'Part replacement under non-warranty',
                      if(process.toString()=="Part change required"){
                        selectWImage();
                      }else if(process.toString()=="Part change required 1"){
                        selectMImage();
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

}