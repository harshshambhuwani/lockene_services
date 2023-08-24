import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles/styles.dart';
import '../../common/ui.dart';



class StatisticCarouselItemWidget extends StatelessWidget {
  final double? marginLeft;
   var list;

  StatisticCarouselItemWidget({Key? key, this.marginLeft, this.list}) : super(key: key);

  // List<String> list = [
  //   'Total Work',
  //   'Today\'s Work',
  //   'Upcomming Work',
  //   'Canceled Work',
  //   'Total Earning',
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: this.marginLeft!, end: 20, top: 25, bottom: 25),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      decoration: Ui.getBoxDecoration(color: page),
      width: 110,
      child: Column(
        children: [
          // if (statistic!.description == "total_earning")
          Text("60",
              style: Get.textTheme.headline4!.merge(
                TextStyle(height: 1, color: Colors.orange),
              )),
          // else
          //   Text(
          //     statistic!.value!,
          //     textAlign: TextAlign.center,
          //     style: Get.textTheme.headline2!.merge(TextStyle(height: 1)),
          //   ),
          SizedBox(height: 8),
          Text(
            list,
            textAlign:TextAlign.center,
            maxLines: 3,
            // style: Get.textTheme.caption,
            style: Get.textTheme.subtitle2!
                .merge(TextStyle(fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }
}
