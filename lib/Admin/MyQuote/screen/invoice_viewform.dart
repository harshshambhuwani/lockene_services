import 'dart:typed_data';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:service/Admin/MyQuote/widgets/booking_actions_widget.dart';
import 'package:service/Admin/MyQuote/widgets/booking_row_widget.dart';
import 'package:service/Admin/MyQuote/widgets/booking_til_widget.dart';
import 'package:service/Admin/MyQuote/widgets/booking_title_bar_widget.dart';
import 'package:service/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

// import 'package:syncfusion_flutter_sliders/sliders.dart';


import '../../../features/common/block_button_widget.dart';
import '../../../features/common/ui.dart';
import '../../../styles/styles.dart';
import '../controller/invoice_review_controller.dart';
import '../controller/invoicesend_controller.dart';
import '../controller/invoiceview_controller.dart';
import '../controller/jobview_controller.dart';
import '../controller/viewquote_controller.dart';


class InvoiceReview extends GetView<ReviewInvoiceController> {


  var message = "Hi Sushil K,\n\nThank you for your recent business with us\n\n\The invoice total is ₹10,000.00, with ₹8,000.00 to be paid by Apr 30, 2023.n\If you have any questions or concerns regarding this invoice, please don't hesitate to get in touch with us at sanky@gmail.com \n\n\Sincerely, \n\n\TrickySys IT Solutions";


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Review Invoice".tr,
            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => {
              Get.back(),
            },
          ),
        ),
        body: ListView(
          primary: true,
          children: [
            Container(
              // height: Get.height * 0.8,
              decoration: BoxDecoration(
                color: page,
                // borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
                boxShadow: [
                  BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 15, offset: Offset(0, 25)),
                ],
                // border: border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
                // gradient: gradient,
              ),
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                    color: Colors.grey.shade200,

                  ),
                  width: Get.width*1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Invoice # 723",
                        style: Get.textTheme.bodyText2!.merge(TextStyle()),
                      ).paddingOnly(top: 5.0),
                      Text("For Service Rendering",
                        style: Get.textTheme.bodyText1!.merge(TextStyle(fontWeight: FontWeight.w500)),
                      ).paddingOnly(top: 5.0),
                      Text("Ankush Thengene",
                        style: Get.textTheme.subtitle2!.merge(TextStyle(fontWeight: FontWeight.w500)),
                      ).paddingOnly(top: 5.0),
                      Text("Bung No.43 ,Vani,\nMaharashtra 440004,",
                        style: Get.textTheme.bodyText2,
                      ).paddingOnly(top: 5.0),
                      Text("9850111244",
                        style: Get.textTheme.bodyText2,
                      ).paddingOnly(top: 5.0),

                    ],
                  ).paddingSymmetric(horizontal: 15,vertical: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Issued on',
                      style: Get.textTheme.subtitle2,

                    ).paddingOnly(top: 5.0),
                    Text('18 Feb 2013',

                    ).paddingOnly(top: 5.0),
                  ],
                ).paddingSymmetric(horizontal: 15.0,vertical: 10),
                Divider(color: Colors.grey,).paddingSymmetric(horizontal: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Due on',
                      style: Get.textTheme.subtitle2,
                    ),
                    Text('30 Net',

                    ),
                  ],
                ).paddingSymmetric(horizontal: 15.0,vertical: 10),

                Divider(color: Colors.grey,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Backup Data',
                    style: Get.textTheme.subtitle2,
                  ),
                ).paddingOnly(left: 15.0,top: 5),
                Row(
                  children: [
                    Expanded(flex: 55,
                        child: Column(
                      children: [
                        Text("Qty",
                          style: Get.textTheme.subtitle2,
                        ),
                        Text("1").paddingOnly(top: 3.0)
                      ],
                    )),
                    Expanded(
                        flex:1,child: Container(
                        width: Get.width*1,
                        height: 30,
                      color: Colors.grey,)),
                    Expanded(flex: 55,
                        child: Column(
                      children: [
                        Text("Unit Price",
                          style: Get.textTheme.subtitle2,
                        ),
                        Text("₹ 2000").paddingOnly(top: 3.0)
                      ],
                    )),
                    Expanded(
                        flex:1,child: Container(
                      width: Get.width*1,
                      height: 30,
                      color: Colors.grey,)),

                    Expanded(flex: 55,
                        child: Column(
                      children: [
                        Text("Total",
                          style: Get.textTheme.subtitle2,
                        ),
                        Text("₹2000").paddingOnly(top: 3.0)
                      ],
                    )),

                  ],
                ).paddingSymmetric(vertical: 10),
                Divider(color: Colors.grey,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sub Total',
                      style: Get.textTheme.subtitle2,

                    ).paddingOnly(top: 5.0),
                    Text('₹ 2000',

                    ).paddingOnly(top: 5.0),
                  ],
                ).paddingSymmetric(horizontal: 15.0,vertical: 10),
                Divider(color: Colors.grey,).paddingSymmetric(horizontal: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                      style: Get.textTheme.subtitle2,
                    ),
                    Text('₹ 2000',

                    ),
                  ],
                ).paddingSymmetric(horizontal: 15.0,vertical: 10),
                Divider(color: Colors.grey,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Thank you for your business.Please contact us any question regarding this invoice',
                  ),
                ).paddingOnly(left: 15.0,top: 5,bottom: 20),


              ],),
            ).paddingSymmetric(horizontal: Get.width * 0.05,vertical: Get.width * 0.05),
            BlockButtonWidget(
              onPressed: () {
                Get.toNamed(Routes.SEND_INVOICE);

              },
              color: Colors.orange,
              text: Text(
                "Next".tr,
                style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
              ),
            ).paddingOnly(bottom:15,left: Get.width * 0.05,right: Get.width * 0.05),

          ],
        ),

      ),
    );

  }

}

