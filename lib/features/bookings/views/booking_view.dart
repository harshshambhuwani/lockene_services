import 'dart:typed_data';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:service/features/Map/map_utils.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:intl/intl.dart' show DateFormat;
import 'package:url_launcher/url_launcher_string.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';


import '../../../Admin/MyQuote/screen/invoice_view.dart';
import '../../../styles/styles.dart';
import '../../common/map.dart';
import '../../common/ui.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/widgets/booking_options_popup_menu_widget.dart';
import '../../../routes/app_routes.dart';
import '../controllers/booking_controller.dart';
import '../widgets/booking_actions_widget.dart';
import '../widgets/booking_row_widget.dart';
import '../widgets/booking_til_widget.dart';
import '../widgets/booking_title_bar_widget.dart';
import '../widgets/booking_warranty_widget.dart';

class BookingView extends GetView<BookingController> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BookingActionsWidget(),
      body: RefreshIndicator(
          onRefresh: () async {
            controller.refreshBooking(showMessage: true);
          },
          child: CustomScrollView(
            primary: true,
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 370,
                elevation: 0,
                // pinned: true,
                floating: true,
                iconTheme: IconThemeData(color: Get.theme.primaryColor),
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                  onPressed: () {
                    Get.find<HomeController>().refreshHome();
                    Get.back();
                  },
                ),
                actions: [
                        MaterialButton(
                        elevation: 0,
                        onPressed: () {
                          MapUtils.openMap(21.142339, 79.06958);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.orange,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(Icons.map_outlined, color: Colors.white),
                            Text("On Maps".tr, style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.white))),
                          ],
                        ),
                      ).paddingSymmetric(horizontal: 20, vertical: 8)
                ],
                bottom: buildBookingTitleBarWidget(/*controller.booking*/),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background:  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(width: 5, color: page),
                      color: textColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        'https://kfmindia.in/wp-content/uploads/2017/05/garden_maintenance.jpg',
                        // 'http://www.evergreenlandscaping.in/wp-content/uploads/2018/09/garden-maintenance-e1537548069918.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 500,
                      ),
                    ),
                  ).marginSymmetric(horizontal: 10.0,vertical: 80.0),),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildContactCustomer(),
                    BookingTilWidget(
                          title: Text("Booking Details".tr, style: Get.textTheme.subtitle2),
                          actions: [Text("# " + "786", style: Get.textTheme.subtitle2)],
                          content: Column(
                            children: [
                              BookingRowWidget(
                                  descriptionFlex: 1,
                                  valueFlex: 2,
                                  description: "Req. Type".tr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          color: Get.theme.focusColor.withOpacity(0.1),
                                        ),
                                        child: Text(
                                          /*controller.booking.value.status!.status!*/"Servicing",
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          softWrap: true,
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  hasDivider: true),
                              BookingRowWidget(
                                  descriptionFlex: 1,
                                  valueFlex: 2,
                                  description: "Req. Status".tr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          color: Get.theme.focusColor.withOpacity(0.1),
                                        ),
                                        child: Text(
                                          /*controller.booking.value.status!.status!*/"On the way",
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          softWrap: true,
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  hasDivider: true),
                              BookingRowWidget(
                                  descriptionFlex: 1,
                                  valueFlex: 2,
                                  description: "Type".tr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          color: Get.theme.focusColor.withOpacity(0.1),
                                        ),
                                        child: Text(
                                          "Dedicated",
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          softWrap: true,
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  hasDivider: true),
                              BookingRowWidget(
                                  descriptionFlex: 1,
                                  valueFlex: 2,
                                  description:"Payment Status".tr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          color: Get.theme.focusColor.withOpacity(0.1),
                                        ),
                                        child: Text(
                                          "Not paid",
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          softWrap: true,
                                          style: TextStyle(color:  Colors.black,fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  hasDivider: true),
                              BookingRowWidget(
                                  descriptionFlex: 1,
                                  valueFlex: 2,
                                  description: "Track".tr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(right: 0, left: 12),
                                        child: MaterialButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.TRACKSTATUS);

                                          },
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          color: Colors.orange,
                                          child: Text(
                                            "View".tr, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),

                                          ),
                                          elevation: 5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  hasDivider: false),

                              // BookingRowWidget(
                              //     description: "Payment Status".tr,
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.end,
                              //       children: [
                              //         Container(
                              //           padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.all(Radius.circular(5)),
                              //             color: Get.theme.focusColor.withOpacity(0.1),
                              //           ),
                              //           child: Text(
                              //             /*controller.booking.value.payment?.paymentStatus?.status ??*/ "Not Paid".tr,
                              //             style: TextStyle(color: Get.theme.hintColor),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     hasDivider: true),
                              // if (controller.booking.value.payment?.paymentMethod != null)
                              //   BookingRowWidget(
                              //       description: "Payment Method".tr,
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.end,
                              //         children: [
                              //           Container(
                              //             padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
                              //             decoration: BoxDecoration(
                              //               borderRadius: BorderRadius.all(Radius.circular(5)),
                              //               color: Get.theme.focusColor.withOpacity(0.1),
                              //             ),
                              //             child: Text(/*controller.booking.value.payment?.paymentMethod?.getName())!*/"Test",
                              //               style: TextStyle(color: Get.theme.hintColor),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //       hasDivider: true),
                            ],
                          ),
                          ),
                    BookingTilWidget(
                          title: Text("Booking Date & Time".tr, style: Get.textTheme.subtitle2),
    //                       actions: [
    //                         Container(
    //                           padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.all(Radius.circular(5)),
    //                             color: Get.theme.focusColor.withOpacity(0.1),
    //                           ),
    //                           // child:
    //                           //     Text("00:00",
    //                           //       style: TextStyle(color:  Colors.black,fontWeight: FontWeight.w500),
    //                           //   ),
    // //                           }),
    //                         ),
    //                       ],
                          content: Column(
                              children: [
                                  BookingRowWidget(
                                      description: "Booking on".tr,
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("8 Feb 2023,  12:25",
                                            style: Get.textTheme.caption!.merge(TextStyle(fontWeight: FontWeight.w500)),
                                            textAlign: TextAlign.end,
                                          )),
                                      hasDivider: true),
                                // if (controller.booking.value.startAt != null)
                                  BookingRowWidget(
                                      description: "Service Scheduled on".tr,
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "8 Feb 2023,  3:25",
                                            style: Get.textTheme.caption!.merge(TextStyle(fontWeight: FontWeight.w500)),
                                            textAlign: TextAlign.end,
                                          )),
                                      hasDivider: false),
                              ],
                            )
                          // ;}),
                        ),
                    BookingTilWidget(
                          title: Text("Pricing".tr, style: Get.textTheme.subtitle2),
                          content: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  // BookingWarrantyWidget();
                                  // print("Warranty");
                                  // _showAlertDialog(context,controller);

                                },
                                child: Column(
                                  children: List.generate(/*controller.booking.value.taxes!.length*/1, (index) {
                                    var _tax = /*controller.booking.value.taxes!.elementAt(index)*/"20";
                                    return BookingRowWidget(
                                        description:"Warranty type",
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child:
                                          GestureDetector(
                                              onTap: (){
                                                _showAlertDialog(context,controller);

                                              },
                                              child: Text("Click for view", style: Get.textTheme.bodyText1,)),
                                        ), hasDivider: true);
                                  }),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  _showAlertDialogBill(context,controller);
                                  print("hi");
                                },
                                child: Column(
                                  children: List.generate(/*controller.booking.value.taxes!.length*/1, (index) {
                                    var _tax = /*controller.booking.value.taxes!.elementAt(index)*/"20";
                                    return BookingRowWidget(
                                        description:"Bill",
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child:
                                          Text("Click for view", style: Get.textTheme.bodyText1,),
                                        ),
                                        hasDivider: true);
                                  }),
                                ),
                              ),
                              BookingRowWidget(
                                  descriptionFlex: 2,
                                  valueFlex: 1,
                                  description: /*controller.booking.value.eService!.name!*/"Service charge",
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("1220",
                                      style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.grey.shade800)),
                                    ),
                                  ),
                                  hasDivider: true),
                                BookingRowWidget(
                                    description: "Quantity".tr,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "x 1" + /*controller.booking.value.quantity.toString() + */"" /*+ controller.booking.value.eService!.quantityUnit!.tr*/,
                                        style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.grey.shade800)),
                                      ),
                                    ),
                                    hasDivider: true),

                                //   BookingRowWidget(
                                //   description: "Tax Amount".tr,
                                //   child: Align(
                                //     alignment: Alignment.centerRight,
                                //     child: Text(/*controller.booking.value.getTaxesValue()*/"GST",
                                //       style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.grey.shade800)),
                                //     ),
                                //   ),
                                //   hasDivider: false,
                                // ),

                                  BookingRowWidget(
                                    description: "Subtotal".tr,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("₹ "+"1220"),
                                    ),
                                    hasDivider: true),
                              //   ;
                              // }),
                              // if ((controller.booking.value.coupon?.discount ?? 0) > 0)

                              //   BookingRowWidget(
                              //       description: "Coupon".tr,
                              //       child: Align(
                              //         alignment: Alignment.centerRight,
                              //         child: Wrap(
                              //           children: [
                              //             Text(' - ', style: Get.textTheme.bodyText1),
                              //             Text(/*controller.booking.value.coupon!.discount!*/"5%",
                              //               style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.grey.shade800)),)
                              //           ],
                              //         ),
                              //       ),
                              //       hasDivider: true),

                              // Obx(() {
                              //   return
                                  BookingRowWidget(
                                  description: "Total Amount".tr,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("₹ "+"1220",
                                        style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.orange))
                                    ),
                                  ),
                                )
    // ;
    //                           }),
                            ],
                          ),
                        ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: Ui.getBoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Team'.tr, style: Get.textTheme.subtitle2).marginOnly(bottom: 5.0),
                              GestureDetector(onTap: (){
                                print("update");
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return UpdateTeamDialog();
                                    });
                              },
                                  child: Text('Update'.tr, style: Get.textTheme.subtitle2!.merge(TextStyle(color: Colors.orange))).paddingOnly(left: 10,bottom: 5.0)),
                            ],
                          ),
                          Container(
                            // height: 80,
                            child: Row(
                              children: [
                                Icon(Icons.person,color: Colors.orange,size: 30,).paddingOnly(right: 10.0),
                                Expanded(
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
                              ],
                            ),
                          ).marginOnly(top: 10.0),
                        ],
                      ),
                    ),


                    // })
                  ],
                ),
              ),
            ],
          )),
    );

  }



  BookingTitleBarWidget buildBookingTitleBarWidget(/*Rx<Booking> _booking*/) {
    return BookingTitleBarWidget(
      title:
      // Obx(() {
      //   return
          Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AutoSizeText(
                    /*_booking.value.eService?.name ??*/ 'Garden Cleaning',
                    style: Get.textTheme.headline5!.merge(TextStyle(height: 1.1)),
                    overflow: TextOverflow.fade,
                  ),
                  Row(
                    children: [
                      Icon(Icons.person_outline, color: Colors.grey),
                      SizedBox(width: 8),
                      AutoSizeText(
                        /*_booking.value.user?.name ?? */'Ankush Thengne',
                        style: Get.textTheme.bodyText1!.merge(TextStyle(color:Colors.grey)),
                        maxLines: 1,
                        overflow:TextOverflow.fade,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.place_outlined, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: AutoSizeText(/*_booking.value.address?.address ??*/ 'Bung. No 54,Vani', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color:Colors.grey)).paddingOnly(right: 10.0),
                      ),
                    ],
                    // spacing: 8,
                    // crossAxisAlignment: WrapCrossAlignment.center,
                  ),
                ],
              ),
            ),
            // if (_booking.value.bookingAt == null)
            //   Container(
            //     width: 80,
            //     child: SizedBox.shrink(),
            //     decoration: BoxDecoration(
            //       color: Get.theme.colorScheme.secondary.withOpacity(0.2),
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //     ),
            //     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
            //   ),
            // if (_booking.value.bookingAt != null)
              Container(
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(/*DateFormat('HH:mm', Get.locale.toString()).format(_booking.value.bookingAt!)*/"12:30",
                        maxLines: 1,
                        style: Get.textTheme.bodyText2!.merge(
                          TextStyle(color: Colors.orange, height: 1.4),
                        ),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade),
                    Text(/*DateFormat('dd', Get.locale.toString()).format(_booking.value.bookingAt! ?? '')*/"28",
                        maxLines: 1,
                        style: Get.textTheme.headline4!.merge(
                          TextStyle(color: Colors.orange, height: 1),
                        ),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade),
                    Text(/*DateFormat('MMM', Get.locale.toString()).format(_booking.value.bookingAt ?? '')*/"Feb",
                        maxLines: 1,
                        style: Get.textTheme.bodyText2!.merge(
                          TextStyle(color: Colors.orange, height: 1),
                        ),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade),

                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              ),
          ],
        )
        // ;}),
    );
  }

  Container buildContactCustomer(/*Booking _booking*/) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: Ui.getBoxDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Text("Contact Customer".tr, style: Get.textTheme.subtitle2),
          ),
          Wrap(
            spacing: 5,
            children: [
              MaterialButton(
                onPressed: () {
                  // launchUrlString("tel:'9689455261'}");
                  UrlLauncher.launch("tel://9689455261");
                },
                height: 44,
                minWidth: 44,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.orange.shade300,
                child: Icon(
                  Icons.phone_android_outlined,
                  color: page,
                ),
                elevation: 5,
              ),
              MaterialButton(
                onPressed: () {
                  launch('mailto:rajatmeshrams11@gmail.com?''subject=From Lockene Services');
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.orange.shade300,
                padding: EdgeInsets.zero,
                height: 44,
                minWidth: 44,
                child: Icon(
                  Icons.mail,
                  color: page,
                ),
                elevation: 5,
              ),
            ],
          )
        ],
      ),
    );
  }

}

