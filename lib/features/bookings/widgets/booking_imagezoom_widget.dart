
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class BookingActionsWidget extends GetView<BookingController> {

  const BookingActionsWidget({
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

    ]),
    );
  }
}




