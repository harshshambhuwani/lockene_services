/*
 * Copyright (c) 2020 .
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bookings/widgets/otp_text_field_widget.dart';
import '../../common/block_button_widget.dart';
import '../controllers/profile_controller.dart';



class PhoneVerificationBottomSheetWidget extends GetView<ProfileController> {
  // int _Counter = 60;
  // late Timer _timer;

  @override
  Widget build(BuildContext context) {
    // TODO add loading while verification
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Get.theme.focusColor.withOpacity(0.4), blurRadius: 30, offset: Offset(0, -30)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 30,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: (Get.width / 2) - 30),
            decoration: BoxDecoration(
              color: Get.theme.focusColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
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
            "We sent the OTP code to customers Email-Id, please ask them and enter below".tr,
            style: Get.textTheme.bodyText1,
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: 20, vertical: 10),
          TextFieldWidget(
            labelText: "OTP Code".tr,
            hintText: "----  ----  ----  ----  ----  ----".tr,
            style: Get.textTheme.headline4!.merge(TextStyle(letterSpacing: 6)),
            textAlign: TextAlign.center,     
            keyboardType: TextInputType.number,
            onChanged: (input) => controller.smsSent.value = input,
          ),

          StartT(),



          BlockButtonWidget(
            onPressed: () async {
              // await controller.verifyPhone();
              Navigator.pop(context);
            },
            color: Colors.orange,
            text: Text(
              "Verify".tr,
              style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
            ),
          ).paddingSymmetric(vertical: 30, horizontal: 20),
        ],
      ),
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
      _remainingTime = 30;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child:
          _remainingTime !=0 ?
          Text('Re-send Otp in $_remainingTime seconds',textAlign: TextAlign.center,style: Get.textTheme.subtitle1!.merge(TextStyle(letterSpacing: 2,color: Colors.orange,fontWeight: FontWeight.w500)),
          ).paddingSymmetric(horizontal: 10,vertical: 10.0):GestureDetector(
            onTap: (){
              resetTimer();              // wait = true;
              print("hi");

            },
            child: Text('Re-send Otp',textAlign: TextAlign.center,style: Get.textTheme.subtitle1!.merge(TextStyle(letterSpacing: 2,color: Colors.orange,fontWeight: FontWeight.w500)),
            ).paddingSymmetric(horizontal: 10,vertical: 10.0),
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