void _showAlertDialog(BuildContext context, [BookingController ? controller]) {
  String? valueChoose;
  var size = MediaQuery.of(context).size;
  List listItem = [
    'On the way',
    'In process',
    'Worked completed',
    'Not served',
  ];
  final url = "https://www.allaboutcards.de/mediathek/garantiekarte-hinten.png/image_preview";

  _save() async {
    var status = await Permission.storage.request();
    if(status.isGranted){
      var response = await Dio().get(
          url,
          options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: "hello");
      print(result);
    }

  }


  final TextEditingController _remarkController = TextEditingController();

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return
            AlertDialog(
              scrollable: true,
              contentPadding: EdgeInsets.zero,
              title: Text('Warranty Details'),
              content: Container(
                width: size.width * 0.9,
                // height: size.height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        Text('Warranty :',style: TextStyle(fontWeight: FontWeight.w500,),),
                        Text(' Under Warranty'),
                      ],
                    ).marginSymmetric(horizontal: 20.0),
                    Text('Warranty Document :',style: TextStyle(fontWeight: FontWeight.w500,),).marginSymmetric(horizontal: 20.0),
                    Container(
                      // color: Colors.black,
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 160,
                        imageUrl:/* _currentUser.value.avatar?.thumb ?? */'https://www.allaboutcards.de/mediathek/garantiekarte-hinten.png/image_preview',
                        placeholder: (context, url) => Image.asset(
                          'assets/img/loading.gif',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 160,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error_outline),
                      ),
                    ).paddingSymmetric(horizontal: 10.0),
                    // Image.network('https://www.allaboutcards.de/mediathek/garantiekarte-hinten.png/image_preview').paddingSymmetric(horizontal: 10.0,vertical: 5.0),

                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        controller!.downloadStart(showMessage: true);
                        _save();

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          child: Text(
                            'Download',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: size.width * fourteen,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Cancel',style:
                          TextStyle(fontWeight: FontWeight.w500,decoration: TextDecoration.underline,
                          ),textAlign: TextAlign.center,).paddingOnly(left: 20.0,bottom: 20,right: 20.0,top: 5.0),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
        });
      });
}