class Togglekey extends StatefulWidget {
  const Togglekey({Key? key}) : super(key: key);

  @override
  State<Togglekey> createState() => _TogglekeyState();
}

class _TogglekeyState extends State<Togglekey> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
    color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Send me a copy',
            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),

          ).paddingOnly(left: 20),
          Switch(
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
            activeTrackColor: Colors.orange.shade200,
            activeColor: Colors.orange,
          ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
        ],
      ),
    );
  }
}

// import 'dart:typed_data';
// import 'dart:ui';
//
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:service/Admin/MyQuote/widgets/booking_actions_widget.dart';
// import 'package:service/Admin/MyQuote/widgets/booking_row_widget.dart';
// import 'package:service/Admin/MyQuote/widgets/booking_til_widget.dart';
// import 'package:service/Admin/MyQuote/widgets/booking_title_bar_widget.dart';
// import 'package:service/routes/app_routes.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

// // import 'package:syncfusion_flutter_sliders/sliders.dart';
//
//
// import '../../../features/common/block_button_widget.dart';
// import '../../../features/common/ui.dart';
// import '../../../styles/styles.dart';
// import '../controller/invoice_review_controller.dart';
// import '../controller/invoicesend_controller.dart';
// import '../controller/invoiceview_controller.dart';
// import '../controller/jobview_controller.dart';
// import '../controller/viewquote_controller.dart';
//
//
// class InvoiceReview extends GetView<ReviewInvoiceController> {
//
//
//   var message = "Hi Sushil K,\n\nThank you for your recent business with us\n\n\The invoice total is ₹10,000.00, with ₹8,000.00 to be paid by Apr 30, 2023.n\If you have any questions or concerns regarding this invoice, please don't hesitate to get in touch with us at sanky@gmail.com \n\n\Sincerely, \n\n\TrickySys IT Solutions";
//
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Review Invoice".tr,
//             style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.grey.shade50,
//           automaticallyImplyLeading: false,
//           elevation: 0,
//           leading: new IconButton(
//             icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
//             onPressed: () => {
//               Get.back(),
//             },
//           ),
//         ),
//         body: ListView(
//           primary: true,
//           children: [
//             Container(
//               // height: Get.height * 0.8,
//               decoration: BoxDecoration(
//                 color: page,
//                 // borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
//                 boxShadow: [
//                   BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 15, offset: Offset(0, 15)),
//                 ],
//                 // border: border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
//                 // gradient: gradient,
//               ),
//               child: Column(children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
//                     color: Colors.grey.shade200,
//
//                   ),
//                   width: Get.width*1,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Invoice # 723",
//                         style:TextStyle(fontSize: Get.width * twelve),
//                       ).paddingOnly(top: 5.0),
//                       Text("For Service Rendering",
//                         style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width * thirteen),
//                       ).paddingOnly(top: 5.0),
//                       Text("Ankush Thengene",
//                         style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width * thirteen),
//                       ).paddingOnly(top: 5.0),
//                       Text("Bung No.43 ,Vani,\nMaharashtra 440004,",
//                         style:TextStyle(fontSize: Get.width * eleven),
//                       ).paddingOnly(top: 5.0),
//                       Text("9850111244",
//                         style:TextStyle(fontSize: Get.width * eleven),
//                       ).paddingOnly(top: 5.0),
//
//                     ],
//                   ).paddingSymmetric(horizontal: 15,vertical: 15),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Issued on',
//                       style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width * twelve),
//
//                     ).paddingOnly(top: 5.0),
//                     Text('18 Feb 2013',
//                       style: TextStyle(fontSize: Get.width * twelve),
//
//                     ).paddingOnly(top: 5.0),
//                   ],
//                 ).paddingSymmetric(horizontal: 15.0,vertical: 10),
//                 Divider(color: Colors.grey,).paddingSymmetric(horizontal: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Due on',
//                       style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width * twelve),
//                     ),
//                     Text('30 Net',
//                       style: TextStyle(fontSize: Get.width * twelve),
//                     ),
//                   ],
//                 ).paddingSymmetric(horizontal: 15.0,vertical: 10),
//
//                 Divider(color: Colors.grey,),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Text('Backup Data',
//                     style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width * twelve),
//                   ),
//                 ).paddingOnly(left: 15.0,top: 5),
//                 Row(
//                   children: [
//                     Expanded(flex: 55,
//                         child: Column(
//                           children: [
//                             Text("Qty",
//                               style: Get.textTheme.subtitle2,
//                             ),
//                             Text("1").paddingOnly(top: 3.0)
//                           ],
//                         )),
//                     Expanded(
//                         flex:1,child: Container(
//                       width: Get.width*1,
//                       height: 30,
//                       color: Colors.grey,)),
//                     Expanded(flex: 55,
//                         child: Column(
//                           children: [
//                             Text("Unit Price",
//                               style: Get.textTheme.subtitle2,
//                             ),
//                             Text("₹ 2000").paddingOnly(top: 3.0)
//                           ],
//                         )),
//                     Expanded(
//                         flex:1,child: Container(
//                       width: Get.width*1,
//                       height: 30,
//                       color: Colors.grey,)),
//
//                     Expanded(flex: 55,
//                         child: Column(
//                           children: [
//                             Text("Total",
//                               style: Get.textTheme.subtitle2,
//                             ),
//                             Text("₹2000").paddingOnly(top: 3.0)
//                           ],
//                         )),
//
//                   ],
//                 ).paddingSymmetric(vertical: 10),
//                 Divider(color: Colors.grey,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Sub Total',
//                       style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width * twelve),
//
//                     ).paddingOnly(top: 5.0),
//                     Text('₹ 2000',
//                       style: TextStyle(fontSize: Get.width * twelve),
//
//                     ).paddingOnly(top: 5.0),
//                   ],
//                 ).paddingSymmetric(horizontal: 15.0,vertical: 10),
//                 Divider(color: Colors.grey,).paddingSymmetric(horizontal: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Total',
//                       style: TextStyle(fontWeight: FontWeight.w500,fontSize: Get.width * twelve),
//                     ),
//                     Text('₹ 2000',
//                       style: TextStyle(fontSize: Get.width * twelve),
//
//                     ),
//                   ],
//                 ).paddingSymmetric(horizontal: 15.0,vertical: 10),
//                 Divider(color: Colors.grey,),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Text('Thank you for your business.Please contact us any question regarding this invoice',
//                     style: TextStyle(fontSize: Get.width * eleven),
//
//                   ),
//                 ).paddingOnly(left: 15.0,top: 10,bottom: 25),
//
//
//               ],),
//             ).paddingSymmetric(horizontal: Get.width * 0.05,vertical: Get.width * 0.05),
//             BlockButtonWidget(
//               onPressed: () {
//                 Get.toNamed(Routes.SEND_INVOICE);
//
//               },
//               color: Colors.orange,
//               text: Text(
//                 "Next".tr,
//                 style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
//               ),
//             ).paddingOnly(bottom:15,left: Get.width * 0.05,right: Get.width * 0.05),
//
//           ],
//         ),
//
//       ),
//     );
//
//   }
//
// }
//
// class Togglekey extends StatefulWidget {
//   const Togglekey({Key? key}) : super(key: key);
//
//   @override
//   State<Togglekey> createState() => _TogglekeyState();
// }
//
// class _TogglekeyState extends State<Togglekey> {
//   bool _isSwitched = false;
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.08,
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('Send me a copy',
//             style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
//
//           ).paddingOnly(left: 20),
//           Switch(
//             value: _isSwitched,
//             onChanged: (value) {
//               setState(() {
//                 _isSwitched = value;
//               });
//             },
//             activeTrackColor: Colors.orange.shade200,
//             activeColor: Colors.orange,
//           ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
//         ],
//       ),
//     );
//   }
// }









