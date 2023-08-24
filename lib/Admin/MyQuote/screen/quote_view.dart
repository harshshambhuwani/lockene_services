import 'dart:typed_data';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:service/Admin/MyQuote/widgets/booking_actions_widget.dart';
import 'package:service/Admin/MyQuote/widgets/booking_row_widget.dart';
import 'package:service/Admin/MyQuote/widgets/booking_til_widget.dart';
import 'package:service/Admin/MyQuote/widgets/booking_title_bar_widget.dart';
import 'package:service/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

// import 'package:syncfusion_flutter_sliders/sliders.dart';


import '../../../features/common/ui.dart';
import '../../../styles/styles.dart';
import '../controller/viewquote_controller.dart';


class QuoteView extends GetView<ViewQuoteController> {

var title = "quote";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BookingActionsWidget(title),
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
                    Get.find<ViewQuoteController>().refreshHome();
                    Get.back();
                  },
                ),
                actions: [
                        MaterialButton(
                         enableFeedback: true,
                        elevation: 0,
                        onPressed: () {

                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.white24,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: [
                            Text("Status : ".tr, style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.black))),
                            Text("Approved".tr, style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.orange))),
                            Icon(Icons.done_outline, color: Colors.orange),

                          ],
                        ),
                      ).paddingSymmetric(horizontal: 20,vertical: 8)
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
                          title: InkWell(
                            onTap: (){
                              Get.toNamed(Routes.ALL_LINE,arguments: "quoteview");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Line Item".tr, style: Get.textTheme.subtitle2),
                                Text("Add More".tr, style: Get.textTheme.subtitle2!.merge(TextStyle(color: Colors.orange))),
                              ],
                            ),
                          ),
                          content: Column(
                            children: [
                          InkWell(
                            onTap: (){
                              Get.toNamed(Routes.EDIT_LINE,arguments: "quoteview");
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: Get.width *1 ,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text("Floor Cleaning".tr, style: Get.textTheme.subtitle2!.merge(TextStyle(color: Colors.orange))).paddingSymmetric(vertical: 2.5),
                              Text("Description regarding work xyz".tr, maxLines: 3,style: Get.textTheme.subtitle2!.merge(TextStyle(color: Colors.grey.shade600))).paddingSymmetric(vertical: 5.0),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Text('1 x ₹ 5110',style: Get.textTheme.subtitle2!.merge(TextStyle(color: Colors.black))),Text('₹ 5000')],).marginOnly(bottom: 2.5)
                            ],),),
                          ),
                          Divider(color: Colors.grey.shade400,),
                              Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text("Plant Cutting".tr, style: Get.textTheme.subtitle2!.merge(TextStyle(color: Colors.orange))).paddingSymmetric(vertical: 2.5),
                            Text("Description regarding work xyz".tr, maxLines: 3,style: Get.textTheme.subtitle2!.merge(TextStyle(color: Colors.grey.shade600))).paddingSymmetric(vertical: 5.0),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text('1 x ₹ 5110',style: Get.textTheme.subtitle2!.merge(TextStyle(color: Colors.black))),Text('₹ 5000')],).marginOnly(bottom: 2.5)
                          ],),),
                          Divider(color: Colors.grey.shade400,),
                          BookingRowWidget(
                              description: "Subtotal".tr,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text("₹ " + "10220"),
                              ),
                              hasDivider: true),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(Routes.DISCT_QUOTE);
                            },
                            child: BookingRowWidget(
                                description: "Discount".tr,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("-- ₹ " + "220",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
                                ),
                                hasDivider: true),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(Routes.TAX_QUOTE);
                            },
                            child: BookingRowWidget(
                                description: "Tax".tr,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("₹ " + "220",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),),
                                ),
                                hasDivider: true),
                          ),
                          BookingRowWidget(
                            description: "Total Amount".tr,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("₹ " + "10,220",
                                  style: Get.textTheme.headline6),
                            ),
                            hasDivider: true,
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(Routes.DEPOSIT_QUOTE);
                            },
                            child: BookingRowWidget(
                              description: "Required Deposite".tr,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text("₹ " + "5,110",
                                    style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.orange))),
                              ),
                            ),
                          ),
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
                          Text('Client Message'.tr, style: Get.textTheme.subtitle2).marginOnly(bottom: 5.0),
                          TextFormField(
                          initialValue: 'jsnxhbsxhbshxshxbh',
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.grey.shade700,fontSize: 14),
                          cursorColor: Colors.orange,
                          decoration: Ui.getInputDecoration(
                            hintText: 'Please enter client message'
                          ),

                          )
                        ],
                      ),
                    )

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
                    'Garden Cleaning',
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
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  launch('mailto:rajatmeshrams11@gmail.com?''subject=From Mistrichacha services');
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

void _showAlertDialog(BuildContext context, [ViewQuoteController ? controller]) {
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

void _showAlertDialogBill(BuildContext context, [ViewQuoteController ? controller]) {
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



