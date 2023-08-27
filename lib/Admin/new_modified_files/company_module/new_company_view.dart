import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:service/Admin/network/model/costome_service_model.dart';
import 'package:service/Admin/network/model/country_model.dart';
import 'package:service/Admin/new_modified_files/login_module/new_login_screen.dart';
import 'package:service/drop_down_search.dart';
import 'package:service/features/bookings/widgets/otp_text_field_widget.dart';
import 'package:service/features/common/block_button_widget.dart';
import 'package:service/features/common/ui.dart';
import 'package:service/network/api_interface.dart';
import 'package:service/routes/app_routes.dart';
import 'package:service/styles/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class CompanyView extends StatefulWidget {
  String? fullName;
  String? companyName;
  String? emailAddress;
  String? passwordValue;
  CompanyView(
      {Key? key,
      this.fullName,
      this.companyName,
      this.emailAddress,
      this.passwordValue})
      : super(key: key);

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  String? valueChoose;
  List listItem = [
    'Authorized',
    'Private',
  ];
  String? valueChoose1;
  List listItem1 = [
    'Redmi',
    'Videocon',
    'Onida',
    'Sony',
    'Samsung',
  ];
  bool last = false;
  var click = "";

  File? file;
  File? wpart;
  ImagePicker imagePicker = ImagePicker();

  BorderRadius get buildBorderRadius {
    if (last) {
      return const BorderRadius.vertical(bottom: Radius.circular(0));
    }
    if (!last) {
      return const BorderRadius.vertical(bottom: Radius.circular(10));
    }
    return const BorderRadius.all(Radius.circular(10));
  }

  getcam() async {
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    // wpart = File(img!.path);
    setState(() {
      file = File(img!.path);
    });
  }

  getpcam() async {
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      wpart = File(img!.path);
    });
  }

  getpgall() async {
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    // wpart = File(img!.path);
    setState(() {
      wpart = File(img!.path);
    });
  }

  var process;

  List<String> selectedFruits = [];

  List<String> _selectedItems = [];

  bool radius = true;
  List<Data>? data;
  String? countryName;
  String selectedCoverIndustry = '';

  CountryModel? countryModel;

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  List<ServiceData>? serviceData;
  List<String> selectIndustry = [];
  bool isLoading = true;
  List<String> selectedItems = [];
  List<String?>? companyIndustryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiInterface().getCostomeServiceList().then((value) => {
          if (value.status == "success")
            {
              serviceData = value.data,
              companyIndustryList =
                  serviceData?.map((e) => e.customService).toList(),
              setState(() {
                isLoading = false;
              }),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Register",
          style:
              Get.textTheme.headline6!.merge(TextStyle(color: Colors.orange)),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade50,
        automaticallyImplyLeading: false,
        elevation: 0,
        // leading: new IconButton(
        //   icon: new Icon(Icons.arrow_back_ios, color: page),
        //   onPressed: () => {Get.find<RootController>().changePageOutRoot(0)},
        // ),
      ),
      body: isLoading
          ? const Center(
              child: SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator()),
            )
          : ListView(
              primary: true,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      decoration: Ui.getBoxDecoration(
                          radius: 14,
                          border: Border.all(width: 5, color: page),
                          color: Colors.black),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/3188/3188580.png',
                            fit: BoxFit.fitWidth,
                            width: 90,
                            height: 90,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Step  2 of 2'.tr,
                  style: Get.textTheme.subtitle1!.merge(const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500)),
                ).paddingOnly(top: 15, bottom: 5, right: 20, left: 20),
                Text(
                  'Set Up Your \nCompany'.tr,
                  style: Get.textTheme.headline6!.merge(const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
                ).paddingOnly(top: 0, bottom: 0, right: 20, left: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 14, left: 20, right: 20),
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          //borderRadius: buildBorderRadius,
                          boxShadow: [
                            BoxShadow(
                                color: Get.theme.focusColor.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5)),
                          ],
                          border: Border.all(
                              color: Get.theme.focusColor.withOpacity(0.05))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Phone Number" ?? "",
                            style: Get.textTheme.bodyText1,
                            textAlign: TextAlign.start,
                          ),
                          IntlPhoneField(
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              showDropdownIcon: false,
                              pickerDialogStyle: PickerDialogStyle(
                                  countryNameStyle: Get.textTheme.bodyText2),
                              style: Get.textTheme.bodyText2,
                              textAlign: TextAlign.start,
                              disableLengthCheck: true,
                              autovalidateMode: AutovalidateMode.disabled,
                              decoration: InputDecoration(
                                hintText: "Phone Number" ?? '',
                                hintStyle: Get.textTheme.caption,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding: EdgeInsets.all(0),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                // suffixIcon: suffixIcon,
                                // suffix: suffix,
                                // errorText: errorText,
                              )),
                        ],
                      ),
                    ),
                    // Dropdown(),
                    //const Drop(),

                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 10, left: 20, right: 20),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                              color: page,
                              // borderRadius: buildBorderRadius,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Get.theme.focusColor.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: Offset(0, 5)),
                              ],
                              border: Border.all(
                                  color:
                                      Get.theme.focusColor.withOpacity(0.05))),
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Company Type',
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
                                            underline: const SizedBox(),
                                            hint: Text(
                                              'Please select company type',
                                              style: TextStyle(
                                                  fontSize:
                                                      size.width * thirteen),
                                            ),
                                            value: valueChoose,
                                            icon: Icon(Icons.arrow_drop_down),
                                            // iconSize: 36,
                                            isExpanded: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.width * thirteen,
                                                fontWeight: FontWeight.w500),
                                            items: listItem.map((valueItem) {
                                              return DropdownMenuItem(
                                                value: valueItem,
                                                child: Text(
                                                  valueItem,
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.width * thirteen,
                                                      color: textColor),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (
                                              newValue,
                                            ) {
                                              setState(() {
                                                valueChoose =
                                                    newValue as String?;
                                                if (valueChoose.toString() ==
                                                    "Private") {
                                                  last = false;
                                                  click = "false";
                                                  radius = true;
                                                  print(click);
                                                } else {
                                                  last = true;
                                                  click = 'true';
                                                  print(click);
                                                  radius = false;
                                                }
                                              });
                                            })
                                        .marginOnly(
                                            left: 14.0,
                                            right: 0.0,
                                            top: 0.0,
                                            bottom: 0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        valueChoose.toString() == "Private"
                            ? Container(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 10, left: 20, right: 20),
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 0, bottom: 0),
                                decoration: BoxDecoration(
                                    color: page,
                                    // borderRadius: buildBorderRadius,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Get.theme.focusColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 5)),
                                    ],
                                    border: Border.all(
                                        color: Get.theme.focusColor
                                            .withOpacity(0.05))),
                                child: GestureDetector(
                                  onTap: () {
                                    print("fromOnTap");
                                    _showMultiSelect(companyIndustryList);
                                    //  showDialog(
                                    //    context: context,
                                    //   // builder: (BuildContext context) => MultiSelectDialog(selectedItemList : serviceData),
                                    //    builder: (BuildContext contexts) => StatefulBuilder(
                                    //      builder: (context, setStates) {
                                    //        return AlertDialog(
                                    //          title: const Text('Select Items'),
                                    //          content: SizedBox(
                                    //            width: double.maxFinite,
                                    //            child: ListView.builder(
                                    //              itemCount: serviceData?.length,
                                    //              itemBuilder: (context, index) {
                                    //                final item = serviceData?[index];
                                    //                return CheckboxListTile(
                                    //                  title: Text(serviceData?[index].customService.toString() ?? ""),
                                    //                  value: selectedItems.contains(serviceData?[index].customService.toString()),
                                    //                  onChanged: (bool? value) {
                                    //                    setStates(() {
                                    //                      if (value != null && value) {
                                    //                        selectedItems.add(serviceData?[index].customService.toString() ?? "");
                                    //                        print("fromOnChanger ${_selectedItems.length}");
                                    //                        _selectedItems = selectedItems;
                                    //                      } else {
                                    //                        selectedItems.remove(serviceData?[index].customService.toString() ?? "");
                                    //                        _selectedItems = selectedItems;
                                    //                      }
                                    //                    });
                                    //                  },
                                    //                );
                                    //              },
                                    //            ),
                                    //          ),
                                    //          actions: [
                                    //            TextButton(
                                    //              onPressed: () {
                                    //                Navigator.of(context).pop();
                                    //              },
                                    //              child: const Text('Cancel'),
                                    //            ),
                                    //            TextButton(
                                    //              // onPressed: () {
                                    //              //   // Do something with selected items
                                    //              //   print('Selected items: $selectedItems');
                                    //              //   Navigator.of(context).pop(context,_selectedItems);
                                    //              //
                                    //              // },
                                    //              onPressed: _submit,
                                    //              child: const Text('Confirm'),
                                    //            ),
                                    //          ],
                                    //        );
                                    //      }
                                    //    ),
                                    //  );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Company Industry',
                                            style: Get.textTheme.bodyText1,
                                            textAlign: TextAlign.start,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 15),
                                        child: Row(
                                          children: [
                                            _selectedItems.isEmpty
                                                ? const Icon(
                                                    Icons.work,
                                                    color: Colors.grey,
                                                    // size: 20.09,
                                                  )
                                                : Container(),
                                            _selectedItems.isEmpty
                                                ? Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 14.0),
                                                      child: Text(
                                                        'Select your industry',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    thirteen,
                                                            color: Colors
                                                                .grey.shade600),
                                                      ),
                                                    ),
                                                  )
                                                : Expanded(
                                                    flex: 1,
                                                    child: Wrap(
                                                      // alignment: WrapAlignment.center,
                                                      children: _selectedItems
                                                          .map((e) => Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            3.0,
                                                                        right:
                                                                            3.0),
                                                                child: Chip(
                                                                  label:
                                                                      Text(e),
                                                                ),
                                                              ))
                                                          .toList(),
                                                    ),
                                                  ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                              // size: 20.09,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                        click.toString() == "true"
                            ? Container(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 10, left: 20, right: 20),
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 0, bottom: 0),
                                decoration: BoxDecoration(
                                    color: page,
                                    borderRadius: buildBorderRadius,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Get.theme.focusColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 5)),
                                    ],
                                    border: Border.all(
                                        color: Get.theme.focusColor
                                            .withOpacity(0.05))),
                                child: Column(children: [
                                  Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Company Name',
                                        style: Get.textTheme.bodyText1,
                                        textAlign: TextAlign.start,
                                      )),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.build_circle_outlined,
                                        color: Colors.grey.shade500,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: DropdownButton(
                                                underline: SizedBox(),
                                                hint: Text(
                                                  'Please select company name',
                                                  style: TextStyle(
                                                      fontSize: size.width *
                                                          thirteen),
                                                ),
                                                value: valueChoose1,
                                                icon: Icon(Icons.arrow_drop_down),
                                                // iconSize: 36,
                                                isExpanded: true,
                                                style:
                                                    TextStyle(
                                                        color: Colors.black,
                                                        fontSize: size.width *
                                                            thirteen,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                items: listItem1.map((valueItem) {
                                                  return DropdownMenuItem(
                                                    value: valueItem,
                                                    child: Text(
                                                      valueItem,
                                                      style: TextStyle(
                                                          fontSize: size.width *
                                                              thirteen,
                                                          color: textColor),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (
                                                  newValue,
                                                ) {
                                                  setState(() {
                                                    valueChoose1 =
                                                        newValue as String?;
                                                    // if(valueChoose.toString()=="Private"){
                                                    //   last = false;
                                                    //   // click = "false";
                                                    //   print(click);
                                                    //
                                                    // }else{
                                                    //   last = true;
                                                    //   click = 'true';
                                                    //   print(click);
                                                    //
                                                    // }
                                                  });
                                                })
                                            .marginOnly(
                                                left: 14.0,
                                                right: 0.0,
                                                top: 0.0,
                                                bottom: 0),
                                      ),
                                    ],
                                  ),
                                ]))
                            : Container(),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          margin: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 0),
                          decoration: BoxDecoration(
                              color: page,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Get.theme.focusColor.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5)),
                              ],
                              border: Border.all(
                                  color:
                                      Get.theme.focusColor.withOpacity(0.05))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Address Details" ?? "",
                                style: Get.textTheme.bodyText1!
                                    .merge(const TextStyle(letterSpacing: 2)),
                                textAlign: TextAlign.start,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, top: 10),
                                    child: CSCPicker(
                                      showStates: true,
                                      showCities: true,
                                      flagState: CountryFlag.DISABLE,
                                      dropdownDecoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 1)),
                                      disabledDropdownDecoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.grey.shade300,
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 1)),
                                      countrySearchPlaceholder: "Country",
                                      stateSearchPlaceholder: "State",
                                      citySearchPlaceholder: "City",
                                      countryDropdownLabel: "Country",
                                      stateDropdownLabel: "State",
                                      cityDropdownLabel: "City",
                                      countryFilter: const [
                                        CscCountry.India,
                                        CscCountry.United_States,
                                        CscCountry.Canada,
                                        CscCountry.Afghanistan
                                      ],
                                      selectedItemStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      dropdownHeadingStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      dropdownItemStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      dropdownDialogRadius: 10.0,
                                      searchBarRadius: 10.0,
                                      onCountryChanged: (value) {
                                        setState(() {
                                          countryValue = value;
                                        });
                                      },
                                      onStateChanged: (value) {
                                        setState(() {
                                          stateValue = value ?? "";
                                        });
                                      },
                                      onCityChanged: (value) {
                                        setState(() {
                                          cityValue = value ?? "";
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          margin: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 0),
                          decoration: BoxDecoration(
                              color: page,
                              // borderRadius: const BorderRadius.vertical(
                              //     top: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Get.theme.focusColor.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5)),
                              ],
                              border: Border.all(
                                  color:
                                      Get.theme.focusColor.withOpacity(0.05))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Pin code" ?? "",
                                style: Get.textTheme.bodyText1!
                                    .merge(const TextStyle(letterSpacing: 2)),
                                textAlign: TextAlign.start,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                controller: pincodeController,
                                style: Get.textTheme.bodyText2,
                                obscureText: false,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.orange,
                                decoration: Ui.getInputDecoration(
                                  hintText: "Enter your pin code" ?? '',
                                  iconData: Icons.lock_outline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          margin: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 0),
                          decoration: BoxDecoration(
                              color: page,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Get.theme.focusColor.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5)),
                              ],
                              border: Border.all(
                                  color:
                                      Get.theme.focusColor.withOpacity(0.05))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Company Address" ?? "",
                                style: Get.textTheme.bodyText1!
                                    .merge(const TextStyle(letterSpacing: 2)),
                                textAlign: TextAlign.start,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                controller: companyAddressController,
                                style: Get.textTheme.bodyText2,
                                obscureText: false,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.orange,
                                decoration: Ui.getInputDecoration(
                                  hintText: "Enter your Company Address" ?? '',
                                  iconData: Icons.location_on,
                                ),
                              ),
                            ],
                          ),
                        ),
                        click.toString() == "true"
                            ? Container(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20, right: 20),
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 0, bottom: 0),
                                decoration: BoxDecoration(
                                    color: page,
                                    // borderRadius: buildBorderRadius,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Get.theme.focusColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 5)),
                                    ],
                                    border: Border.all(
                                        color: Get.theme.focusColor
                                            .withOpacity(0.05))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Authorized Certificate Image',
                                                style: Get.textTheme.bodyText1,
                                                textAlign: TextAlign.start,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  process = "proof";
                                                  _bottomsheet(
                                                      context, process);
                                                },
                                                child: Text(
                                                  'Change',
                                                  style:
                                                      Get.textTheme.bodyText1,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                    file == null
                                        ? Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  process = "proof";
                                                  _bottomsheet(
                                                      context, process);
                                                },
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color:
                                                          Colors.grey.shade400),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons.image,
                                                        size: 30,
                                                      ),
                                                      Text(
                                                        'Add Image',
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ).paddingSymmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                  child: Image.file(
                                                    file!,
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              )
                            : Container(),
                        click.toString() == "true"
                            ? Container(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20, right: 20),
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 0, bottom: 0),
                                decoration: BoxDecoration(
                                    color: page,
                                    borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(10.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Get.theme.focusColor
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 5)),
                                    ],
                                    border: Border.all(
                                        color: Get.theme.focusColor
                                            .withOpacity(0.05))),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Passport Size Photo',
                                                style: Get.textTheme.bodyText1,
                                                textAlign: TextAlign.start,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  process = "passport";
                                                  _bottomsheet(
                                                      context, process);
                                                },
                                                child: Text(
                                                  'Change',
                                                  style:
                                                      Get.textTheme.bodyText1,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                    wpart == null
                                        ? Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  process = "passport";
                                                  _bottomsheet(
                                                      context, process);
                                                },
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color:
                                                          Colors.grey.shade400),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons.image,
                                                        size: 30,
                                                      ),
                                                      Text(
                                                        'Add Image',
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ).paddingSymmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                  child: Image.file(
                                                    wpart!,
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    BlockButtonWidget(
                      onPressed: () {
                        // showDialog(
                        //     barrierDismissible: false,
                        //     context: context,
                        //     builder: (_) {
                        //       // return CustomDialog();
                        //
                        //       return Alert();
                        //     });

                        if (phoneNumberController.text == "") {
                          showToast("Please enter phone number");
                        } else if (click == "") {
                          showToast("Please choose company type first");
                        } else if (countryValue == "") {
                          showToast("Please select the country");
                        } else if (stateValue == "") {
                          showToast("Please select the state");
                        } else if (cityValue == "") {
                          showToast("Please select the cityValue");
                        } else if (pincodeController.text == "") {
                          showToast("Please enter the pincode");
                        } else if (companyAddressController.text == "") {
                          showToast("Please enter the company address");
                        } else {
                          ApiInterface().registerPrivateFsm(
                              widget.fullName
                              ,widget.companyName,
                              widget.emailAddress,
                              widget.passwordValue,
                              phoneNumberController.text,
                              countryValue,
                              stateValue,
                              cityValue,
                              pincodeController.text,
                              companyAddressController.text
                          ).then((value) => {
                            if(value.response?.status == "success"){
                              Get.to(const NewLoginScreen()),
                            }else{
                              showToast("Something went wrong"),
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
                    ).paddingOnly(top: 25, bottom: 25, right: 20, left: 20),
                  ],
                )
              ],
            ),
    );
  }

  void _bottomsheet(BuildContext context, process) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        builder: (context) {
          return Container(
            color: const Color(0xFF737373),
            height: 120,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (process.toString() == "process") {
                            getcam();
                          } else if (process.toString() == "passport") {
                            getpcam();
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.camera_enhance_rounded,
                              size: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Camera',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (process.toString() == "proof") {
                            getgall();
                          } else if (process.toString() == "passport") {
                            getpgall();
                          }
                          Navigator.pop(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.image,
                              size: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Gallery',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )),
                ],
              ),

              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              //   boxShadow: [
              //     BoxShadow(color: Get.theme.focusColor.withOpacity(0.4), blurRadius: 30, offset: Offset(0, -30)),
              //   ],
              // ),
            ),
          );
        });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  void _showMultiSelect(List<String?>? items) async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    // final List<String> items = [
    //   'AC & Refrigrators',
    //   'TV & Washing Machine',
    //   'Carpenter',
    //   'Electrician',
    //   'Computer & CCTV',
    // ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items ?? []);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
    //}
  }
}

class MultiSelect extends StatefulWidget {
  final List<String?>? items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text('Select your industry'),
      content: Container(
        width: size.width * 0.9,
        child: SingleChildScrollView(
          child: ListBody(
            children: widget.items!
                .map((item) => CheckboxListTile(
                      value: _selectedItems.contains(item),
                      title: Text(item!),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (isChecked) => _itemChange(item, isChecked!),
                    ))
                .toList(),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: ElevatedButton(
            onPressed: _submit,
            child: const Text('Submit'),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              //onPrimary: Colors.black,
            ),
          ),
        ),
      ],
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
                      'https://assets4.lottiefiles.com/packages/lf20_sjeuhlxx.json')),
              Text(
                'Registration Successful'.tr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.offAndToNamed(Routes.ADLOGIN);

                  // Get.back();
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
