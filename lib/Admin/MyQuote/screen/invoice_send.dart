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
import '../controller/invoicesend_controller.dart';
import '../controller/invoiceview_controller.dart';
import '../controller/jobview_controller.dart';
import '../controller/viewquote_controller.dart';


class InvoiceSend extends GetView<SendInvoiceController> {


  var message = "Hi Sushil K,\n\nThank you for your recent business with us\n\n\The invoice total is ₹10,000.00, with ₹8,000.00 to be paid by Apr 30, 2023.n\If you have any questions or concerns regarding this invoice, please don't hesitate to get in touch with us at sanky@gmail.com \n\n\Sincerely, \n\n\TrickySys IT Solutions";


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "View Invoice".tr,
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
            Text('To :',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            Container(
              // height: size.height * 0.08,
              color: Colors.white,
              child: TextFormField(
                initialValue: "rajatmeshram@gmail.com",
                decoration: InputDecoration(
                  hintText: 'Please enter email id',
                  labelText: 'Email Id',

                  labelStyle: TextStyle(color: Colors.orange),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: page),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: page),
                  ),
                ),
              ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            ),
            Text('Subject :',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            Container(
              // height: size.height * 0.08,
              color: Colors.white,
              child: TextFormField(
                initialValue: 'Invoice from TrickySys IT Solution-For Service Rendering',
                decoration: InputDecoration(
                  hintText: 'Please enter subject',
                  labelText: 'Subject',
                  labelStyle: TextStyle(color: Colors.orange),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme1),
                  ),
                ),
              ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            ),
            Text('Message :',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            Container(
              // height: size.height * 0.08,
              color: Colors.white,
              child: TextFormField(
                maxLines: 10,
                initialValue: message ,
                decoration: InputDecoration(
                  hintText: 'Please enter message for client',
                  labelText: 'Message',
                  labelStyle: TextStyle(color: Colors.orange),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme1),
                  ),
                ),
              ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            ),
            Text('Send Copy :',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0,vertical: 15.0),
            Togglekey(),
            Container(color: Colors.white,
              child: BlockButtonWidget(
                onPressed: () async {
                  launch('mailto:rajatmeshrams11@gmail.com?''subject=Invoice from TrickySys IT Solution-For Service Rendering&''body='+message);

                  // launch('mailto:rajatmeshrams11@gmail.com?''subject=Invoice from TrickySys IT Solution-For Service Rendering'+message'message=');
                  // launch('mailto:rajatmeshrams11@gmail.com?subject=${Uri.encodeFull('Invoice from TrickySys IT Solution-For Service Rendering')}&body=${message}');
                  // launch('mailto:$recipientEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}');

                },
                color: Colors.orange,
                text: Text(
                  "Send".tr,
                  style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
                ),
              ).paddingOnly(top: 15,bottom:15,left: 20,right: 20.0),
            ).paddingOnly(top:size.height*0.01,),


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




