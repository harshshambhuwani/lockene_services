import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
// import 'package:vertical_stepper/vertical_stepper.dart' as step;
// import 'package:vertical_stepper/vertical_stepper.dart';

import '../controllers/track_controller.dart';
import 'constant.dart';

class TrackStatusView extends GetView<TrackController> {

  // List<step.Step> steps = [
  //   step.Step(
  //     shimmer: false,
  //     title: "Service Booking",
  //     iconStyle: Colors.green,
  //     content: Align(
  //       alignment: Alignment.topLeft,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "23/05/23 11:30 PM",
  //             style:
  //                 TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
  //           ).marginOnly(bottom: 5.0),
  //           Text(
  //             "Service booked Successfully",
  //             style:
  //                 TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  //           ),
  //         ],
  //       ),
  //     ), // Align
  //   ), // step. Step
  //   step.Step(
  //     shimmer: false,
  //     title: "Technician Assigned",
  //     iconStyle: Colors.green,
  //     content: Align(
  //       alignment: Alignment.topLeft,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "23/05/23 12:30 PM",
  //             style:
  //                 TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
  //           ).marginOnly(bottom: 5.0),
  //           Text(
  //             "Rahul Sharma",
  //             style: TextStyle(color: Colors.black),
  //           ),
  //           Text(
  //             "Contact No: 9689455261",
  //             style:
  //                 TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  //           ),
  //           Text(
  //             "Technician Assigned Successfully",
  //             style:
  //                 TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  //           ),
  //         ],
  //       ),
  //     ), // Align
  //   ),
  //   step.Step(
  //     shimmer: false,
  //     title: "Technician is on the way",
  //     iconStyle: Colors.green,
  //     content: Align(
  //       alignment: Alignment.topLeft,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "23/05/23 1:30 PM",
  //             style:
  //                 TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
  //           ).marginOnly(bottom: 5.0),
  //           Text(
  //             "Technician is on the way",
  //             style:
  //                 TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  //           ),
  //         ],
  //       ),
  //     ), // Align
  //   ), // step.Step
  //   step.Step(
  //     shimmer: false,
  //     title: "Work Completed",
  //     iconStyle: Colors.red,
  //     content: Align(
  //       alignment: Alignment.topLeft,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "23/05/23 5:30 PM",
  //             style:
  //                 TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
  //           ).marginOnly(bottom: 5.0),
  //           Text(
  //             "Work Completed Successfully",
  //             style:
  //                 TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  //           ),
  //         ],
  //       ).marginOnly(bottom: 20.0),
  //     ), // Align
  //   ), // step.Step
  // ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Track Status".tr,
            style: context.textTheme.subtitle1,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
            onPressed: () => Get.back(),
          ),
          // actions: [
          //    GestureDetector(
          //        onTap: (){
          //          Get.back();
          //        },
          //        child: Text('Skip',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,),textAlign: TextAlign.justify,).marginSymmetric(horizontal: 20.0,vertical: 18.0))
          // ],
          elevation: 0,
        ),
        body: ListView(
          primary: true,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Container(
            //     child: Padding(
            //       padding:  EdgeInsets.symmetric(horizontal: size.width * 0.05),
            //       child: Image(image: AssetImage("assets/images/logo_img.png"),
            //         width: size.width * 0.30,height: size.width * 0.30,fit: BoxFit.contain,),
            //     ),
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(20.0),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.grey.withOpacity(0.5),
            //             spreadRadius: 2,
            //             blurRadius: 2,
            //             offset: Offset(0, 3), // changes position of shadow
            //           ),
            //         ]
            //     ),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.width * 0.3,
                  width: size.width * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image(
                      image: AssetImage("assets/images/logo_img.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(20.0),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.5),
                  //         spreadRadius: 2,
                  //         blurRadius: 2,
                  //         offset: Offset(0, 3), // changes position of shadow
                  //       ),
                  //     ]),
                ),
              ],
            ),
            Text(
              'Track Service Status',
              style: Get.textTheme.headline6!
                  .merge(TextStyle(color: Colors.black)),
              textAlign: TextAlign.center,
            ),

            // Container(
            //   height: 600,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20.0),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.5),
            //           spreadRadius: 2,
            //           blurRadius: 2,
            //           offset: Offset(0, 3), // changes position of shadow
            //         ),
            //       ]),
            // ).paddingSymmetric(horizontal: 20,vertical: 20),

          Row(
            children: [
              Container(
                // color: Colors.yellow,
                height: size.height/1.5,
                width: size.width/6,
                child: IconStepper(
                  direction: Axis.vertical,
                  enableNextPreviousButtons: false,
                  enableStepTapping: false,
                  stepColor: Colors.green,
                  activeStepBorderColor: Colors.white,
                  activeStepBorderPadding: 0.0,
                  activeStepBorderWidth: 0.0,
                  lineColor: Colors.green,
                  lineLength: 70,
                  lineDotRadius: 2.0,
                  stepRadius: 16.0,
                  icons: [
                    Icon(Icons.check,color: Colors.white,),
                    Icon(Icons.check,color: Colors.white,),
                    Icon(Icons.check,color: Colors.white,),
                    Icon(Icons.check,color: Colors.white,),
                    Icon(Icons.radio_button_checked,color: Colors.white,),
                    // Icon(Icons.radio_button_checked,color: Colors.white,),
                  ],
                ),
              ),
              Expanded(

                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: trackOrderList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.6,
                          child: ListTile(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 16.0),
                            // leading: Icon(
                            //   trackOrderList[index].icon,
                            //   size: 38.0,
                            //   color: Colors.orange,
                            // ),
                            title: Text(
                              trackOrderList[index].title!.tr/*"SubTitle"*/,
                              style: TextStyle(fontSize: 18.0),
                            ),
                            subtitle: Text(
                              trackOrderList[index].subtitle!,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        Text(
                          trackOrderList[index].time!,
                          style: TextStyle(fontSize: 14.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
          ],
          ));




        //   ],
        // ));
  }
}

class AttendenceDetails extends StatefulWidget {
  const AttendenceDetails({Key? key}) : super(key: key);

  @override
  State<AttendenceDetails> createState() => _AttendenceDetailsState();
}

class _AttendenceDetailsState extends State<AttendenceDetails> {
  bool inTime = false;
  bool outTime = false;

  // List<step.Step> steps = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image(
                image: AssetImage("assets/images/logo_img.png"),
                width: size.width * 0.30,
                height: size.width * 0.30,
                fit: BoxFit.contain,
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
          ),
        ),
        Text(
          'Track Service Status',
          style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.black)),
          textAlign: TextAlign.center,
        ).marginOnly(top: 5.0),
        Container(
          child: Column(
            // children: [VerticalStepper(steps: steps, dashLength: 2)],
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
        ).marginSymmetric(),
      ],
    );
  }
}
