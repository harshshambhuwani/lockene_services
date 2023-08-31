import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:service/Admin/TeamAttendence/widgets/filter_bottom_sheet_widget.dart';
import 'package:service/features/home/widgets/text.dart';


import '../../../styles/styles.dart';
import '../../common/filter_bottom_sheet_widget.dart';
import '../../common/helper.dart';
import '../../common/notifications_button_widget.dart';
import '../../common/tab_bar_widget.dart';
import '../../common/ui.dart';
import '../../reviews/widgets/review_item_widget.dart';
import '../../techniciandashboard/screen/techdashboard.dart';
import '../controllers/home_controller.dart';
import '../widgets/Categories.dart';
import '../widgets/add_popup.dart';
import '../widgets/attendence.dart';
import '../widgets/attendencenew.dart';
import '../widgets/bookings_list_widget.dart';
import '../widgets/statistics_carousel_widget.dart';
import '../widgets/stats.dart';

class HomeView extends GetView<HomeController> {

  List<String> list = [
    'Total Work',
    'Today\'s Work',
    'Upcomming Work',
    'Canceled Work',
    'Total Earning',
  ];

  List<String> logo = [
    'https://cdn-icons-png.flaticon.com/512/2460/2460475.png',
    'https://cdn-icons-png.flaticon.com/512/2920/2920369.png',
    'https://cdn-icons-png.flaticon.com/512/1785/1785340.png',
    'https://cdn-icons-png.flaticon.com/512/2331/2331716.png',
    'https://cdn-icons-png.flaticon.com/512/5012/5012988.png',
    'https://cdn-icons-png.flaticon.com/512/3163/3163195.png',
    'https://cdn-icons-png.flaticon.com/512/2460/2460475.png',
    'https://cdn-icons-png.flaticon.com/512/2920/2920369.png',
    'https://cdn-icons-png.flaticon.com/512/1785/1785340.png',
    'https://cdn-icons-png.flaticon.com/512/2331/2331716.png',
    'https://cdn-icons-png.flaticon.com/512/5012/5012988.png',
    'https://cdn-icons-png.flaticon.com/512/3163/3163195.png'
  ];

