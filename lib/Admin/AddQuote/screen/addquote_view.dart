import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:service/Admin/Line/screen/alllines_view.dart';
import 'package:service/Admin/MyQuote/screen/allquote_view.dart';
import 'package:service/Admin/MyQuote/screen/quote_view.dart';
import 'package:service/constants.dart';
import 'package:service/features/techniciandashboard/screen/techdashboard.dart';
import 'package:service/network/api_interface.dart';
import '../../../features/common/block_button_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';

class AddQuoteView extends StatefulWidget {
  String? clientId;
  String? clientName;
  String? clientPhone;
  String? clientCity;
  String? clientEmail;
  String? userId;
  String? tspId;
  String? tflType;
  String? tflName;
  String? tflDescription;
  String? tflPrice;
  String? tflQty;
  String? tflTotal;
  String? joTitle;
  AddQuoteView(
      {Key? key,
      this.clientId,
      this.clientName,
      this.clientPhone,
      this.clientCity,
      this.clientEmail,
      this.userId,
      this.tspId,
      this.tflType,
      this.tflName,
      this.tflDescription,
      this.tflPrice,
      this.tflQty,
      this.tflTotal, this.joTitle})
      : super(key: key);

  @override
  State<AddQuoteView> createState() => _AddQuoteViewState();
}

class _AddQuoteViewState extends State<AddQuoteView> {
  final arg = Get.arguments;

