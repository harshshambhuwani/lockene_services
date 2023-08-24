import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../styles/styles.dart';
import '../../common/ui.dart';


class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {

    List<String> list = [
      'My Coins',
      'Mobiles',
      'Shoes',
      'Cloths',
      'Watches',
      'Beauty\nProducts',
      'My Coins',
      'Mobiles',
      'Shoes',
      'Cloths',
      'Watches',
      'Beauty\nProducts'
    ];

    return Scaffold(
      body: Container(
        margin: EdgeInsetsDirectional.only(start: 20, end: 20, top: 25, bottom: 25),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        decoration: Ui.getBoxDecoration(color: page),
        width: 110,
        child: Column(
          children: [Text("20",
                  style: Get.textTheme.headline4!.merge(
                    TextStyle(height: 1,color: Colors.orange),
                  )),
            SizedBox(height: 8),
            Text(
              "Today's Installation".tr,
              textAlign: TextAlign.center,
              maxLines: 3,
              // style: Get.textTheme.caption,
              style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w400)),
            )
          ],
        ),
      )
    );
  }
}
