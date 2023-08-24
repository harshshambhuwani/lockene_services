import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../controller/search_controller.dart';


class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Team Members".tr,
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

          Container(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Background color
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.ADD_MEMBER,arguments: "add");
                      },
                      child: Text('Create New Member',
                          style:
                              TextStyle(color: Colors.orange, fontSize: 16))))
              .paddingOnly(right: 20.0, left: 20.0, bottom: 10.0),

          Text('My Members are ...'.tr,
            style: Get.textTheme.subtitle2!,).marginSymmetric(horizontal: 20.0),
          // SearchServicesListWidget(/*services: controller.eServices*/),
          GestureDetector(
            onTap: (){
              Get.offAndToNamed(Routes.ADD_QUOTE,arguments: "back");
              // Get.back();

            },
            child: Container(
              height: 80,
              decoration: Ui.getBoxDecoration(),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(Icons.person,color: Colors.orange,size: 30,)),
                  Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text('Ankush Thengne',style:Get.textTheme.subtitle2!,),
                          Text('Web Developer',style: TextStyle(color: Colors.grey.shade600),),

                        ],
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text('Active'),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                          ).marginOnly(left: 5.0),
                        ],
                      )),
                ],
              ),
            ).marginOnly(left: 20.0,right: 20.0,top: 10),
          ),
          Container(
            height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Icon(Icons.person,color: Colors.orange,size: 30,)),
                Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Santosh Thengne',style:Get.textTheme.subtitle2!,),
                        Text('Carpenter',style: TextStyle(color: Colors.grey.shade600),),

                      ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Text('Active'),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                        ).marginOnly(left: 5.0),
                      ],
                    )),
              ],
            ),
          ).marginOnly(left: 20.0,right: 20.0,top: 5),
          Container(
            height: 80,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Icon(Icons.person,color: Colors.orange,size: 30,)),
                Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Sanket Fulzele',style:Get.textTheme.subtitle2!,),
                        Text('Front-End Developer',style: TextStyle(color: Colors.grey.shade600),),

                      ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('In-active'),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                        ).marginOnly(left: 5.0),
                      ],
                    )),
              ],
            ),
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
