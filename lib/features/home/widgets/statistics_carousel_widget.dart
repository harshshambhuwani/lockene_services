import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../styles/styles.dart';
import '../../common/ui.dart';
import '../../../routes/app_routes.dart';
import 'statistic_carousel_item_widget.dart';
import 'statistics_carousel_loader_widget.dart';

class StatisticsCarouselWidget extends StatelessWidget {
  // final List<Statistic>? statisticsList;
  List<String?> count = [
    '60',
    '15',
    '35',
    '10',
    '5K',
  ];
  List<String?> list = [
    'Total Booking',
    'Today\'s Booking',
    'Upcoming Booking',
    'Canceled Booking',
    'Total Earning',
  ];
  StatisticsCarouselWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {


        return
        Container(
            child: ListView.builder(
          itemCount:list.length,
          itemBuilder: (context, index) {
            double _marginLeft = 0;
            (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
            return
              GestureDetector(
              onTap: (){
                Get.toNamed(Routes.SLIDE_DETAILS,arguments: list[index] );
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(start:15, end: 15, top: 30, bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                decoration: Ui.getBoxDecoration(color: page),
                width: 110,
                child: Column(
                  children: [
                    // if (statistic!.description == "total_earning")
                    Text(count[index]!.tr,
                        style: Get.textTheme.headline4!.merge(
                          TextStyle(height: 1, color: Colors.orange,fontWeight: FontWeight.w700),
                        )),

                    SizedBox(height: 15),
                    Text(
                      list[index]!.tr,
                      textAlign:TextAlign.center,
                      maxLines: 3,
                      // style: Get.textTheme.caption,
                      style: Get.textTheme.bodyText1!
                          .merge(TextStyle(fontWeight: FontWeight.w400)),
                    ).marginSymmetric(horizontal: 7.0)
                  ],
                ),
              ),
            );

            //   StatisticCarouselItemWidget(
            //   marginLeft: _marginLeft,
            //       list: list[index],
            //   // statistic: statisticsList!.elementAt(index),
            // );
          },
          scrollDirection: Axis.horizontal,
        )).marginSymmetric(horizontal: 7.0);
      // });
  }
}
