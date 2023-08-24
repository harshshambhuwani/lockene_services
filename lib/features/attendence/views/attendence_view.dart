import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:service/features/attendence/widgets/attendence_list_item.dart';

import '../../../routes/app_routes.dart';
import '../../common/ui.dart';
import '../controllers/attendence_controller.dart';


class AttendenceView extends GetView<AttendenceController> {
  // final bool hideAppBar;

  // AttendenceView({this.hideAppBar = false}) {
  //   // controller.profileForm = new GlobalKey<FormState>();
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
                title: Text(
                  "My Attendence".tr,
                  style: context.textTheme.subtitle1,
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                  onPressed: () => Get.back(),
                ),
                elevation: 0,
              ),
        body: ListView(
          primary: true,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(

                  label: Text('Mark Attendence'), // <-- Text
                  backgroundColor: Colors.orange,
                  icon: Icon( // <-- Icon
                    Icons.flag,
                    size: 24.0,
                  ),
                  onPressed: () {
                    Get.offAndToNamed(Routes.MARKATTENDENCE);
                  },
                ),
              ],
            ).marginOnly(left: 20.0,bottom: 10.0),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Text('Month',textAlign: TextAlign.center,).paddingSymmetric(horizontal: 20.0),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Text('Year',textAlign: TextAlign.center,).paddingSymmetric(horizontal: 20.0),
                ),
              ],
            ).marginSymmetric(horizontal: 20.0),
            Row(
              children: [
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.33,
                    decoration: Ui.getBoxDecoration(
                      radius: 14,
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.black,
                    ),
                    child: Text('January',textAlign: TextAlign.center,).paddingSymmetric(horizontal: 10.0),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.33,
                  decoration: Ui.getBoxDecoration(
                    radius: 14,
                    border: Border.all(width: 5, color: Colors.white),
                    color: Colors.black,
                  ),
                  child: Text('2023',textAlign: TextAlign.center,).paddingSymmetric(horizontal: 10.0),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                    ],
                    border: Border.all(width: 5, color: Colors.orange),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.orange,
                  ),
                  child: Text('Get',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),).paddingSymmetric(horizontal: 10.0),
                ),
              ],
            ).marginSymmetric(horizontal: 20.0),
            ListView.builder(
              padding: EdgeInsets.only(bottom: 10, top: 10),
              primary: false,
              shrinkWrap: true,
              itemCount: /*controller.bookings.length*/ 10 + 1,
              itemBuilder: ((_, index) {
                if (index == /*controller.bookings.length*/ 10) {
          return Obx(() {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Center(
                child: new Opacity(
                  opacity: controller.isLoading.value ? 1 : 0,
                  child: new CircularProgressIndicator(color: Colors.orange,),
                ),
              ),
            );
          });
        } else {
          return Attendencelist_item();
        }
      }),
    ).marginSymmetric(horizontal: 20.0),

            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //   decoration: Ui.getBoxDecoration(),
            //   child: Column(
            //     children: [
            //       AccountLinkWidget(
            //         icon: Icon(Icons.calendar_today_sharp, color: Colors.orange,size: 18,),
            //         text: Row(
            //           children: [
            //             Text("Date :".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500),),
            //             SizedBox(width: 5.0,),
            //             Text("13/02/23".tr,style: TextStyle( color: Colors.black),),
            //           ],
            //         ),
            //         onTap: (e) {
            //           // Get.toNamed(Routes.PROFILE);
            //         },
            //       ),
            //       AccountLinkWidget(
            //         icon: Icon(Icons.today, color: Colors.orange,size: 18,),
            //         text: Row(
            //           children: [
            //             Text("Day :".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),
            //             SizedBox(width: 5.0,),
            //             Text("Thursday".tr,style: TextStyle( color: Colors.black),),
            //           ],
            //         ),
            //         onTap: (e) {
            //           // Get.find<RootController>().changePage(0);
            //         },
            //       ),
            //       AccountLinkWidget(
            //         icon: Icon(Icons.arrow_downward, color: Colors.orange,size: 18,),
            //         text: Row(
            //           children: [
            //             Text("In-Time :".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),
            //             SizedBox(width: 5.0,),
            //             Text("9:45 AM".tr,style: TextStyle( color: Colors.black)),
            //
            //           ],
            //         ),
            //         onTap: (e) {
            //           // Get.toNamed(Routes.NOTIFICATIONS);
            //         },
            //       ),
            //       AccountLinkWidget(
            //         icon: Icon(Icons.arrow_upward, color: Colors.orange,size: 18,),
            //         // Icon(Icons.transit_enterexit, color: Colors.orange),
            //         text: Row(
            //           children: [
            //             Text("Out-Time :".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),
            //             SizedBox(width: 5.0,),
            //             Text("6:45 PM".tr,style: TextStyle( color: Colors.black)),
            //
            //           ],
            //         ),
            //         onTap: (e) {
            //           // Get.find<RootController>().changePage(2);
            //         },
            //       ),
            //     ],
            //   ),
            // ),


            // BlockButtonWidget(
            //     text: Stack(
            //       alignment: AlignmentDirectional.center,
            //       children: [
            //         SizedBox(
            //           width: double.infinity,
            //           child: Text(
            //             "Edit Profile".tr,
            //             textAlign: TextAlign.center,
            //             style: Get.textTheme.headline6!.merge(
            //               TextStyle(color: page),
            //             ),
            //           ),
            //         ),
            //         // Icon(Icons.check, color: page, size: 22)
            //       ],
            //     ),
            //     color: Colors.orange,
            //     onPressed: () {
            //     }).marginSymmetric(horizontal: 20.0),
          ],
        ));
  }
}
