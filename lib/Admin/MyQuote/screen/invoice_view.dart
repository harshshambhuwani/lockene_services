import 'dart:typed_data';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
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


import '../../../features/common/filter_bottom_sheet_widget.dart';
import '../../../features/common/ui.dart';
import '../../../styles/styles.dart';
import '../../AddClient/screen/addclient_view.dart';
import '../controller/invoiceview_controller.dart';
import '../controller/jobview_controller.dart';
import '../controller/viewquote_controller.dart';
import '../widgets/collectpayment_bottom_sheet_widget.dart';


class InvoiceView extends GetView<ViewInvoiceController> {

  var title = "invoice";
  var selectedValue = ''.obs;


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
                        elevation: 0,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return EditDialog1();
                              });
                          // Get.toNamed(Routes.EDIT_INVOICE);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.orange,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(Icons.edit_outlined, color: Colors.white,size: 22,),
                            Text("Edit".tr, style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.white,fontWeight: FontWeight.w500))),

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
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Overview".tr, style: Get.textTheme.subtitle2),
                            Text("#721".tr,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                softWrap: true,
                                style: Get.textTheme.subtitle2),
                          ],
                        ),

                        content: Column(
                          children: [
                            // BookingRowWidget(
                            //     description: "Issued on".tr,
                            //     child: Align(
                            //         alignment: Alignment.centerRight,
                            //         child: Text("8 Feb 2023,  12:25",
                            //           style: Get.textTheme.caption!.merge(TextStyle(fontWeight: FontWeight.w500)),
                            //           textAlign: TextAlign.end,
                            //         )),
                            //     hasDivider: true),
                            // if (controller.booking.value.startAt != null)
                            BookingRowWidget(
                                description: "Payment Due on".tr,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "8 Feb 2023,  3:25",
                                      style: Get.textTheme.caption!.merge(TextStyle(fontWeight: FontWeight.w500)),
                                      textAlign: TextAlign.end,
                                    )),
                                hasDivider: true),
                            BookingRowWidget(
                                description: "Payment Status".tr,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Paid",
                                      style: Get.textTheme.caption!.merge(TextStyle(fontWeight: FontWeight.w500)),
                                      textAlign: TextAlign.end,
                                    )),
                                hasDivider: true),
                            BookingRowWidget(
                                description: "Invoice Status".tr,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Drafted",
                                      style: Get.textTheme.caption!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.orange)),
                                      textAlign: TextAlign.end,
                                    )),
                                hasDivider: false),
                          ],
                        )
                      // ;}),
                    ),

                    BookingTilWidget(
                      title: InkWell(
                        onTap: (){
                          Get.toNamed(Routes.ALL_LINE,arguments: "invoiceview");
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
                              Get.toNamed(Routes.EDIT_LINE,arguments: "invoiceview");
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
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
                          BookingRowWidget(
                              description: "Subtotal".tr,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text("₹ "+"1220"),
                              ),
                              hasDivider: true),
                          GestureDetector(
                            onTap: (){
                            },
                            child: Column(
                              children: List.generate(/*controller.booking.value.taxes!.length*/1, (index) {
                                var _tax = /*controller.booking.value.taxes!.elementAt(index)*/"20";
                                return BookingRowWidget(
                                    description:"Discount",
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child:
                                      GestureDetector(
                                          onTap: (){
                                            // _showAlertDialog(context,controller);
                                            Get.toNamed(Routes.DISCT_QUOTE);
                                          },
                                          child: Text("-- ₹ 100", style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.orange)),)),
                                    ), hasDivider: true).paddingOnly(top: 5.0);
                              }),
                            ),
                          ),
                          Column(
                            children: List.generate(/*controller.booking.value.taxes!.length*/1, (index) {
                              var _tax = /*controller.booking.value.taxes!.elementAt(index)*/"20";
                              return BookingRowWidget(
                                  description:"Tax",
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child:
                                    InkWell(
                                        onTap: (){
                                          Get.toNamed(Routes.TAX_QUOTE);
                                        },
                                        child: Text("+ ₹ 100", style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.orange)),)),
                                  ),
                                  hasDivider: true);
                            }),
                          ),
                          BookingRowWidget(
                            description: "Total Amount".tr,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("₹ "+"1220",
                                  style: Get.textTheme.headline6
                              ),
                            ),
                            hasDivider: true,
                          ),
                          BookingRowWidget(
                              descriptionFlex: 1,
                              valueFlex: 2,
                              description: "View Invoice ".tr,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 0, left: 12),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.REVIEW_INVOICE);

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
                  ],
                ),
              ),
            ],
          )),
    );

  }


  BookingTitleBarWidget buildBookingTitleBarWidget() {
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
                      AutoSizeText('Ankush Thengne',
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
                        child: AutoSizeText('Bung. No 54,Vani', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color:Colors.grey)).paddingOnly(right: 10.0),
                      ),
                    ],
                    // spacing: 8,
                    // crossAxisAlignment: WrapCrossAlignment.center,
                  ),
                ],
              ),
            ),
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
          // Expanded(
          //   child: Text("Contact Customer".tr, style: Get.textTheme.subtitle2),
          // ),
          Expanded(
            child: MaterialButton(
              height: 44,
              onPressed: () {
                Get.bottomSheet(
                  CollectBottomSheetWidget(),
                  isScrollControlled: true,
                );
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.orange.shade300,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                children: [
                  Text("Collect Payment".tr, style: Get.textTheme.bodyText2!.merge(TextStyle(color: Colors.white,fontWeight: FontWeight.w500))),

                ],
              ),
            ).paddingOnly(right: 20.0),
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

class EditDialog1 extends StatefulWidget {
  const EditDialog1({Key? key}) : super(key: key);

  @override
  State<EditDialog1> createState() => _EditDialog1State();
}

class _EditDialog1State extends State<EditDialog1> {
  String? valueChoose;
  List listItem = [
    'Date Send',
    'Custom',
  ];
  DateTime? _selectedDate;
  String? valueChoose1;
  List listItem1 = [
    'Upto receipt',
    'Net 15',
    'Net 30',
    'Net 45',
    'Custom',
  ];
  DateTime? _selectedDate1;
  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        lastDate : DateTime(2051),
        //what will be the previous supported year in picker

        firstDate: DateTime
            .now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
  }
  void _pickDateDialog1() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        lastDate : DateTime(2051),
        //what will be the previous supported year in picker
        firstDate: DateTime
            .now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate1 = pickedDate;
      });
    });
  }


  var process;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      scrollable: true,

      contentPadding: EdgeInsets.zero,
      title: Text('Edit Details'),
      content: Container(
        width: size.width * 0.9,
        // height: size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: 'Garden Cleaning',
              decoration: InputDecoration(
                hintText: 'Invoice title',
                labelText: 'Invoice title',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme1),
                ),
              ),
            ).paddingSymmetric(horizontal: 20.0),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 00, left:0, right: 0),
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Issued Date',style: Get.textTheme.bodyText1,
                        textAlign: TextAlign.start,),
                      valueChoose=="Custom"?
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            valueChoose="Date Send";
                          });
                        },
                        child: Text('Set Default',style: Get.textTheme.caption!.merge(TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                          textAlign: TextAlign.start,),
                      ):Container(),
                    ],
                  ),
                  valueChoose!="Custom"?
                  Row(
                    children: [
                      Icon(Icons.calendar_today_rounded,color: Colors.grey.shade700,size: 20,),
                      Expanded(
                        flex: 1,
                        child: DropdownButton(
                            underline: SizedBox(),
                            hint: Text(
                              'Please select issued date',
                              style: TextStyle(fontSize: size.width * ten),
                            ),
                            value: valueChoose,
                            icon: Icon(Icons.arrow_drop_down),
                            // iconSize: 36,
                            isExpanded: true,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * ten,
                                fontWeight: FontWeight.w500
                            ),
                            items: listItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(
                                  valueItem,
                                  style: TextStyle(
                                      fontSize: size.width * ten,
                                      color: textColor),
                                ),
                              );
                            }).toList(),
                            onChanged: (
                                newValue,
                                ) {
                              setState(() {
                                valueChoose = newValue as String?;
                              });
                            }).marginOnly(left: 14.0,right: 0.0,top: 0.0,bottom: 0),
                      ),
                    ],
                  ):GestureDetector(
                    onTap: _pickDateDialog,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today_rounded,size: 20,),
                          Text(
                            _selectedDate ==
                                null //ternary expression to check if date is null
                                ? 'Please select issued date'
                                : '${DateFormat.yMMMd().format(_selectedDate!)}',
                            style: Get.textTheme.subtitle2!.merge(TextStyle(
                                fontWeight: FontWeight.w500)),
                          ).paddingOnly(left: 10.0),
                        ],
                      ),

                    ).paddingOnly(top: 10),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 00, left:0, right: 0),
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payment Due',style: Get.textTheme.bodyText1,
                        textAlign: TextAlign.start,),
                      valueChoose1=="Custom"?
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            valueChoose1="Upto receipt";
                          });
                        },
                        child: Text('Set Default',style: Get.textTheme.caption!.merge(TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                          textAlign: TextAlign.start,),
                      ):Container(),
                    ],
                  ),
                  valueChoose1!="Custom"?
                  Row(
                    children: [
                      Icon(Icons.calendar_today_rounded,color: Colors.grey.shade700,size: 20,),
                      Expanded(
                        flex: 1,
                        child: DropdownButton(
                            underline: SizedBox(),
                            hint: Text(
                              'Please select payment due',
                              style: TextStyle(fontSize: size.width * ten),
                            ),
                            value: valueChoose1,
                            icon: Icon(Icons.arrow_drop_down),
                            // iconSize: 36,
                            isExpanded: true,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * ten,
                                fontWeight: FontWeight.w500
                            ),
                            items: listItem1.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(
                                  valueItem,
                                  style: TextStyle(
                                      fontSize: size.width * ten,
                                      color: textColor),
                                ),
                              );
                            }).toList(),
                            onChanged: (
                                newValue,
                                ) {
                              setState(() {
                                valueChoose1 = newValue as String?;
                              });
                            }).marginOnly(left: 14.0,right: 0.0,top: 0.0,bottom: 0),
                      ),
                    ],
                  ):GestureDetector(
                    onTap: _pickDateDialog1,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today_rounded,size: 20,),
                          Text(
                            _selectedDate1 ==
                                null //ternary expression to check if date is null
                                ? 'Please select payment due'
                                : '${DateFormat.yMMMd().format(_selectedDate1!)}',
                            style: Get.textTheme.subtitle2!.merge(TextStyle(
                                fontWeight: FontWeight.w500)),
                          ).paddingOnly(left: 10.0),
                        ],
                      ),

                    ).paddingOnly(top: 10),
                  ),
                ],
              ),
            ),


            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                // controller!.statusUpdated(showMessage: true);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Text(
                    'Update',
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
          ],
        ),
      ),
    );

  }


}


