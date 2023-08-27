/*
 * Copyright (c) 2020 .
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:service/Admin/new_modified_files/company_module/new_company_view.dart';
import 'package:service/features/common/ui.dart';
import 'package:service/styles/styles.dart';

import '../../../features/bookings/widgets/otp_text_field_widget.dart';
import '../../../features/common/block_button_widget.dart';
import '../../../features/profile/controllers/profile_controller.dart';
import '../../../routes/app_routes.dart';

class PhoneVerificationBottomSheetWidget extends StatefulWidget {
  String? fullName;
  String? companyName;
  String? emailAddress;
  String? passwordValue;
  int? otpValue;
  PhoneVerificationBottomSheetWidget(
      {Key? key,
      this.fullName,
      this.companyName,
      this.emailAddress,
      this.passwordValue,
      this.otpValue})
      : super(key: key);

  @override
  State<PhoneVerificationBottomSheetWidget> createState() =>
      _PhoneVerificationBottomSheetWidgetState();
}

class _PhoneVerificationBottomSheetWidgetState
    extends State<PhoneVerificationBottomSheetWidget> {
  int start = 60;
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO add loading while verification
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Get.theme.focusColor.withOpacity(0.4),
              blurRadius: 30,
              offset: Offset(0, -30)),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: 13, horizontal: (Get.width / 2) - 30),
              decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Get.theme.focusColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
                //child: SizedBox(height: 1,),
              ),
            ),
            Text(
              "We sent the OTP code to your Email-Id, please enter below to verify your Email"
                  .tr,
              style: Get.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ).paddingSymmetric(horizontal: 20, vertical: 10),
            // TextFieldWidget(
            //   labelText: "OTP Code".tr,
            //   hintText: "----  ----  ----  ----  ----  ----".tr,
            //   style: Get.textTheme.headline4!.merge(TextStyle(letterSpacing: 6)),
            //   textAlign: TextAlign.center,
            //   controller: otpController,
            //   keyboardType: TextInputType.number,
            //  // onChanged: (input) => controller.smsSent.value = input,
            // ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              margin:
                  const EdgeInsets.only(top: 0, left: 20, right: 10, bottom: 0),
              decoration: BoxDecoration(
                  color: page,
                  // borderRadius: const BorderRadius.vertical(
                  //     top: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Get.theme.focusColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5)),
                  ],
                  border: Border.all(
                      color: Get.theme.focusColor.withOpacity(0.05))),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OTP Code" ?? "",
                      style: Get.textTheme.bodyText1!
                          .merge(const TextStyle(letterSpacing: 2)),
                      textAlign: TextAlign.start,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: otpController,
                      style: Get.textTheme.headline4!
                          .merge(TextStyle(letterSpacing: 6)),
                      obscureText: false,
                      maxLength: 6,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.orange,
                      decoration: Ui.getInputDecoration(
                        hintText: "----  ----  ----  ----  ----  ----" ?? '',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Coundown(),
            StartT(),

            BlockButtonWidget(
              onPressed: () async {
                // await controller.verifyPhone();

                // // _navigateToAnotherScreen();
                // Navigator.pop(context);
                // // Get.offAndToNamed(Routes.COMPANY);
                if (otpController.text == widget.otpValue.toString()) {
                  showToast("");
                  Get.to(CompanyView(
                      fullName: widget.fullName,
                      companyName: widget.companyName,
                      emailAddress: widget.emailAddress,
                      passwordValue: widget.passwordValue));
                } else {
                  showToast("Otp Is Incorrect");
                }

                print("fromOnTap ${otpController.text}");
                // Navigator.pop(context);

                // Get.back();
                // Get.back();
              },
              color: Colors.orange,
              text: Text(
                "Verify".tr,
                style: Get.textTheme.headline6!
                    .merge(TextStyle(color: Colors.white)),
              ),
            ).paddingSymmetric(vertical: 30, horizontal: 20),
          ],
        ),
      ),
    );
  }

  void _navigateToAnotherScreen() {
    Get.back();
    // Get.to(AnotherScreen());
    Get.offAndToNamed(Routes.COMPANY);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }
}

class StartT extends StatefulWidget {
  const StartT({Key? key}) : super(key: key);

  @override
  State<StartT> createState() => _StartTState();
}

class _StartTState extends State<StartT> {
  bool wait = false;
  Timer? timer;
  int _remainingTime = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_remainingTime == 0) {
          timer.cancel();
          // wait = false;
          // TODO: Handle OTP timeout.
        } else {
          setState(() {
            _remainingTime--;
          });
        }
      },
    );
  }

  void resetTimer() {
    setState(() {
      _remainingTime = 60;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: _remainingTime != 0
              ? Text(
                  'Re-send Otp in $_remainingTime seconds',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.subtitle1!.merge(TextStyle(
                      letterSpacing: 2,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500)),
                ).paddingSymmetric(horizontal: 10, vertical: 10.0)
              : GestureDetector(
                  onTap: () {
                    resetTimer(); // wait = true;
                    print("hi");
                  },
                  child: Text(
                    'Re-send Otp',
                    textAlign: TextAlign.center,
                    style: Get.textTheme.subtitle1!.merge(TextStyle(
                        letterSpacing: 2,
                        color: Colors.orange,
                        fontWeight: FontWeight.w500)),
                  ).paddingSymmetric(horizontal: 10, vertical: 10.0),
                ),
        ),
        // _remainingTime==0 ?
        //   Text('Re-send Otp',textAlign: TextAlign.center,style: Get.textTheme.subtitle1!.merge(TextStyle(letterSpacing: 2,color: Colors.orange,fontWeight: FontWeight.w500)),
        //   ).paddingSymmetric(horizontal: 10,vertical: 10.0):Container(color: Colors.black,
        // width: 20,
        // height: 20,),
      ],
    );
  }
}

// class Coundown extends StatefulWidget {
//
//
//   const Coundown({Key? key}) : super(key: key);
//
//   @override
//   State<Coundown> createState() => _CoundownState();
// }
//
// class _CoundownState extends State<Coundown> {
//
//    int _Counter = 60;
//    late Timer _timer;
//    int startt = 30 ;
//
//
//
//   void startTimer(){
//     _Counter = 60;
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if(_Counter>0){
//         setState(() {
//           _Counter--;
//         });
//       }else{
//         _timer.cancel();
//       }
//     });
//   }
//
//    void start(){
//    const onsec = Duration(seconds: 1);
//    Timer timer = Timer.periodic(onsec, (timer) {
//    if(startt == 0){
//     setState(() {
//       timer.cancel();
//     });
//    }else{
//      setState(() {
//        startt--;
//      });
//    }
//    });
//
//
//    }
//
//
//   // @override
//   // void setState(VoidCallback fn) {
//   //   // TODO: implement setState
//   //   super.setState(fn);
//   //   startTimer();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//             children: [
//               if(_Counter!=0)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Re-send Otp in 00:',textAlign: TextAlign.center,style: Get.textTheme.subtitle1!.merge(TextStyle(letterSpacing: 2,color: Colors.grey.shade700,fontWeight: FontWeight.w500))),
//                   Text('$startt',textAlign: TextAlign.center,style: Get.textTheme.subtitle1!.merge(TextStyle(letterSpacing: 2,color: Colors.grey.shade700,fontWeight: FontWeight.w500))),
//                 ],
//               ),
//               if(_Counter==0)
//                 GestureDetector(
//                 onTap: (){
//                   startTimer();
//                 },
//                 child: Text('Re-send Otp',textAlign: TextAlign.center,style: Get.textTheme.subtitle1!.merge(TextStyle(letterSpacing: 2,color: Colors.orange,fontWeight: FontWeight.w500)),
//                 ).paddingSymmetric(horizontal: 10,vertical: 10.0),
//               ),
//               // ElevatedButton(onPressed: (){ startTimer(); },
//               // child:Text('Start Timer') ),
//
//             ],
//
//     );
//   }
//   @override
//   void onResumed() {
//     startTimer();
//
//   }
// }
