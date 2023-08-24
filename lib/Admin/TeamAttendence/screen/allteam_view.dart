import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controllers/allteam_controller.dart';


class AllTeamMembView extends GetView<AllTeamMembController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Team".tr,
          style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
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
        children: [
          buildSearchBar(),

          Text('My Members are ...'.tr,
            style: Get.textTheme.subtitle2!,).marginSymmetric(horizontal: 20.0),
          // SearchServicesListWidget(/*services: controller.eServices*/),
          GestureDetector(
            onTap: (){
              // Get.offAndToNamed(Routes.ADD_QUOTE,arguments: "back");
              // Get.back();

            },
            child:
            Container(
              // height: 80,
              decoration: Ui.getBoxDecoration(),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(Icons.person,color: Colors.orange,size: 30,)),
                  Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text('Ankush Thengne',style:Get.textTheme.subtitle2!,),


                        ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red.shade200,
                            // border: Border.symmetric()
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text('Not Punched',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: Get.width*ten),).paddingSymmetric(horizontal: 15,vertical: 10.0)).marginOnly(top: 5.0).paddingSymmetric(vertical: Get.width * 0.010,horizontal:  Get.width * 0.02),),
                ],
              ).paddingSymmetric(vertical: 15.0,horizontal: 10),
            ).marginOnly(left: 20.0,right: 20.0,top: 10),
          ),
          InkWell(
            onTap: (){
              Get.toNamed(Routes.SPECIFICMEMB);
            },
            child: Container(
              // height: 80,
              decoration: Ui.getBoxDecoration(),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(Icons.person,color: Colors.orange,size: 30,)),
                  Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Vinod Thakur',style:Get.textTheme.subtitle2!,),

                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child:Container(
                          // width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            // color: Colors.red.shade200,
                            // border: Border.symmetric()
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: Colors.grey,width: 1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text('Punched In',style: TextStyle(color: Colors.black,fontSize: Get.width*ten),),
                                  Text('10:36 AM',style: TextStyle(color: Colors.black,fontSize: Get.width*nine),),
                                ],
                              ),
                              Icon(Icons.location_on,size: 26,color: Colors.green,)
                            ],
                          ).paddingSymmetric(vertical: Get.width * 0.01)).marginOnly(top: 5.0).paddingSymmetric(horizontal:Get.width*0.02),
                  ),
                ],
              ).paddingSymmetric(vertical: 15.0,horizontal: 10),
            ).marginOnly(left: 20.0,right: 20.0,top: 5),
          ),
          Container(
            // height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Icon(Icons.person,color: Colors.orange,size: 30,)),
                Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rakesh Kumar',style:Get.textTheme.subtitle2!,),

                        ],
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child:Container(
                        // width: Get.width * 0.3,
                        decoration: BoxDecoration(
                          // color: Colors.red.shade200,
                          // border: Border.symmetric()
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('Punched Out',style: TextStyle(color: Colors.black,fontSize: Get.width*ten),),
                                Text('7:36 AM',style: TextStyle(color: Colors.black,fontSize: Get.width*nine),),
                              ],
                            ),
                            Icon(Icons.location_on,size: 26,color: Colors.red,)
                          ],
                        ).paddingSymmetric(vertical: Get.width * 0.01)).marginOnly(top: 5.0).paddingSymmetric(horizontal:Get.width*0.02),
                ),
              ],
            ).paddingSymmetric(vertical: 15.0,horizontal: 10),
          ).marginOnly(left: 20.0,right: 20.0,top: 5),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Hero(
      tag: Get.arguments ?? '',
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(
              color: Get.theme.focusColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 0),
              child: Icon(Icons.search, color: Colors.black),
            ),
            Expanded(
              child: Material(
                color: Colors.grey.shade100,
                child: TextField(
                  // controller: controller.textEditingController,
                  style: Get.textTheme.bodyText2,
                  onSubmitted: (value) {
                    controller.searchEServices(keywords: value);
                  },
                  autofocus: true,
                  cursorColor: Get.theme.focusColor,
                  decoration: Ui.getInputDecoration(hintText: "Search for member...".tr),
                ),
              ),
            ),
            SizedBox(width: 8),
            // GestureDetector(
            //   onTap: () {
            //     Get.bottomSheet(
            //       FilterBottomSheetWidget(),
            //       isScrollControlled: true,
            //     );
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(8)),
            //       color: Get.theme.focusColor.withOpacity(0.1),
            //     ),
            //     child: Wrap(
            //       crossAxisAlignment: WrapCrossAlignment.center,
            //       spacing: 4,
            //       children: [
            //         Text(
            //           "Filter".tr,
            //           style: Get.textTheme.bodyText2, //TextStyle(color: Get.theme.hintColor),
            //         ),
            //         Icon(
            //           Icons.filter_list,
            //           color: Get.theme.hintColor,
            //           size: 21,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