class UpdateTeamDialog extends StatefulWidget {
  const UpdateTeamDialog({Key? key}) : super(key: key);

  @override
  State<UpdateTeamDialog> createState() => _UpdateTeamDialogState();
}

class _UpdateTeamDialogState extends State<UpdateTeamDialog> {

  String? valueChoose;
  List listItem = [
    'Sanket Ukey',
    'Ankush Thengene',
    'Vikas Dubey',
    'Shashank Rao',
  ];
  var process;
  var date="";
  var time="";

  DateTime ? _selectedDate;
  TimeOfDay? _selectedTime /*= TimeOfDay.now()*/;


  void _pickDateDialog(BuildContext context) {

    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        lastDate : DateTime(2051),

        firstDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
  }

  //Method for showing the time picker
  void _showTimePicker() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      // builder: (context, child) {
      //   return Theme(
      //     data: ThemeData.light().copyWith(
      //       colorScheme: ColorScheme.light(
      //         // change the border color
      //         primary: Colors.orange,
      //         // change the text color
      //         onSurface: Colors.black,
      //       ),
      //       // button colors
      //       buttonTheme: ButtonThemeData(
      //         colorScheme: ColorScheme.light(
      //           primary: Colors.green,
      //         ),
      //       ),
      //     ),
      //     child: child!,
      //   );
      // },
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      scrollable: true,