  // Get.put(MyController(arg));
  // Get.put(HomeController(HomeView(arg)));
  // HomeView(arg);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    controller.initScrollController();
    return WillPopScope(
      onWillPop: Helper().onWillPop,
      child: Scaffold(
        body: RefreshIndicator(
            onRefresh: () async {
              // Get.find<LaravelApiClient>().forceRefresh();
              // controller.refreshHome(showMessage: true);
              // Get.find<LaravelApiClient>().unForceRefresh();
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: controller.scrollController,
              shrinkWrap: false,
              slivers: <Widget>[
                    SliverAppBar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    expandedHeight: 250,
                    elevation: 0.5,
                    floating: false,
                    iconTheme: IconThemeData(color: Get.theme.primaryColor),

                      centerTitle: true,
                      title: Container(
                        width:media.width * 0.5 ,
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/transparent.png'),
                      ),
                    automaticallyImplyLeading: false,
                    leading: new IconButton(
                      icon: new Icon(Icons.sort, color: Colors.black87),
                      onPressed: () => {Scaffold.of(context).openDrawer()},
                    ),
                    actions: [NotificationsButtonWidget()],
                    flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background:StatisticsCarouselWidget().paddingOnly(top: 70)),
                  ),
                // }),
                SliverToBoxAdapter(
                  child: Wrap(
                    children: [
                      // GestureDetector(
                      //   onTap: (){
                      //     showDialog(
                      //         context: context,
                      //         builder: (_) {
                      //           return Add_Popup();
                      //         });
                      //   },
                      //   child: Container(
                      //       padding: EdgeInsets.all(20),
                      //       height: media.height * 0.2,
                      //       width: media.width * 1,
                      //       child: DottedBorder(
                      //         color: Colors.orange,
                      //         strokeWidth: 2,
                      //         dashPattern: [12,8],
                      //         // borderType: BorderType.RRect,
                      //         // radius: Radius.circular(15.0),
                      //         child: Container(  //inner container
                      //             height: media.height * 0.2,
                      //             width: double.infinity,
                      //             color:Colors.orange.shade50,
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //             Icon(Icons.add,size: 35,color: Colors.black,),
                      //             SizedBox(height:media.height * 0.02,),
                      //             Text('Add a quote/job/invoice',style: TextStyle(color: Colors.black,fontSize: media.width * fourteen),)
                      //           ],),
                      //
                      //         ),
                      //       )
                      //   ),
                      // ),


                      GestureDetector(
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (_) {
                                return Add_Popup();
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(  //inner container
                              height: media.height * 0.2,
                              width: double.infinity,
                              // color:Colors.orange.shade50,
                            decoration:BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                              ],
                              border:  Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Icon(Icons.add,size: 45,color: Colors.orange,),
                              SizedBox(height:media.height * 0.02,),
                              Text('Add Quote/Job/Invoice',
                                style: TextStyle(color: Colors.black,fontSize: media.width * sixteen),
                                // style: Get.textTheme.headline6!.merge(
                                //   TextStyle(height: 1, color: Colors.black,fontWeight: FontWeight.w500),),

                              )
                            ],),

                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Today\'s Details',
                              style: Get.textTheme.headline6!.merge(
                                TextStyle(height: 1, color: Colors.black),
                              ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  Get.bottomSheet(
                                    FilterBottomSheetWidget(),
                                    isScrollControlled: true,
                                  );
                                },
                                child: Icon(Icons.filter_alt_outlined, color: Get.theme.hintColor)),
                          ],
                        ),
                      ),
                      BookingsListWidget(),
                    ],
                  ),
                ),
              ],
            )),
      ),



      // child: Scaffold(
      //   appBar: AppBar(
      //           backgroundColor: page,
      //           elevation: 0.5,
      //           primary: true,
      //           iconTheme: IconThemeData(color: Colors.orange),
      //           title: Text(
      //             "Mistri Chacha Services".tr,
      //             style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.orange)),
      //           ),
      //           centerTitle: true,
      //           automaticallyImplyLeading: false,
      //           leading: new IconButton(
      //             icon: new Icon(Icons.sort, color: Get.theme.hintColor),
      //             onPressed: () => {Scaffold.of(context).openDrawer()},
      //           ),
      //           actions:[NotificationsButtonWidget()],
      //   ),
      //   body: RefreshIndicator(
      //     onRefresh: () async {
      //       // controller.refreshReviews(showMessage: true);
      //     },
      //     child: ListView(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(left: 20.0),
      //           child: SingleChildScrollView(
      //             scrollDirection: Axis.horizontal,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: <Widget>[
      //                 SizedBox(
      //                   height: 200,
      //                   child: ListView.builder(
      //                     physics: NeverScrollableScrollPhysics(),
      //                     shrinkWrap: true,
      //                     scrollDirection: Axis.horizontal,
      //                     itemCount: list.length,
      //                     itemBuilder: (context, index) {
      //                       return Container(
      //                         margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 25, bottom: 25),
      //                         padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
      //                         decoration: Ui.getBoxDecoration(color: page),
      //                         width: 110,
      //                         child: Column(
      //                           children: [Text("20",
      //                               style: Get.textTheme.headline4!.merge(
      //                                 TextStyle(height: 1,color: Colors.orange),
      //                               )),
      //                             SizedBox(height: 8),
      //                             Text(
      //                               "Today's Installation".tr,
      //                               textAlign: TextAlign.center,
      //                               maxLines: 3,
      //                               // style: Get.textTheme.caption,
      //                               style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w400)),
      //                             )
      //                           ],
      //                         ),
      //                       );
      //
      //                     },
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Container(
      //             height: 200,
      //             width: double.infinity,
      //             color: Colors.white,
      //             child:
      //           Stats(),
      //           ),
      //
      //       ],
      //     ),
      //
      //   ),
      // ),
    );
  }
}


// child: CustomScrollView(
//   primary: true,
//   shrinkWrap: false,
//   slivers: <Widget>[
//     SliverAppBar(
//       backgroundColor: page,
//       expandedHeight: 290,
//       elevation: 0.5,
//       primary: true,
//       // pinned: true,
//       floating: true,
//       iconTheme: IconThemeData(color: Colors.orange),
//       title: Text(
//         "Mistri Chacha Services".tr,
//         style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.orange)),
//       ),
//       centerTitle: true,
//       automaticallyImplyLeading: false,
//       leading: new IconButton(
//         icon: new Icon(Icons.sort, color: Get.theme.hintColor),
//         onPressed: () => {Scaffold.of(context).openDrawer()},
//       ),
//       actions: [NotificationsButtonWidget()],
//       flexibleSpace: FlexibleSpaceBar(
//           collapseMode: CollapseMode.parallax,
//           background: Container(
//             width: double.infinity,
//             padding: EdgeInsets.only(top: 75),
//             decoration: new BoxDecoration(
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
//             ),
//
//           )),
//     ),
//     // SliverToBoxAdapter(
//     //   child: Obx(() {
//     //     // if (controller.reviews.isEmpty) {
//     //     //   return CircularLoadingWidget(height: 100);
//     //     // }
//     //     return ListView.builder(
//     //       padding: EdgeInsets.all(0),
//     //       itemBuilder: (context, index) {
//     //         return ReviewItemWidget( /*review:controller.reviews.elementAt(index)*/);
//     //       },
//     //       itemCount: /*controller.reviews.length*/2,
//     //       primary: false,
//     //       shrinkWrap: true,
//     //     );
//     //   }),
//     // ),
//   ],
// ),