void _showAlertDialogBill(BuildContext context, [BookingController ? controller]) {
  String? valueChoose;
  var size = MediaQuery.of(context).size;
  List listItem = [
    'On the way',
    'In process',
    'Worked completed',
    'Not served',
  ];
  final url = "https://www.allaboutcards.de/mediathek/garantiekarte-hinten.png/image_preview";

  _save() async {
    var status = await Permission.storage.request();
    if(status.isGranted){
      var response = await Dio().get(
          url,
          options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: "hello");
      print(result);
    }

  }


  final TextEditingController _remarkController = TextEditingController();

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return
            AlertDialog(
              scrollable: true,
              contentPadding: EdgeInsets.zero,
              title: Text('Bill Details'),
              content: Container(
                width: size.width * 0.9,
                // height: size.height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0,),
                    // Row(
                    //   children: [
                    //     Text('Warranty :',style: TextStyle(fontWeight: FontWeight.w500,),),
                    //     Text(' Under Warranty'),
                    //   ],
                    // ).marginSymmetric(horizontal: 20.0),
                    Text('Bill Document :',style: TextStyle(fontWeight: FontWeight.w500,),).marginSymmetric(horizontal: 20.0),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.ZOOMVIEW);
                      },
                      child: Container(
                        // color: Colors.black,
                        child:
                        CachedNetworkImage(
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 160,
                          imageUrl:'https://www.allaboutcards.de/mediathek/garantiekarte-hinten.png/image_preview',
                          placeholder: (context, url) => Image.asset(
                            'assets/img/loading.gif',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 160,
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error_outline),
                        ),
                      ).paddingSymmetric(horizontal: 10.0),
                    ),
                    // Image.network('https://www.allaboutcards.de/mediathek/garantiekarte-hinten.png/image_preview').paddingSymmetric(horizontal: 10.0,vertical: 5.0),

                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        _save();
                        controller!.downloadStart(showMessage: true);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          child: Text(
                            'Download',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: size.width * fourteen,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Cancel',style:
                          TextStyle(fontWeight: FontWeight.w500,decoration: TextDecoration.underline,
                          ),textAlign: TextAlign.center,).paddingOnly(left: 20.0,bottom: 20,right: 20.0,top: 5.0),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
        });
      });
}

// sendEmail() {
//   final Email email = Email(
//       body:
//       'Hello World',
//       subject: 'Testing email on flutter',
//       recipients: ['rajatmeshrams11@gmail.com'],
//       //cc: ['cc@example.com'],
//       //bcc: ['bcc@example.com'],
//       //attachmentPaths: ['/path/to/attachment.zip'],
//       isHTML: false,
//   );
// }



