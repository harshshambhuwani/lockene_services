import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/Admin/MyQuote/controller/allquote_controller.dart';
import 'package:service/Admin/MyQuote/screen/quote_view.dart';
import 'package:service/Admin/MyQuote/widgets/bookings_list_widget.dart';
import 'package:service/Admin/MyQuote/widgets/getquote_filter.dart';
import 'package:service/Admin/network/model/quote_list_model.dart';
import 'package:service/features/common/ui.dart';
import 'package:service/features/home/widgets/bookings_list_item_widget.dart';
import 'package:service/network/api_interface.dart';
import 'package:service/routes/app_routes.dart';
import 'package:service/styles/styles.dart';

import '../../../demo1.dart';


class AllQuoteView extends StatefulWidget {
  const AllQuoteView({Key? key}) : super(key: key);

  @override
  State<AllQuoteView> createState() => _AllQuoteViewState();
}

class _AllQuoteViewState extends State<AllQuoteView> {
  String? middle;
  var title = Get.arguments;
  List<QuoteData>? qData;
  bool isLoading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiInterface().getQuoteList().then((value) => {
      qData = value.data,
      setState((){
       isLoading =false;
    }),
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
        //  controller.refreshDetails(showMessage: true);
        },
        child: isLoading ? const Center(child: CircularProgressIndicator()) :CustomScrollView(
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
                "Total Quotes",
                style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
              ),
              centerTitle: true,
              automaticallyImplyLeading : false,
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => {Get.back()},
              ),
              actions: [
                GestureDetector(
                  onTap: (){
                    if(title=="Total Quotes"){
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context){
                            return GetFilter();
                          });
                    }else if(title=="Total Jobs"){
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context){
                            return JobFilter();
                          });
                    }else if(title=="Total Invoice"){
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context){
                            return InvoiceFilter();
                          });
                    }
                    // showModalBottomSheet(
                    //     context: context,
                    //     builder: (context){
                    //       return title=="Total Quotes"? GetFilter():JobFilter();8
                    //     });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.filter_alt_outlined, color: Get.theme.hintColor),
                      SizedBox(width: 10.0,),
                    ],
                  ).marginOnly(right: 20.0),
                )
              ],

            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
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
                  // BookingsListWidget(title),
                  GestureDetector(
                    onTap: (){
                      // Get.toNamed(Routes.VIEW_QUOTE, arguments:0);

                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: qData?.length,
                      itemBuilder: ((_, index) {
                        return InkWell(
                          onTap: (){
                            Get.to(  QuoteView(quoteData : qData?[index]));
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
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
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
                                                qData?[index].tbClientName.toString() ?? "",
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
                                                qData?[index].quoteNumber.toString() ?? "",
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
                                            Flexible(
                                              child: Text(
                                                qData?[index].tbClientName.toString() ?? "",
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
                                                // /*_booking.eProvider!.name!*/"Garden Cleaning",
                                                qData?[index].tbJobTitle.toString() ?? "",
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
                                               // "Duplex No.64,Lokhvihar Park,Nagpur",
                                                qData?[index].tbAddress.toString() ?? "",
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
                                                  //"₹ 1000/-",
                                                  qData?[index].total.toString() ?? "",
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
                      }),
                    ),
                  )
                ],
              ),

              // }),
            ),
          ],
        ),
      ),
    );
  }
}

