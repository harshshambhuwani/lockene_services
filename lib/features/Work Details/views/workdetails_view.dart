import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/bookings_list_widget.dart';
import '../controllers/workdetail_controller.dart';
import '../widgets/getfilter.dart';


class WorkDetailsView extends GetView<WorkDetailController> {
  var list =  Get.arguments;
  int _value = 1;
  String? middle;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshDetails(showMessage: true);
        },
        child: CustomScrollView(
          primary: true,
          shrinkWrap: false,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Get.theme.scaffoldBackgroundColor,
              expandedHeight: 40,
              elevation: 0.5,
              primary: true,
              // pinned: true,
              floating: true,
              iconTheme: IconThemeData(color: Get.theme.hintColor),
              title: Text(
                // "Work Details".tr,
                list,
                style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
              ),
              centerTitle: true,
              automaticallyImplyLeading : false,
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => {Get.back()},
              ),
              actions: [
                if(list=="Total Earning")
                Row(
                  children: [
                    Icon(Icons.wallet, color: Get.theme.hintColor),
                    SizedBox(width: 10.0,),
                    Text(
                      "20K".tr,
                      style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
                    ),
                  ],
                ).marginOnly(right: 20.0),
                if(list!="Total Earning")
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                          // backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context){
                        return GetFilter(value: _value);
                          });
                      },
                    child: Row(
                    children: [
                      Icon(Icons.filter_alt_outlined, color: Get.theme.hintColor),
                      SizedBox(width: 10.0,),
                    ],
                ).marginOnly(right: 20.0),
                  )
              ],


              // flexibleSpace: FlexibleSpaceBar(
              //     collapseMode: CollapseMode.parallax,
              //     background: Container(
              //       width: double.infinity,
              //       padding: EdgeInsets.only(top: 75),
              //       decoration: new BoxDecoration(
              //         borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              //       ),
              //       child: Column(
              //         children: [
              //           Text("5",
              //               style: Get.textTheme.headline1!.merge(TextStyle(color: Get.theme.hintColor, fontSize: 36, fontWeight: FontWeight.w600))),
              //         ],
              //       ),
              //     )),
            ),
            SliverToBoxAdapter(
                child: Column(
                  children: [
                    if(list!="Total Earning")
                    Container(
                      height: 50,
                      width: double.infinity,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(20.0),
                      //   color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey.shade100,
                      //         // offset: const Offset(5.0, 5.0,),
                      //         blurRadius: 5.0,
                      //         spreadRadius: 5.0,
                      //       ),]
                      // ),
                      child: CupertinoSearchTextField(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                // offset: const Offset(5.0, 5.0,),
                                blurRadius: 5.0,
                                spreadRadius: 5.0,
                              ),]
                        ),
                        placeholder: "Search...",
                        suffixIcon: Icon(Icons.cancel),
                        padding:EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ).marginSymmetric(horizontal: 20.0,vertical: 5.0).paddingSymmetric(horizontal: 0.0),

                    BookingsListWidget(),
                  ],
                ),

              // }),
            ),
          ],
        ),
      ),
    );
  }

  // Container buildgetbottom(BuildContext context) {
  //  return Container(
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                     vertical: 20.0, horizontal: 20.0),
  //                 child: Row(
  //                   mainAxisAlignment:
  //                   MainAxisAlignment.start,
  //                   // crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text('Sort by :',
  //                         style: TextStyle(
  //                           fontSize: 16.0,
  //                           fontWeight: FontWeight.w500,
  //                           color: Colors.black,
  //                         )),
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 height: 1.0,
  //                 color: Colors.grey,
  //               ),
  //                     controller.RadioListTile()
  //             ],
  //           ),
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(30),
  //               topRight: Radius.circular(30),
  //             ),
  //           ),
  //         );
  //
  // }
}