  TextEditingController jobTitleController = TextEditingController();
  TextEditingController instructionController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.joTitle !=""){
      jobTitleController.text = widget.joTitle.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;




    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create New Quote".tr,
            style: Get.textTheme.subtitle1!
                .merge(const TextStyle(fontWeight: FontWeight.w500)),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => {
             // Get.back(),
              Get.to(TechDash()),
            },
          ),
        ),
        body: ListView(
          primary: true,
          children: [
            widget.clientName == "" ? Text(
              'Service for',
              style: Get.textTheme.subtitle1!.merge(TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0, vertical: 15.0) :Container(),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ALL_CLIENT);
              },
              child: Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: widget.clientName == ""
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.person_outline_sharp,
                                size: 27,
                              ),
                              Text(
                                'Client',
                                style: Get.textTheme.subtitle1!.merge(
                                    const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ).paddingOnly(left: 10.0)
                            ],
                          ),
                          const Icon(
                            Icons.add,
                            size: 27,
                            color: Colors.orange,
                          )
                        ],
                      ).paddingSymmetric(horizontal: 20.0, vertical: 20.0) : Container()
              ),
            ),
            Text(
              'Overview',
              style: Get.textTheme.subtitle1!.merge(TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0, vertical: 15.0),
            widget.clientName == ""
                ? Container()
                : GestureDetector(
              onTap: (){
                Get.toNamed(Routes.ALL_CLIENT);
              },
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person_outline_sharp,
                                    size: 27,
                                  ),
                                  Text(
                                    widget.clientName.toString(),
                                    style: Get.textTheme.subtitle1!.merge(
                                        const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ).paddingOnly(left: 10.0)
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 14,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.home,
                                    size: 27,
                                  ),
                                  Text(
                                    widget.clientCity.toString(),
                                    style: Get.textTheme.subtitle1!.merge(
                                        const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ).paddingOnly(left: 10.0)
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 14,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                ),
            Container(
              // height: size.height * 0.08,
              color: Colors.white,
              child: TextFormField(
                controller: jobTitleController,
                decoration: InputDecoration(
                  hintText: 'Job title',
                  labelText: 'Job title',
                  labelStyle: const TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme1),
                  ),
                ),
              ).paddingSymmetric(horizontal: 20.0, vertical: 15.0),
            ),
            Text(
              'Work',
              style: Get.textTheme.subtitle1!.merge(TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey.shade600)),
            ).paddingSymmetric(horizontal: 20.0, vertical: 15.0),
            GestureDetector(
              onTap: () {
                // Get.toNamed(Routes.ALL_LINE);

                // clientName: "",
                // clientPhone: "",
                // clientCity: "",
                // clientEmail : ""
                Get.to(AllLineView(
                    clientId: widget.clientId.toString(),
                    clientName: widget.clientName.toString(),
                    clientPhone: widget.clientPhone.toString(),
                    clientCity: widget.clientCity.toString(),
                    clientEmail: widget.clientEmail.toString(),
                jobTitle : jobTitleController.text));
              },
              child: arg.toString() != "back1"
                  ? Container(
                      // height: size.height * 0.08,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.business_center_outlined,
                                size: 27,
                              ),
                              Text(
                                'Line Item',
                                style: Get.textTheme.subtitle1!.merge(TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                              ).paddingOnly(left: 10.0)
                            ],
                          ),
                          Icon(
                            Icons.add,
                            size: 27,
                            color: Colors.orange,
                          )
                        ],
                      ).paddingSymmetric(horizontal: 20.0, vertical: 20.0),
                    )
                  : Container(
                      // height: size.height * 0.08,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.business_center_outlined,
                                    size: 27,
                                  ),
                                  Text(
                                    'Line Item',
                                    style: Get.textTheme.subtitle1!.merge(
                                        TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)),
                                  ).paddingOnly(left: 10.0)
                                ],
                              ),
                              Icon(
                                Icons.add,
                                size: 27,
                                color: Colors.orange,
                              )
                            ],
                          ),
                          Text(
                            'Web Developer',
                            style: Get.textTheme.subtitle1!.merge(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600)),
                          ).paddingOnly(top: 5.0),
                          Text(
                            'Test',
                            style: Get.textTheme.subtitle2!.merge(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600)),
                          ).paddingOnly(top: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '1 x ',
                                    style: Get.textTheme.subtitle2!.merge(
                                        TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade600)),
                                  ),
                                  Text(
                                    '₹ 1,000',
                                    style: Get.textTheme.subtitle2!.merge(
                                        TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade600)),
                                  ),
                                ],
                              ),
                              Text(
                                '₹ 1,000 ',
                                style: Get.textTheme.subtitle2!.merge(TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade600)),
                              ),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20.0, vertical: 20.0),
                    ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              // height: size.height * 0.08,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                  ),
                  Text(
                    '₹ 0.00',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                  )
                ],
              ).paddingSymmetric(horizontal: 20.0, vertical: 20.0),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DISCT_QUOTE);
              },
              child: Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: Get.textTheme.subtitle1!
                          .merge(TextStyle(color: Colors.black)),
                    ),
                    Text(
                      '₹ 0.00',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.orange)),
                    )
                  ],
                ).paddingSymmetric(horizontal: 20.0, vertical: 20.0),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.TAX_QUOTE);
              },
              child: Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax',
                      style: Get.textTheme.subtitle1!
                          .merge(TextStyle(color: Colors.black)),
                    ),
                    Text(
                      '₹ 0.00',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.orange)),
                    )
                  ],
                ).paddingSymmetric(horizontal: 20.0, vertical: 20.0),
              ),
            ),
            Container(
              // height: size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: Get.textTheme.subtitle1!
                        .merge(TextStyle(color: Colors.black)),
                  ),
                  Text(
                    '₹ ${widget.tflTotal.toString() == null ? "" : widget.tflTotal.toString()}',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                  )
                ],
              ).paddingSymmetric(horizontal: 20.0, vertical: 20.0),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DEPOSIT_QUOTE);
              },
              child: Container(
                // height: size.height * 0.08,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Required deposit',
                      style: Get.textTheme.subtitle1!
                          .merge(TextStyle(color: Colors.black)),
                    ),
                    Text(
                      '₹ 0.00',
                      style: Get.textTheme.subtitle1!.merge(TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.orange)),
                    )
                  ],
                ).paddingSymmetric(horizontal: 20.0, vertical: 20.0),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              // height: size.height * 0.08,
              color: Colors.white,
              child: TextFormField(
                controller: instructionController,
                decoration: InputDecoration(
                  hintText: 'Instructions',
                  labelText: 'Instructions',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme1),
                  ),
                ),
              ).paddingSymmetric(horizontal: 20.0, vertical: 15.0),
            ),
            Container(
              color: Colors.white,
              child: BlockButtonWidget(
                onPressed: () async {
                  // showDialog(
                  //     barrierDismissible: false,
                  //     context: context,
                  //     builder: (_) {
                  //       // return CustomDialog();
                  //
                  //      return Alert();
                  //     });

                  // await Get.toNamed(Routes.TECHDASHBOARD,arguments: "admin");
                  if (jobTitleController.text == "") {
                    showToast("Please enter you job title");
                  } else if (instructionController.text == "") {
                    showToast("Please enter you job instruction");
                  } else {
                    // String? clientId;
                    // String? clientName;
                    // String? clientPhone;
                    // String? clientCity;
                    // String? clientEmail;
                    // String? userId;
                    // String? tspId;
                    // String? tflType;
                    // String? tflName;
                    // String? tflDescription;
                    // String? tflPrice;
                    // String? tflQty;
                    // String? tflTotal;

                    ApiInterface()
                        .createQuotes(
                            jobTitleController.text,
                            instructionController.text,
                            widget.clientId.toString(),
                            widget.clientName.toString(),
                            widget.tflPrice.toString(),
                            widget.tflTotal.toString(),
                            widget.clientPhone.toString(),
                            widget.clientCity.toString(),
                            widget.clientEmail.toString(),
                            widget.userId.toString(),
                            widget.tspId.toString(),
                            widget.tflType.toString(),
                            widget.tflName.toString(),
                            widget.tflDescription.toString(),
                            widget.tflQty.toString()
                         ).then((value) => {
                              if(value.status == "1"){
                                showToast(value.message.toString()),
                              //  Get.to(TechDash())
                                Get.to(AllQuoteView())
                              }
                    });
                  }
                },
                color: Colors.orange,
                text: Text(
                  "Submit".tr,
                  style: Get.textTheme.headline6!
                      .merge(TextStyle(color: Colors.white)),
                ),
              ).paddingOnly(top: 15, bottom: 15, left: 20, right: 20.0),
            ).paddingOnly(
              top: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}

