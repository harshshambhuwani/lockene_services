import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../controller/allline_controller.dart';


class AllLineView extends StatefulWidget {
  const AllLineView({Key? key}) : super(key: key);

  @override
  State<AllLineView> createState() => _AllLineViewState();
}

class _AllLineViewState extends State<AllLineView> {
  final arg = Get.arguments;

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Line Item".tr,
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
                    Get.toNamed(Routes.NEW_LINE,arguments: "add1");
                  },
                  child: Text('Create Line Item',
                      style:
                      TextStyle(color: Colors.orange, fontSize: 16))))
              .paddingOnly(right: 20.0, left: 20.0, bottom: 10.0),

          Text('My Line Items are ...'.tr,
            style: Get.textTheme.subtitle2!,).marginSymmetric(horizontal: 20.0),
          // SearchServicesListWidget(/*services: controller.eServices*/),
          // GestureDetector(
          //   onTap: (){
          //     if(arg=="quoteview"){
          //        Get.back();
          //     }else if(arg=="jobadd"){
          //       Get.offAndToNamed(Routes.ADD_JOB,arguments: "back2");
          //     }else{
          //       Get.offAndToNamed(Routes.ADD_QUOTE,arguments: "back1");
          //     }
          //     // Get.back();
          //   },
          //   child: Container(
          //     height: 100,
          //     decoration: Ui.getBoxDecoration(),
          //     child: Row(
          //       children: [
          //         Expanded(
          //             flex: 1,
          //             child: Icon(Icons.business_center_outlined,color: Colors.orange,size: 30,)),
          //         Expanded(
          //             flex: 6,
          //             child: Container(
          //               alignment: Alignment.topLeft,
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                 Text('Web Developer',style:Get.textTheme.subtitle2!,),
          //                 Text('Test\n ',maxLines: 1,softWrap: true,overflow: TextOverflow.ellipsis,style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.grey.shade600)),),
          //
          //               ],
          //               ),
          //             )),
          //         Expanded(
          //             flex: 2,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //
          //               children: [
          //                 Text('₹',style: TextStyle(
          //                   color: Colors.green,
          //                 ),),
          //                 Text('10,000',style: TextStyle(
          //                   color: Colors.green,
          //                 ),).marginOnly(left: 2.0),
          //               ],
          //             )),
          //       ],
          //     ),
          //   ).marginOnly(left: 20.0,right: 20.0,top: 10),
          // ),


          // isLoading
          //     ? const Center(child: CircularProgressIndicator())
          //     : SizedBox(
          //   height: 600,
          //   child: SingleChildScrollView(
          //     physics: const AlwaysScrollableScrollPhysics(),
          //     child: ListView.builder(
          //         itemCount: data?.length,
          //         scrollDirection: Axis.vertical,
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemBuilder: (BuildContext context, int index) {
          //           return SingleChildScrollView(
          //             child: GestureDetector(
          //               onTap: () {
          //                 // Get.to(AddQuoteView(
          //                 //     clientName: data?[index].tcCustName,
          //                 //     clientPhone: data?[index].tcPhoneNumber,
          //                 //     clientCity: data?[index].cityName,
          //                 //     clientEmail : data?[index].tcCustEmail));
          //               },
          //               child: Container(
          //                 height: 80,
          //                 decoration: Ui.getBoxDecoration(),
          //                 child: Row(
          //                   children: [
          //                     const Expanded(
          //                         flex: 2,
          //                         child: Icon(
          //                           Icons.person,
          //                           color: Colors.orange,
          //                           size: 30,
          //                         )),
          //                     Expanded(
          //                         flex: 6,
          //                         child: Container(
          //                           alignment: Alignment.topLeft,
          //                           child: Column(
          //                             mainAxisAlignment:
          //                             MainAxisAlignment.center,
          //                             crossAxisAlignment:
          //                             CrossAxisAlignment.start,
          //                             children: [
          //                               Text(
          //                                 data?[index].tcCustName ?? "",
          //                                 style: Get.textTheme.subtitle2!,
          //                               ),
          //                               Text(
          //                                 data?[index].tcPhoneNumber ??
          //                                     "",
          //                                 style: TextStyle(
          //                                     color:
          //                                     Colors.grey.shade600),
          //                               ),
          //                             ],
          //                           ),
          //                         )),
          //                   ],
          //                 ),
          //               ).marginOnly(left: 20.0, right: 20.0, top: 5),
          //             ),
          //           );
          //         }),
          //   ),
          // ),

          Container(
            height: 100,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Icon(Icons.business_center_outlined,color: Colors.orange,size: 30,)),
                Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Php Developer',style:Get.textTheme.subtitle2!,),
                          Text('Test\n ',maxLines: 1,softWrap: true,overflow: TextOverflow.ellipsis,style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.grey.shade600)),),

                        ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text('₹',style: TextStyle(
                          color: Colors.green,
                        ),),
                        Text('20,000',style: TextStyle(
                          color: Colors.green,
                        ),).marginOnly(left: 2.0),
                      ],
                    )),
              ],
            ),
          ).marginOnly(left: 20.0,right: 20.0,top: 5),
          Container(
            height: 100,
            decoration: Ui.getBoxDecoration(),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Icon(Icons.business_center_outlined,color: Colors.orange,size: 30,)),
                Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Carpenter',style:Get.textTheme.subtitle2!,),
                          Text('Test\n ',maxLines: 1,softWrap: true,overflow: TextOverflow.ellipsis,style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.grey.shade600)),),

                        ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text('₹',style: TextStyle(
                          color: Colors.green,
                        ),),
                        Text('5,000',style: TextStyle(
                          color: Colors.green,
                        ),).marginOnly(left: 2.0),
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
                    //controller.searchEServices(keywords: value);
                  },
                  autofocus: true,
                  cursorColor: Get.theme.focusColor,
                  decoration: Ui.getInputDecoration(hintText: "Search for line items...".tr),
                ),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

