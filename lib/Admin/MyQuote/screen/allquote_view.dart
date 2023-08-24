import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/Admin/MyQuote/controller/allquote_controller.dart';
import 'package:service/Admin/MyQuote/widgets/bookings_list_widget.dart';
import 'package:service/Admin/MyQuote/widgets/getquote_filter.dart';

import '../../../demo1.dart';





class AllQuoteView extends GetView<AllQuoteController> {
  // var list =  Get.arguments;
  int _value = 1;
  String? middle;
  var title = Get.arguments;


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
                title,
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
                    BookingsListWidget(title),
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