      contentPadding: EdgeInsets.zero,
      title: Text('Update Team,Date & Time'),
      content: Container(
        width: size.width * 0.9,
        // height: size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Team Member').marginOnly(top: 20.0,bottom: 0),
            DropdownButton(
              isDense: true,
                hint: Text(
                  'Please select member',
                  style: TextStyle(fontSize: size.width * twelve),
                ),
                value: valueChoose,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 28,
                isExpanded: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * twelve,
                ),

                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(
                      valueItem,
                      style: TextStyle(
                          fontSize: size.width * twelve,
                          color: textColor),
                    ),
                  );
                }).toList(),
                onChanged: (
                    newValue,
                    ) {
                  setState(() {
                    valueChoose = newValue as String?;
                  });
                }
                ).marginOnly(top: 5.0,bottom: 0),
            Text('Service Date').marginOnly(top: 10.0,bottom: 0),

            Row(
              children: [
                Icon(Icons.calendar_today_rounded).marginOnly(right: 10.0),
                if(_selectedDate == null)
                GestureDetector(
                  onTap: () => _pickDateDialog(context),
                    child: Text('Please select service date.',style: TextStyle(color: Colors.grey.shade600),)),
                if(_selectedDate != null)
                GestureDetector(
                  onTap: (){
                    _pickDateDialog(context);
                  },
                    child: Container(width:size.width*0.6,
                        child: Text('${DateFormat.yMMMd().format(_selectedDate!)}'))),
              ],
            ).marginOnly(top: 5.0),
            Text('Service Time').marginOnly(top: 10.0,bottom: 0),
            Row(
              children: [
                Icon(Icons.alarm).marginOnly(right: 10.0),
                if(_selectedTime == null)
                  GestureDetector(
                      onTap: () => _showTimePicker(),
                      child: Text('Please select service time.',style: TextStyle(color: Colors.grey.shade600),)),
                if(_selectedTime != null)
                  GestureDetector(
                      onTap: (){
                        _showTimePicker();
                      },
                      child: Container(
                          width:size.width*0.6,
                          child: Text(_selectedTime!.format(context)))),
              ],
            ).marginOnly(top: 5.0),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Text(
                    'Save',
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
          ],
        ).paddingSymmetric(horizontal: size.width*0.05),
      ),
    );

  }
}

void _showAlertDialog(BuildContext context, [JobViewController ? controller]) {
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

void _showAlertDialogBill(BuildContext context, [JobViewController ? controller]) {
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




