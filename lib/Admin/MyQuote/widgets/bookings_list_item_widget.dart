/*
 * Copyright (c) 2020 .
 */

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:service/features/common/ui.dart';


import '../../../styles/styles.dart';
import '../../../routes/app_routes.dart';

class BookingsListItemWidget extends StatelessWidget {

   final String title;

  BookingsListItemWidget(this.title);

  // const BookingsListItemWidget(title,  {
  //   Key? key,
  //   // required Booking booking,
  // })
  //     // : _booking = booking,
  //     //   super(key: key)
  // ;
  // final Booking _booking;



  @override
  Widget build(BuildContext context) {
    // Color _color = /*_booking.cancel! ? Get.theme.focusColor :*/ Get.theme.colorScheme.secondary;
    return GestureDetector(
      onTap: () {
        print(title);
        if(title=="Total Quotes"){
          Get.toNamed(Routes.VIEW_QUOTE, arguments:0);
        }else if(title=="Total Jobs"){
          Get.toNamed(Routes.VIEW_JOB, arguments:0);
        }else if(title=="Total Invoice"){
          Get.toNamed(Routes.VIEW_INVOICE, arguments:0);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: Ui.getBoxDecoration(color: page),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                    // imageUrl:"https://www.besthousekeepingindia.com/images/our-services/home-cleaning-service.webp",
                    imageUrl:"https://www.dirtblastercleaningservices.com/wp-content/uploads/2021/05/Bungalow-Cleaning-Services-Pune.jpg",
                    placeholder: (context, url) => Image.asset(
                      'assets/img/loading.gif',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 80,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error_outline),
                  ),
                ),

                Container(
                  width: 80,
                  child: Column(
                    children: [
                      Text(/*DateFormat('HH:mm').format(*//*_booking.bookingAt!*//*)*/"16:31",
                          maxLines: 1,
                          style: Get.textTheme.subtitle1!.merge(
                            TextStyle(color: Colors.white, height: 1.2,fontWeight: FontWeight.w500),
                          ),
                          softWrap: false,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade),
                      Text(/*DateFormat('dd').format(*//*_booking.bookingAt!*//*"")*/"30",
                          maxLines: 1,
                          style: Get.textTheme.titleLarge!.merge(
                            TextStyle(color: Colors.white, height: 1,fontWeight: FontWeight.w500),
                          ),
                          softWrap: false,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade),
                      Text(/*DateFormat('MMM').format(*//*_booking.bookingAt!*//*"")*/"Feb",
                          maxLines: 1,
                          style: Get.textTheme.subtitle1!.merge(
                            TextStyle(color: Colors.white, height: 1,fontWeight: FontWeight.w500),
                          ),
                          softWrap: false,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                ),
              ],
            ),
            SizedBox(width: 12),
            Expanded(
              child: Opacity(
                opacity: /*_booking.cancel! ? 0.3 :*/ 1,
                child: Wrap(
                  runSpacing: 5,
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            /*_booking.eService?.name ??*/'Sanket Ukey',
                            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
                            maxLines: 3,
                            // textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Get.theme.focusColor.withOpacity(0.1),
                          ),
                          child: Text(
                            /*controller.booking.value.status!.status!*/"# 786",
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            softWrap: true,
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                          ),
                        ),
                        // BookingOptionsPopupMenuWidget(/*booking: _booking*/),
                      ],
                    ),
                    Divider(height: 4, thickness: 1),
                    Row(
                      children: [
                        Icon(
                          Icons.flag,
                          size: 18,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 5),
                        if(title=="Total Quotes")
                        Flexible(
                          child: Text(
                            "Approved Quote",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.orange)),
                          ),

                        ),
                        if(title=="Total Jobs")
                          Flexible(
                            child: Text(
                              "Work Completed",
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.orange)),
                            ),

                          ),
                        if(title=="Total Invoice")
                          Flexible(
                            child: Text(
                              "Drafted",
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.orange)),
                            ),

                          ),

                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.build_circle_outlined,
                    //       size: 18,
                    //       color: Colors.grey.shade400,
                    //     ),
                    //     SizedBox(width: 5),
                    //     Flexible(
                    //       child: Text(
                    //         "Booking No.: 786",
                    //         maxLines: 1,
                    //         overflow: TextOverflow.fade,
                    //         softWrap: false,
                    //         style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.grey.shade500)),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      children: [
                        Icon(
                          Icons.build_circle_outlined,
                          size: 18,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            /*_booking.eProvider!.name!*/"Garden Cleaning",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.grey.shade500)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          size: 18,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            "Duplex No.64,Lokhvihar Park,Nagpur",
                            maxLines: 2,
                            overflow: TextOverflow.fade,
/*
                            softWrap: false,
*/
                            style: Get.textTheme.bodyText1!.merge(TextStyle(color: Colors.grey.shade500)),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 4, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Total".tr,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: Get.textTheme.bodyText1,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              "₹ 1000/-",
                              style: Get.textTheme.headline6!.merge(
                                  TextStyle(color: Colors.orange,)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