class GetHours extends StatefulWidget {
  const GetHours({Key? key}) : super(key: key);

  @override
  State<GetHours> createState() => _GetHoursState();
}

class _GetHoursState extends State<GetHours> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var jobhour = "Select working time";

    String? valueChoose;
    List listItem = [
      '9 to 6',
      '8 to 5',
      'Custome Time',
    ];

    bool last = false;
    var click = "false";

    String? valueChoose1;
    List listItem1 = [
      'Full-Time',
      'Part-Time',
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
                boxShadow: [
                  BoxShadow(
                      color: Get.theme.focusColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5)),
                ],
                border:
                    Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Working Time',
                      style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,
                    )),
                Row(
                  children: [
                    Icon(
                      Icons.apartment_outlined,
                      color: Colors.grey.shade500,
                    ),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                              underline: SizedBox(),
                              hint: Text(
                                'Please select working time',
                                style: TextStyle(fontSize: size.width * nine),
                              ),
                              value: valueChoose,
                              icon: Icon(Icons.arrow_drop_down),
                              // iconSize: 36,
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.width * nine,
                                  fontWeight: FontWeight.w500),
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
                                valueChoose = newValue as String?;

                                setState(() {
                                  print(valueChoose);
                                });
                              })
                          .marginOnly(
                              left: 14.0, right: 0.0, top: 0.0, bottom: 0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}

class Drop extends StatefulWidget {
  const Drop({Key? key}) : super(key: key);

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
  String? valueChoose;
  List listItem = [
    '8 to 5',
    '9 to 6',
    '10 to 7 ',
    'Add Work Timing',
  ];
  String? valueChoose1;
  List listItem1 = [
    'Hourly',
    'Daily',
    'Monthly',
  ];

