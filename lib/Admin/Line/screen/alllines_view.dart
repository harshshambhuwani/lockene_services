import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:service/Admin/AddQuote/screen/addquote_view.dart';
import 'package:service/Admin/Line/screen/addlineitem_view.dart';
import 'package:service/Admin/session/session.dart';
import 'package:service/network/api_interface.dart';

import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../network/model/line_list_model.dart';
import '../controller/allline_controller.dart';

class AllLineView extends StatefulWidget {
  String? clientId;
  String? clientName;
  String? clientCity;
  String? clientPhone;
  String? clientEmail;
  String? jobTitle;
  AllLineView(
      {Key? key,
      this.clientId,
      this.clientName,
      this.clientCity,
      this.clientPhone,
      this.clientEmail, this.jobTitle})
      : super(key: key);

  @override
  State<AllLineView> createState() => _AllLineViewState();
}

class _AllLineViewState extends State<AllLineView> {
  final arg = Get.arguments;

  bool isLoading = true;
  List<LineData>? lineData;
  int? userId;
  List<String> filteredItems = [];
  String _query = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId().then((value) => {
          // userId = value,
          setState(() {
            userId = value;
            print("fromGetUserId $userId");
            ApiInterface().getLineList(userId.toString()).then((value) => {
                  if (value.status == "1")
                    {
                      lineData = value.data,
                      setState(() {
                        isLoading = false;
                      }),
                    }
                });
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Line Item".tr,
          style: Get.textTheme.subtitle1!
              .merge(TextStyle(fontWeight: FontWeight.w500)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          // buildSearchBar(),
          Hero(
            tag: Get.arguments ?? '',
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(
                    color: Get.theme.focusColor.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12, left: 0),
                    child: Icon(Icons.search, color: Colors.black),
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.grey.shade100,
                      child: TextFormField(
                        // controller: controller.textEditingController,
                        style: Get.textTheme.bodyText2,
                        onChanged: (value){
                         // search(value);
                        },
                        autofocus: false,
                        cursorColor: Get.theme.focusColor,
                        decoration: Ui.getInputDecoration(
                            hintText: "Search for line items...".tr),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
          SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Background color
                      ),
                      onPressed: () {
                        //Get.toNamed(Routes.NEW_LINE, arguments: "add1");
                        Get.to(AddLineitemView(userID: userId.toString()));
                      },
                      child: Text('Create Line Item',
                          style:
                              TextStyle(color: Colors.orange, fontSize: 16))))
              .paddingOnly(right: 20.0, left: 20.0, bottom: 10.0),
          Text(
            'My Line Items are ...'.tr,
            style: Get.textTheme.subtitle2!,
          ).marginSymmetric(horizontal: 20.0),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 600,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ListView.builder(
                        itemCount: lineData?.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return SingleChildScrollView(
                            child: GestureDetector(
                              onTap: () {
                                //
                                // String? id;
                                // String? tspId;
                                // String? tflType;
                                // String? tflName;
                                // String? tflDescription;
                                // String? tflPrice;
                                // String? tflQty;
                                // String? tflTotal;
                                // String? tflCreated;
                                // String? tflModified

                                Get.to(AddQuoteView(
                                    clientId : widget.clientId.toString(),
                                    clientName: widget.clientName.toString(),
                                    clientPhone: widget.clientPhone.toString(),
                                    clientCity: widget.clientCity.toString(),
                                    clientEmail: widget.clientEmail.toString(),
                                    userId: lineData?[index].id,
                                    tspId: lineData?[index].tspId,
                                    tflType: lineData?[index].tflType,
                                    tflName: lineData?[index].tflName,
                                    tflDescription:
                                        lineData?[index].tflDescription,
                                    tflPrice: lineData?[index].tflPrice,
                                    tflQty: lineData?[index].tflQty,
                                    tflTotal: lineData?[index].tflTotal,
                                joTitle : widget.jobTitle));
                              },
                              child: Container(
                                height: 80,
                                decoration: Ui.getBoxDecoration(),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 2,
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.orange,
                                          size: 30,
                                        )),
                                    Expanded(
                                        flex: 6,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                lineData?[index].tflName ?? "",
                                                style: Get.textTheme.subtitle2!,
                                              ),
                                              Text(
                                                lineData?[index].tflPrice ?? "",
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ).marginOnly(left: 20.0, right: 20.0, top: 5),
                            ),
                          );
                        }),
                  ),
                )
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Hero(
      tag: Get.arguments ?? '',
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(
              color: Get.theme.focusColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 0),
              child: Icon(Icons.search, color: Colors.black),
            ),
            Expanded(
              child: Material(
                color: Colors.grey.shade100,
                child: TextField(
                  // controller: controller.textEditingController,
                  style: Get.textTheme.bodyText2,
                  onSubmitted: (value) {
                    //controller.searchEServices(keywords: value);
                  },
                  autofocus: false,
                  cursorColor: Get.theme.focusColor,
                  decoration: Ui.getInputDecoration(
                      hintText: "Search for line items...".tr),
                ),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Future<int> getUserId() async {
    return await SessionManager().get(SessionDataKey().userId);
  }

  void search(String value) {
    //List<dynamic> searchResult = [];


    for (final item in lineData!) {
      if (item.tflPrice!.toLowerCase().contains(value.toLowerCase())) {
       setState(() {
         lineData?.add(item);
       });
       // print(searchResult);
        return;
      }
    }
  }

}
