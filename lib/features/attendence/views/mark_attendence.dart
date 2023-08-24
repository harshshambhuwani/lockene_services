import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../common/ui.dart';
import '../controllers/attendence_controller.dart';


class MarkAttendence extends GetView<AttendenceController> {
  // final bool hideAppBar;

  // MarkAttendence({this.hideAppBar = false}) {
  //   // controller.profileForm = new GlobalKey<FormState>();
  // }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
                title: Text(
                  "Mark Attendence".tr,
                  style: context.textTheme.subtitle1,
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                  onPressed: () => Get.back(),
                ),
                actions: [
                   GestureDetector(
                       onTap: (){
                         Get.back();
                       },
                       child: Text('Skip',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,),textAlign: TextAlign.justify,).marginSymmetric(horizontal: 20.0,vertical: 18.0))
                ],
                elevation: 0,
              ),
        body: ListView(
          primary: true,
          children: [
            AttendenceDetails(),
          ],
        ));
  }
}

class AttendenceDetails extends StatefulWidget {
  const AttendenceDetails({Key? key}) : super(key: key);

  @override
  State<AttendenceDetails> createState() => _AttendenceDetailsState();
}

class _AttendenceDetailsState extends State<AttendenceDetails> {
  bool inTime = false;
  bool outTime= false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return Column(
      children: [
        Container(
          height: size.height * 0.65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: size.height * 0.07,
                child: CircleAvatar(
                  radius: size.height * 0.068,

                  backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/2482/2482458.png'),
                ),
              ).paddingOnly(top: size.height * 0.02,bottom: size.height * 0.01),
              Text('Rajat Meshram',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),).paddingOnly(bottom: size.height * 0.005),
              Text('Android Developer',style: TextStyle(color: Colors.blueGrey,fontSize: 14),).paddingOnly(bottom: size.height * 0.002),
              Text('Date : 18 Feb 2023',style: TextStyle(color: Colors.blueGrey,fontSize: 14),).paddingOnly(bottom: size.height * 0.002),
              Container(
                height: size.height * 0.32,
                child: Row(
                  children: [
                    Expanded(
                        flex:1,
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                  flex:2 ,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.black,
                                  )),
                              Expanded(
                                  flex:3 ,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,

                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ).marginSymmetric(horizontal: size.width * 0.05)),
                              Expanded(
                                  flex:2 ,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.black,
                                  )),
                            ],
                          ),
                        )
                    ),
                    Expanded(
                        flex:2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                flex:3,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('Punch-In\nDetails',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                                )),
                            Expanded(flex:2,
                                child: Container(
                                )),
                            Expanded(flex:3,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('Punch-Out\nDetails',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                                )),
                          ],
                        )
                    ),
                    Expanded(
                      flex:3,
                      child: Column(
                        children: [
                          Expanded(
                              flex:4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if(!inTime)
                                  Icon(Icons.warning_amber_outlined,size: 25,color: Colors.red,),
                                  if(!inTime)
                                  SizedBox(height:5.0,),
                                  if(!inTime)
                                  Text('Please \nMark Attendence',softWrap: true,style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                                  if(inTime)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.arrow_downward,color: Colors.green.shade700,size: 20,),
                                        SizedBox(width:3.0,),
                                        Text('10:30 AM',
                                          style: Get.textTheme.subtitle2!.merge(TextStyle(color:Colors.green.shade700,fontWeight: FontWeight.w500)),textAlign: TextAlign.start,),
                                      ],
                                    ),
                                  if(inTime)
                                    SizedBox(height:5.0,),
                                  if(inTime)
                                    Row(
                                      children: [
                                        SizedBox(width: 5),
                                        Flexible(
                                          child: Text(
                                            "Plot No.64, Shankar Nagar,Nagpur.",
                                            maxLines: 4,
                                            overflow: TextOverflow.fade,
                                            // softWrap: false,
                                            style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.grey.shade500)),
                                          ),
                                        ),
                                      ],
                                    ),

                                ],
                              ),

                          ),
                          Expanded(
                              flex:1,
                              child: Container(
                                color: Colors.white,

                              )),
                          Expanded(
                            flex:4,
                            child: Container(
                                alignment: Alignment.bottomCenter,
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if(!outTime)
                                      Icon(Icons.warning_amber_outlined,size: 25,color: Colors.red,),
                                    if(!outTime)
                                      SizedBox(height:5.0,),
                                    if(!outTime)
                                      Text('Please \nMark Attendence',softWrap: true,style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                                    if(outTime)
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.arrow_upward,color: Colors.red.shade700,size: 20,),
                                          SizedBox(width:3.0,),
                                          Text('10:30 AM',
                                            style: Get.textTheme.subtitle2!.merge(TextStyle(color:Colors.red.shade700,fontWeight: FontWeight.w500)),textAlign: TextAlign.start,),
                                        ],
                                      ),
                                    if(outTime)
                                      SizedBox(height:5.0,),
                                    if(outTime)
                                      Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Text(
                                              "Plot No.64, Shankar Nagar,Nagpur.",
                                              maxLines: 4,
                                              overflow: TextOverflow.fade,
                                              // softWrap: false,
                                              style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.grey.shade500)),
                                            ),
                                          ),
                                        ],
                                      ),

                                  ],
                                )

                            ),),
                        ],
                      ),
                    ),
                  ],
                ),


              ).paddingOnly(top: size.height * 0.02,bottom: size.height * 0.02,left: size.width * 0.03,right:  size.width * 0.03 ),
            ],
          ),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xffDDDDDD),
                blurRadius: 6.0,
                spreadRadius: 2.0,
                offset: Offset(0.0, 0.0),
              )
            ],
          ),
        )
            .marginSymmetric(horizontal: size.width * 0.08,vertical: size.width * 0.08),
        // if(!inTime)
        //   SlideAction(
        //   borderRadius: 8,
        //   elevation: 6,
        //   outerColor: Colors.orange,
        //   sliderButtonIcon: Icon(Icons.work_outline_outlined,color: Colors.black,),
        //   text: 'Slide to Punch-In',
        //   textStyle: TextStyle(fontSize: 18,color: Colors.white),
        //   onSubmit: (){
        //
        //     setState(() async{
        //       // Position position = await _determinePosition();
        //       // // print(position.latitude);
        //       // location = "Lat : ${position.latitude} , Long : ${position.longitude}";
        //       // GetAddressFromLatLong(position);
        //       // setState(() {
        //       //   print(Address);
        //       // });
        //       inTime = true;
        //       print('hi');
        //       Get.showSnackbar(Ui.SuccessSnackBar(message: "Check In-time marked Successfully".tr));
        //
        //     });
        //   },
        // ).marginSymmetric(horizontal: size.width * 0.08),
        // if(!)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child:
          inTime == false ?
          SlideAction(

            borderRadius: 8,
            elevation: 0,
            outerColor: Colors.orange,
            sliderButtonIcon: Icon(Icons.work_outline_outlined,color: Colors.black,),
            text: 'Slide to Punch-In',
            textStyle: TextStyle(fontSize: 18,color: Colors.white),
            onSubmit: (){
              setState(() async{
                // Position position = await _determinePosition();
                // // print(position.latitude);
                // location = "Lat : ${position.latitude} , Long : ${position.longitude}";
                // GetAddressFromLatLong(position);
                setState(() {
                  // print(Address);
                  inTime = true;

                });
                print('hi');
                Get.showSnackbar(Ui.SuccessSnackBar(message: "Check In-time marked Successfully".tr));

              });
            },
          ):Container(color: Colors.black,height: 00,width: 00,),
        ),
        if(inTime && !outTime)
          Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child:
          SlideAction(
            borderRadius: 8,
            elevation: 0,
            outerColor: Colors.orange,
            sliderButtonIcon: Icon(Icons.work_outline_outlined,color: Colors.black,),
            text: 'Slide to Punch-Out',
            textStyle: TextStyle(fontSize: 18,color: Colors.white),
            onSubmit: (){
              setState(() async{
                // Position position = await _determinePosition();
                // // print(position.latitude);
                // location = "Lat : ${position.latitude} , Long : ${position.longitude}";
                // GetAddressFromLatLong(position);
                setState(() {
                  // print(Address);
                  outTime = true;

                });
                print('hi');
                Get.showSnackbar(Ui.SuccessSnackBar(message: "Check In-time marked Successfully".tr));

              });
            },
          ),
        ),

      ],
    );
  }
}