  var process;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
            decoration: BoxDecoration(
                color: page,
                // borderRadius: buildBorderRadius,
                boxShadow: [
                  BoxShadow(
                      color: Get.theme.focusColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5)),
                ],
                border:
                    Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Working Time',
                      style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,
                    ),
                    valueChoose == "Add Work Timing"
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                valueChoose = "8 to 5";
                              });
                            },
                            child: Text(
                              'Set Default',
                              style: Get.textTheme.caption!.merge(
                                  TextStyle(fontWeight: FontWeight.bold)),
                              textAlign: TextAlign.start,
                            ),
                          )
                        : Container(),
                  ],
                ),
                valueChoose != "Add Work Timing"
                    ? Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: Colors.grey.shade500,
                          ),
                          Expanded(
                            flex: 1,
                            child: DropdownButton(
                                    underline: SizedBox(),
                                    hint: Text(
                                      'Please select working Time',
                                      style: TextStyle(
                                          fontSize: size.width * nine),
                                    ),
                                    value: valueChoose,
                                    icon: Icon(Icons.arrow_drop_down),
                                    // iconSize: 36,
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.width * nine,
                                        fontWeight: FontWeight.w500),
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
                                    })
                                .marginOnly(
                                    left: 14.0,
                                    right: 0.0,
                                    top: 0.0,
                                    bottom: 0),
                          ),
                        ],
                      )
                    : Container(
                        child: TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          // onSaved: onSaved,
                          // onChanged: onChanged,
                          validator: (input) => input!.length < 3
                              ? "Should be more than 3 characters".tr
                              : null,
                          style: Get.textTheme.bodyText2,
                          textAlign: TextAlign.start,
                          decoration: Ui.getInputDecoration(
                            hintText: 'Please enter working time',
                            iconData: Icons.watch_later_outlined,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          Container(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              decoration: BoxDecoration(
                  color: page,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Get.theme.focusColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5)),
                  ],
                  border: Border.all(
                      color: Get.theme.focusColor.withOpacity(0.05))),
              child: Column(children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Salary',
                          style: Get.textTheme.bodyText1,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Salary Type',
                          style: Get.textTheme.bodyText1,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.phone,
                        // onSaved: onSaved,
                        // onChanged: onChanged,
                        validator: (input) => input!.length < 3
                            ? "Should be more than 3 characters".tr
                            : null,
                        style: Get.textTheme.bodyText2,
                        textAlign: TextAlign.start,
                        decoration: Ui.getInputDecoration(
                          hintText: 'Please enter salary',
                          iconData: Icons.monetization_on_outlined,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text(
                            'Type',
                            style: TextStyle(fontSize: size.width * nine),
                          ),
                          value: valueChoose1,
                          icon: Icon(Icons.arrow_drop_down),
                          // iconSize: 36,
                          isExpanded: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * nine,
                            /*fontWeight: FontWeight.w500*/
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
                          }),
                    ),
                  ],
                )
                // Expanded(
                //   flex:1,
                //   child:TextFieldWidget(
                //     labelText: "Please enter salary".tr,
                //     hintText: "Please enter salary".tr,
                //     // initialValue: (controller.currentUser.value.password)!,
                //     // onSaved: (input) => controller.currentUser.value.password = input,
                //     validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                //     // obscureText: controller.hidePassword.value,
                //     iconData: Icons.lock_outline,
                //     keyboardType: TextInputType.phone,
                //     isLast: true,
                //     isFirst: false,
                //     // suffixIcon: Icons.monetization_on_outlined,
                //   )
                // ),
                // Expanded(
                //   flex:1,
                //   child:TextFieldWidget(
                //     labelText: "Please enter salary".tr,
                //     hintText: "Please enter salary".tr,
                //     // initialValue: (controller.currentUser.value.password)!,
                //     // onSaved: (input) => controller.currentUser.value.password = input,
                //     validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                //     // obscureText: controller.hidePassword.value,
                //     iconData: Icons.lock_outline,
                //     keyboardType: TextInputType.phone,
                //     isLast: true,
                //     isFirst: false,
                //     // suffixIcon: Icons.monetization_on_outlined,
                //   )
                // ),
              ])),
        ],
      ),
    );
  }
}

class Alert extends StatefulWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        // title: Text('Update Status'),
        content: Container(
          width: size.width * 0.9,
          child: Column(
            children: [
              Container(
                  height: size.width * 0.4,
                  width: size.width * 0.4,
                  child: Lottie.network(
                      'https://assets5.lottiefiles.com/temporary_files/ofgUtS.json')),
              Text(
                'Quote Added Successful'.tr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  child: Text('Ok',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: Colors.orange),
              ).marginOnly(bottom: 20.0, top: 8.0),
            ],
          ),
        ));
  }
}
