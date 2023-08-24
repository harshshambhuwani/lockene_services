import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/ui.dart';
import 'attendence_widget.dart';

class Attendencelist_item extends StatefulWidget {
  const Attendencelist_item({Key? key}) : super(key: key);

  @override
  State<Attendencelist_item> createState() => _Attendencelist_itemState();
}

class _Attendencelist_itemState extends State<Attendencelist_item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric( vertical: 10),
      decoration: Ui.getBoxDecoration(),
      child: Column(
        children: [
          AccountLinkWidget(
            icon: Icon(Icons.calendar_today_sharp, color: Colors.orange,size: 18,),
            text: Row(
              children: [
                Text("Date :".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500),),
                SizedBox(width: 5.0,),
                Text("13/02/23".tr,style: TextStyle( color: Colors.black),),
              ],
            ),
            onTap: (e) {
              // Get.toNamed(Routes.PROFILE);
            },
          ),
          AccountLinkWidget(
            icon: Icon(Icons.today, color: Colors.orange,size: 18,),
            text: Row(
              children: [
                Text("Day :".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),
                SizedBox(width: 5.0,),
                Text("Thursday".tr,style: TextStyle( color: Colors.black),),
              ],
            ),
            onTap: (e) {
              // Get.find<RootController>().changePage(0);
            },
          ),
          AccountLinkWidget(
            icon: Icon(Icons.arrow_downward, color: Colors.orange,size: 18,),
            text: Row(
              children: [
                Text("In-Time :".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),
                SizedBox(width: 5.0,),
                Text("9:45 AM".tr,style: TextStyle( color: Colors.black)),

              ],
            ),
            onTap: (e) {
              // Get.toNamed(Routes.NOTIFICATIONS);
            },
          ),
          AccountLinkWidget(
            icon: Icon(Icons.arrow_upward, color: Colors.orange,size: 18,),
            // Icon(Icons.transit_enterexit, color: Colors.orange),
            text: Row(
              children: [
                Text("Out-Time :".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),
                SizedBox(width: 5.0,),
                Text("6:45 PM".tr,style: TextStyle( color: Colors.black)),

              ],
            ),
            onTap: (e) {
              // Get.find<RootController>().changePage(2);
            },
          ),
        ],
      ),
    );
  }
}
