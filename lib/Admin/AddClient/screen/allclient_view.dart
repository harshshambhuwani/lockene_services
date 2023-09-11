import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:service/Admin/AddMember/controller/addsuccess_controller.dart';
import 'package:service/Admin/AddQuote/screen/addquote_view.dart';

import 'package:service/features/profile/widgets/phone_field_widget.dart';
import 'package:service/network/api_interface.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../features/common/text_field_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../../network/model/get_client_list_model.dart';
import '../controller/addclient_controller.dart';
import '../controller/allclient_controller.dart';

class AllClientView extends StatefulWidget {
  const AllClientView({Key? key}) : super(key: key);

  @override
  State<AllClientView> createState() => _AllClientViewState();
}

class _AllClientViewState extends State<AllClientView> {
  List<Data>? data;
  bool isLoading = true;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiInterface().getClientList().then((value) => {
          if (value.status == "1")
            {
              data = value.data,
              setState(() {
                isLoading = false;
              }),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Clients".tr,
          style: Get.textTheme.subtitle1!
              .merge(TextStyle(fontWeight: FontWeight.w500)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          buildSearchBar(),
          SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Background color
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.ADD_CLIENT, arguments: "add");
                      },
                      child: const Text('Create New Client',
                          style:
                              TextStyle(color: Colors.orange, fontSize: 16))))
              .paddingOnly(right: 20.0, left: 20.0, bottom: 10.0),
          Text(
            'My Clients are ...'.tr,
            style: Get.textTheme.subtitle2!,
          ).marginSymmetric(horizontal: 20.0),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 600,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ListView.builder(
                        itemCount: data?.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return SingleChildScrollView(
                            child: GestureDetector(
                              onTap: () {
                                // String? tcCustName;
                                // String? tcCustEmail;
                                // String? tcPhoneNumber;
                                // String? tcCountry;
                                // String? tcState;
                                // String? tcCity;
                                // String? tcPincode;
                                // String? tcAddress;
                                // String? customerGoogleAddress;
                                // String? countryName;
                                // String? stateName;
                                // String? cityName;
                                Get.to(AddQuoteView(
                                    clientName: data?[index].tcCustName,
                                    clientPhone: data?[index].tcPhoneNumber,
                                    clientCity: data?[index].cityName,
                                clientEmail : data?[index].tcCustEmail));
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
                                                data?[index].tcCustName ?? "",
                                                style: Get.textTheme.subtitle2!,
                                              ),
                                              Text(
                                                data?[index].tcPhoneNumber ??
                                                    "",
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
                ),
          const SizedBox(
            height: 120,
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
                    // controller.searchEServices(keywords: value);
                  },
                  autofocus: true,
                  cursorColor: Get.theme.focusColor,
                  decoration: Ui.getInputDecoration(
                      hintText: "Search for member...".tr),
                ),
              ),
            ),
            SizedBox(width: 8),
            // GestureDetector(
            //   onTap: () {
            //     Get.bottomSheet(
            //       FilterBottomSheetWidget(),
            //       isScrollControlled: true,
            //     );
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(8)),
            //       color: Get.theme.focusColor.withOpacity(0.1),
            //     ),
            //     child: Wrap(
            //       crossAxisAlignment: WrapCrossAlignment.center,
            //       spacing: 4,
            //       children: [
            //         Text(
            //           "Filter".tr,
            //           style: Get.textTheme.bodyText2, //TextStyle(color: Get.theme.hintColor),
            //         ),
            //         Icon(
            //           Icons.filter_list,
            //           color: Get.theme.hintColor,
            //           size: 21,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
