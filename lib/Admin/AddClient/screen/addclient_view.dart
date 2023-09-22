import 'package:contacts_service/contacts_service.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:service/Admin/AddClient/screen/allclient_view.dart';
import 'package:service/Admin/session/session.dart';
import 'package:service/constants.dart';
import 'package:service/features/profile/widgets/phone_field_widget.dart';
import 'package:service/network/api_interface.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../features/common/text_field_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/addclient_controller.dart';
import 'mycontacts.dart';

class AddClientView extends StatefulWidget {
  const AddClientView({Key? key}) : super(key: key);

  @override
  State<AddClientView> createState() => _AddClientViewState();
}

class _AddClientViewState extends State<AddClientView> {
  final arg = Get.arguments;
  // var size = MediaQuery.of(context).size;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressLine = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  bool isLoading = false;
  int? userId ;
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Client".tr,
            style: Get.textTheme.subtitle1!
                .merge(TextStyle(fontWeight: FontWeight.w500)),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => {
              Get.back(),
            },
          ),
        ),
        body: Form(
          // key: controller.loginFormKey,
          child: ListView(
            primary: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: ElevatedButton(
                      onPressed: () {
                         // Get.toNamed(Routes.MY_CONTACT);
                         // Get.to(MyContactView());
                        requestContactsPermission();

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // background color
                        onPrimary: Colors.white, // text color
                        elevation: 5, // button's elevation
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // button's border radius
                          side: BorderSide(
                              color: Colors.orange), // button's border color
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(
                            Icons.account_circle_outlined,
                            color: Colors.orange,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Add From Contacts",
                                style: Get.textTheme.headline6!
                                    .merge(TextStyle(color: Colors.orange)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextFieldWidget(
                    labelText: "Full Name".tr,
                    hintText: "Full Name".tr,
                    // initialValue: (controller.currentUser.value.name)!,
                    // onSaved: (input) => controller.currentUser.value.name = input,
                    validator: (input) => input!.length < 3
                        ? "Should be more than 3 characters".tr
                        : null,
                    iconData: Icons.person_outline,
                    isFirst: true,
                    controller: fullNameController,
                    isLast: false,
                  ),
                  TextFieldWidget(
                    labelText: "Email Address".tr,
                    hintText: "Email Address".tr,
                    controller: emailController,
                    // initialValue: (controller.currentUser.value.email)!,
                    // onSaved: (input) => controller.currentUser.value.email = input,
                    validator: (input) => !input!.contains('@')
                        ? "Should be a valid email".tr
                        : null,
                    iconData: Icons.alternate_email,
                    isFirst: false,
                    isLast: false,
                  ),
                  PhoneFieldWidget(
                    labelText: "Phone Number".tr,
                    hintText: "000 000 0000".tr,
                    controller: phoneController,
                    // initialCountryCode: (controller.currentUser.value.getPhoneNumber().countryISOCode),
                    // initialValue: (controller.currentUser.value.getPhoneNumber().number),
                    onSaved: (phone) {
                      // return controller.currentUser?.value?.phoneNumber = phone.completeNumber;
                      // return controller.currentUser.value.phoneNumber = phone!.completeNumber;
                    },
                    isLast: false,
                    isFirst: false,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 10, left: 20, right: 20),
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 0, bottom: 0),
                        decoration: BoxDecoration(
                            color: page,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Get.theme.focusColor.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0, 5)),
                            ],
                            border: Border.all(
                                color: Get.theme.focusColor.withOpacity(0.05))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Full Address',
                                  style: Get.textTheme.bodyText1,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ).paddingOnly(bottom: 10.0),
                            Row(
                              children: [
                                // Icon(Icons.home,color: Colors.grey.shade500,).marginOnly(right: 14),
                                Container(
                                  width: Get.height * 0.025,
                                  height: Get.height * 0.025,
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/3203/3203071.png',
                                    color: Colors.grey.shade500,
                                  ),
                                ).paddingOnly(right: 14.0),
                                Expanded(
                                  child: TextFormField(
                                    cursorColor: Colors.orange,
                                    controller: addressLine,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      hintText: 'Address Line 1',
                                      hintStyle: TextStyle(fontSize: 12),
                                      // labelText: 'Invoice title',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: page),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: page),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingOnly(bottom: 5.0),

                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: CSCPicker(
                                showStates: true,
                                showCities: true,
                                flagState: CountryFlag.DISABLE,
                                dropdownDecoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.orange, width: 1)),
                                disabledDropdownDecoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Colors.grey.shade300,
                                    border: Border.all(
                                        color: Colors.grey.shade300, width: 1)),
                                countrySearchPlaceholder: "Country",
                                stateSearchPlaceholder: "State",
                                citySearchPlaceholder: "City",
                                countryDropdownLabel: "Country",
                                stateDropdownLabel: "State",
                                cityDropdownLabel: "City",
                                countryFilter: const [
                                  CscCountry.Afghanistan,
                                  CscCountry.Aland_Islands,
                                  CscCountry.Albania,
                                  CscCountry.Algeria,
                                  CscCountry.American_Samoa,
                                  CscCountry.Andorra,
                                  CscCountry.Angola,
                                  CscCountry.Anguilla,
                                  CscCountry.Antarctica,
                                  CscCountry.Antigua_And_Barbuda,
                                  CscCountry.Argentina,
                                  CscCountry.Armenia,
                                  CscCountry.Aruba,
                                  CscCountry.Australia,
                                  CscCountry.Austria,
                                  CscCountry.Azerbaijan,
                                  CscCountry.Bahamas_The,
                                  CscCountry.Bahrain,
                                  CscCountry.Bangladesh,
                                  CscCountry.Barbados,
                                  CscCountry.Belarus,
                                  CscCountry.Belgium,
                                  CscCountry.Belize,
                                  CscCountry.Benin,
                                  CscCountry.Bermuda,
                                  CscCountry.Bhutan,
                                  CscCountry.Bolivia,
                                  CscCountry.Bosnia_and_Herzegovina,
                                  CscCountry.Botswana,
                                  CscCountry.Bouvet_Island,
                                  CscCountry.Brazil,
                                  CscCountry.British_Indian_Ocean_Territory,
                                  CscCountry.Brunei,
                                  CscCountry.Bulgaria,
                                  CscCountry.Burkina_Faso,
                                  CscCountry.Burundi,
                                  CscCountry.Cambodia,
                                  CscCountry.Cameroon,
                                  CscCountry.Canada,
                                  CscCountry.Cape_Verde,
                                  CscCountry.Cayman_Islands,
                                  CscCountry.Central_African_Republic,
                                  CscCountry.Chad,
                                  CscCountry.Chile,
                                  CscCountry.China,
                                  CscCountry.Christmas_Island,
                                  CscCountry.Cocos_Keeling_Islands,
                                  CscCountry.Colombia,
                                  CscCountry.Comoros,
                                  CscCountry.Congo,
                                  CscCountry
                                      .Congo_The_Democratic_Republic_Of_The,
                                  CscCountry.Cook_Islands,
                                  CscCountry.Costa_Rica,
                                  CscCountry.Cote_D_Ivoire_Ivory_Coast,
                                  CscCountry.Croatia_Hrvatska,
                                  CscCountry.Cuba,
                                  CscCountry.Cyprus,
                                  CscCountry.Czech_Republic,
                                  CscCountry.Denmark,
                                  CscCountry.Djibouti,
                                  CscCountry.Dominica,
                                  CscCountry.Dominican_Republic,
                                  CscCountry.East_Timor,
                                  CscCountry.Ecuador,
                                  CscCountry.Egypt,
                                  CscCountry.El_Salvador,
                                  CscCountry.Equatorial_Guinea,
                                  CscCountry.Eritrea,
                                  CscCountry.Estonia,
                                  CscCountry.Ethiopia,
                                  CscCountry.Falkland_Islands,
                                  CscCountry.Faroe_Islands,
                                  CscCountry.Fiji_Islands,
                                  CscCountry.Finland,
                                  CscCountry.France,
                                  CscCountry.French_Guiana,
                                  CscCountry.French_Polynesia,
                                  CscCountry.French_Southern_Territories,
                                  CscCountry.Gabon,
                                  CscCountry.Gambia_The,
                                  CscCountry.Georgia,
                                  CscCountry.Germany,
                                  CscCountry.Ghana,
                                  CscCountry.Gibraltar,
                                  CscCountry.Greece,
                                  CscCountry.Greenland,
                                  CscCountry.Grenada,
                                  CscCountry.Guadeloupe,
                                  CscCountry.Guam,
                                  CscCountry.Guatemala,
                                  CscCountry.Guernsey_and_Alderney,
                                  CscCountry.Guinea,
                                  CscCountry.Guinea_Bissau,
                                  CscCountry.Guyana,
                                  CscCountry.Haiti,
                                  CscCountry.Heard_Island_and_McDonald_Islands,
                                  CscCountry.Honduras,
                                  CscCountry.Hong_Kong_S_A_R,
                                  CscCountry.Hungary,
                                  CscCountry.Iceland,
                                  CscCountry.India,
                                  CscCountry.Indonesia,
                                  CscCountry.Iran,
                                  CscCountry.Iraq,
                                  CscCountry.Ireland,
                                  CscCountry.Israel,
                                  CscCountry.Italy,
                                  CscCountry.Jamaica,
                                  CscCountry.Japan,
                                  CscCountry.Jersey,
                                  CscCountry.Jordan,
                                  CscCountry.Kazakhstan,
                                  CscCountry.Kenya,
                                  CscCountry.Kiribati,
                                  CscCountry.Korea_North,
                                  CscCountry.Korea_South,
                                  CscCountry.Kuwait,
                                  CscCountry.Kyrgyzstan,
                                  CscCountry.Laos,
                                  CscCountry.Latvia,
                                  CscCountry.Lebanon,
                                  CscCountry.Lesotho,
                                  CscCountry.Liberia,
                                  CscCountry.Libya,
                                  CscCountry.Liechtenstein,
                                  CscCountry.Lithuania,
                                  CscCountry.Luxembourg,
                                  CscCountry.Macau_S_A_R,
                                  CscCountry.Macedonia,
                                  CscCountry.Madagascar,
                                  CscCountry.Malawi,
                                  CscCountry.Malaysia,
                                  CscCountry.Maldives,
                                  CscCountry.Mali,
                                  CscCountry.Malta,
                                  CscCountry.Man_Isle_of,
                                  CscCountry.Marshall_Islands,
                                  CscCountry.Martinique,
                                  CscCountry.Mauritania,
                                  CscCountry.Mauritius,
                                  CscCountry.Mayotte,
                                  CscCountry.Mexico,
                                  CscCountry.Micronesia,
                                  CscCountry.Moldova,
                                  CscCountry.Monaco,
                                  CscCountry.Mongolia,
                                  CscCountry.Montenegro,
                                  CscCountry.Montserrat,
                                  CscCountry.Morocco,
                                  CscCountry.Mozambique,
                                  CscCountry.Myanmar,
                                  CscCountry.Namibia,
                                  CscCountry.Nauru,
                                  CscCountry.Nepal,
                                  CscCountry.Bonaire_Sint_Eustatius_and_Saba,
                                  CscCountry.Netherlands_The,
                                  CscCountry.New_Caledonia,
                                  CscCountry.New_Zealand,
                                  CscCountry.Nicaragua,
                                  CscCountry.Niger,
                                  CscCountry.Nigeria,
                                  CscCountry.Niue,
                                  CscCountry.Norfolk_Island,
                                  CscCountry.Northern_Mariana_Islands,
                                  CscCountry.Norway,
                                  CscCountry.Oman,
                                  CscCountry.Pakistan,
                                  CscCountry.Palau,
                                  CscCountry.Palestinian_Territory_Occupied,
                                  CscCountry.Panama,
                                  CscCountry.Papua_new_Guinea,
                                  CscCountry.Paraguay,
                                  CscCountry.Peru,
                                  CscCountry.Philippines,
                                  CscCountry.Pitcairn_Island,
                                  CscCountry.Poland,
                                  CscCountry.Portugal,
                                  CscCountry.Puerto_Rico,
                                  CscCountry.Qatar,
                                  CscCountry.Reunion,
                                  CscCountry.Romania,
                                  CscCountry.Russia,
                                  CscCountry.Rwanda,
                                  CscCountry.Saint_Helena,
                                  CscCountry.Saint_Kitts_And_Nevis,
                                  CscCountry.Saint_Lucia,
                                  CscCountry.Saint_Pierre_and_Miquelon,
                                  CscCountry.Saint_Vincent_And_The_Grenadines,
                                  CscCountry.Saint_Barthelemy,
                                  CscCountry.Saint_Martin_French_part,
                                  CscCountry.Samoa,
                                  CscCountry.San_Marino,
                                  CscCountry.Sao_Tome_and_Principe,
                                  CscCountry.Saudi_Arabia,
                                  CscCountry.Senegal,
                                  CscCountry.Serbia,
                                  CscCountry.Seychelles,
                                  CscCountry.Sierra_Leone,
                                  CscCountry.Singapore,
                                  CscCountry.Slovakia,
                                  CscCountry.Slovenia,
                                  CscCountry.Solomon_Islands,
                                  CscCountry.Somalia,
                                  CscCountry.South_Africa,
                                  CscCountry.South_Georgia,
                                  CscCountry.South_Sudan,
                                  CscCountry.Spain,
                                  CscCountry.Sri_Lanka,
                                  CscCountry.Sudan,
                                  CscCountry.Suriname,
                                  CscCountry.Svalbard_And_Jan_Mayen_Islands,
                                  CscCountry.Swaziland,
                                  CscCountry.Sweden,
                                  CscCountry.Switzerland,
                                  CscCountry.Syria,
                                  CscCountry.Taiwan,
                                  CscCountry.Tajikistan,
                                  CscCountry.Tanzania,
                                  CscCountry.Thailand,
                                  CscCountry.Togo,
                                  CscCountry.Tokelau,
                                  CscCountry.Tonga,
                                  CscCountry.Trinidad_And_Tobago,
                                  CscCountry.Tunisia,
                                  CscCountry.Turkey,
                                  CscCountry.Turkmenistan,
                                  CscCountry.Turks_And_Caicos_Islands,
                                  CscCountry.Tuvalu,
                                  CscCountry.Uganda,
                                  CscCountry.Ukraine,
                                  CscCountry.United_Arab_Emirates,
                                  CscCountry.United_Kingdom,
                                  CscCountry.United_States,
                                  CscCountry
                                      .United_States_Minor_Outlying_Islands,
                                  CscCountry.Uruguay,
                                  CscCountry.Uzbekistan,
                                  CscCountry.Vanuatu,
                                  CscCountry.Vatican_City_State_Holy_See,
                                  CscCountry.Venezuela,
                                  CscCountry.Vietnam,
                                  CscCountry.Virgin_Islands_British,
                                  CscCountry.Virgin_Islands_US,
                                  CscCountry.Wallis_And_Futuna_Islands,
                                  CscCountry.Western_Sahara,
                                  CscCountry.Yemen,
                                  CscCountry.Zambia,
                                  CscCountry.Zimbabwe,
                                  CscCountry.Kosovo,
                                  CscCountry.Curacao,
                                  CscCountry.Sint_Maarten_Dutch_part,
                                ],
                                selectedItemStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                dropdownHeadingStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                dropdownItemStyle: const TextStyle(
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

                            // TextFormField(
                            //   cursorColor: Colors.orange,
                            //
                            //   decoration: InputDecoration(
                            //     isDense: true,
                            //     contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                            //     hintText: 'City',
                            //     hintStyle: TextStyle(fontSize: 12),
                            //     // labelText: 'Invoice title',
                            //     labelStyle: TextStyle(color: Colors.black),
                            //     enabledBorder: UnderlineInputBorder(
                            //       borderSide: BorderSide(color: page),
                            //     ),
                            //     focusedBorder: UnderlineInputBorder(
                            //       borderSide: BorderSide(color: theme1),
                            //     ),
                            //   ),
                            // ).paddingOnly(bottom: 5.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextFieldWidget(
                    labelText: "Pincode".tr,
                    hintText: "000000".tr,
                    maxlenth: 6,
                    controller: pinCodeController,
                    // initialValue: (controller.currentUser.value.email)!,
                    // onSaved: (input) => controller.currentUser.value.email = input,
                    validator: (input) => !input!.contains('@')
                        ? "Should be a valid email".tr
                        : null,
                    iconData: Icons.alternate_email,
                    isFirst: false,
                    isLast: false,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: Get.size.width,
                height: 52,
                //color: Colors.orange,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    setState(() {
                      isLoading = false;
                    });
                    if(fullNameController.text == ""){
                      showToast("Please enter the full name first");
                    }else if(emailController.text == ""){
                      showToast("Please enter the email first");
                    }
                    else if(phoneController.text == ""){
                      showToast("Please enter the phone number");
                    }
                    else if(addressLine.text == ""){
                      showToast("Please enter the address first");
                    }else if(countryValue == ""){
                      showToast("Please enter the country");
                    }
                    else if(stateValue == ""){
                      showToast("Please enter the state");
                    }
                    else if(cityValue == ""){
                      showToast("Please enter the city");
                    }else if(pinCodeController.text == ""){
                      showToast("Please enter the pin code");
                    }else {
                      if (isLoading == false) {
                        ApiInterface()
                            .addClientToDataBase(
                            fullNameController.text.toString(),
                            emailController.text.toString(),
                            phoneController.text.toString(),
                            addressLine.text.toString(),
                            countryValue,
                            stateValue,
                            cityValue,
                            pinCodeController.text,
                            userId.toString())
                            .then((value) async => {
                          if (value.response?.status == "1")
                            {
                              Get.toNamed(Routes.ALL_CLIENT),
                              showToast(
                                  value.response?.message.toString() ??
                                      ""),
                            }
                          else
                            {
                              showToast(
                                  value.response?.message.toString() ??
                                      ""),
                            }
                        });
                      }
                    }
                  },
                  child: (isLoading)
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1.5,
                          ))
                      : const Text("Submit",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ).paddingSymmetric(vertical: 5, horizontal: 20),
            ],
          ),
        ),
      ),
    );
  }

  void getUserData() {
    getUserId().then((value) => {
      // userId = value,
      setState((){
        userId = value;
      }),
    });
  }

  Future<int> getUserId() async {
    return await SessionManager().get(SessionDataKey().userId);
  }

  void requestContactsPermission() async {
    final PermissionStatus status = await Permission.contacts.request();
    if (status.isGranted) {
      getContacts();
      // You have permission to access contacts.
    } else {
      // You don't have permission. Handle this case.
    }
  }

  Future<void> getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    List<String> contactsName = [];
    for (var contact in contacts) {
      print('Name: ${contact.displayName}');
      contactsName.add(contact.displayName ?? "");
      print('Phone: ${contact.phones}');
      // You can access other contact properties as needed.
    };
    Get.to(MyContactView(contactList :contacts, newStringContact :contactsName));
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
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

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
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10.0)),
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
                      'Full Address',
                      style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ).paddingOnly(bottom: 10.0),
                Row(
                  children: [
                    // Icon(Icons.home,color: Colors.grey.shade500,).marginOnly(right: 14),
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3203/3203071.png',
                        color: Colors.grey.shade500,
                      ),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Address Line 1',
                          hintStyle: TextStyle(fontSize: 12),
                          // labelText: 'Invoice title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: page),
                          ),
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.0),
                // Row(
                //   children: [
                //     Container(
                //       width: Get.height * 0.025,
                //       height: Get.height * 0.025,
                //       child: Image.network('https://cdn-icons-png.flaticon.com/512/3203/3203071.png',color: Colors.grey.shade500,),
                //     ).paddingOnly(right: 14.0),
                //     Expanded(
                //       child: TextFormField(
                //         cursorColor: Colors.orange,
                //         decoration: InputDecoration(
                //           isDense: true,
                //           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                //           hintText: 'Address Line 2',
                //           hintStyle: TextStyle(fontSize: 12),
                //           // labelText: 'Invoice title',
                //           labelStyle: TextStyle(color: Colors.black),
                //           enabledBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: page),
                //           ),
                //           focusedBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: page),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ).paddingOnly(bottom: 5.0),
                // Row(
                //   children: [
                //     Container(
                //       width: Get.height * 0.025,
                //       height: Get.height * 0.025,
                //       child: Image.network('https://cdn-icons-png.flaticon.com/512/2942/2942076.png',color: Colors.grey.shade500,),
                //     ).paddingOnly(right: 14.0),
                //     Expanded(
                //       child: TextFormField(
                //         cursorColor: Colors.orange,
                //         decoration: InputDecoration(
                //           isDense: true,
                //           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                //           hintText: 'City',
                //           hintStyle: TextStyle(fontSize: 12),
                //           // labelText: 'Invoice title',
                //           labelStyle: TextStyle(color: Colors.black),
                //           enabledBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: page),
                //           ),
                //           focusedBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: page),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ).paddingOnly(bottom: 5.0),
                // Row(
                //   children: [
                //     Container(
                //       width: Get.height * 0.025,
                //       height: Get.height * 0.025,
                //       child: Image.network('https://cdn-icons-png.flaticon.com/512/5042/5042691.png',color: Colors.grey.shade500,),
                //     ).paddingOnly(right: 14.0),
                //     Expanded(
                //       child: TextFormField(
                //         cursorColor: Colors.orange,
                //         decoration: InputDecoration(
                //           isDense: true,
                //           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                //           hintText: 'State',
                //           hintStyle: TextStyle(fontSize: 12),
                //           // labelText: 'Invoice title',
                //           labelStyle: TextStyle(color: Colors.black),
                //           enabledBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: page),
                //           ),
                //           focusedBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: page),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ).paddingOnly(bottom: 5.0),
                // Row(
                //   children: [
                //     Container(
                //       width: Get.height * 0.025,
                //       height: Get.height * 0.025,
                //       child: Icon(Icons.numbers,color: Colors.grey.shade500,)
                //     ).paddingOnly(right: 14.0),
                //     Expanded(
                //       child: TextFormField(
                //         cursorColor: Colors.orange,
                //         decoration: InputDecoration(
                //           isDense: true,
                //           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                //           hintText: 'Postal Code',
                //           hintStyle: TextStyle(fontSize: 12),
                //           // labelText: 'Invoice title',
                //           labelStyle: TextStyle(color: Colors.black),
                //           enabledBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: page),
                //           ),
                //           focusedBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: page),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ).paddingOnly(bottom: 5.0),
                // Row(
                //   children: [
                //     Container(
                //       width: Get.height * 0.025,
                //       height: Get.height * 0.025,
                //       child: Image.network('https://cdn-icons-png.flaticon.com/512/44/44386.png',color: Colors.grey.shade500,),
                //     ).paddingOnly(right: 14.0),
                //     Expanded(
                //       child: TextFormField(
                //         cursorColor: Colors.orange,
                //         decoration: InputDecoration(
                //           isDense: true,
                //           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                //           hintText: 'Country',
                //           hintStyle: TextStyle(fontSize: 12),
                //           // labelText: 'Invoice title',
                //           labelStyle: TextStyle(color: Colors.black),
                //           enabledBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: page),
                //           ),
                //           focusedBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: page),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ).paddingOnly(bottom: 10.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: CSCPicker(
                    showStates: true,
                    showCities: true,
                    flagState: CountryFlag.DISABLE,
                    dropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),
                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade300,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),
                    countrySearchPlaceholder: "Country",
                    stateSearchPlaceholder: "State",
                    citySearchPlaceholder: "City",
                    countryDropdownLabel: "Country",
                    stateDropdownLabel: "State",
                    cityDropdownLabel: "City",
                    countryFilter: const [
                      CscCountry.Afghanistan,
                      CscCountry.Aland_Islands,
                      CscCountry.Albania,
                      CscCountry.Algeria,
                      CscCountry.American_Samoa,
                      CscCountry.Andorra,
                      CscCountry.Angola,
                      CscCountry.Anguilla,
                      CscCountry.Antarctica,
                      CscCountry.Antigua_And_Barbuda,
                      CscCountry.Argentina,
                      CscCountry.Armenia,
                      CscCountry.Aruba,
                      CscCountry.Australia,
                      CscCountry.Austria,
                      CscCountry.Azerbaijan,
                      CscCountry.Bahamas_The,
                      CscCountry.Bahrain,
                      CscCountry.Bangladesh,
                      CscCountry.Barbados,
                      CscCountry.Belarus,
                      CscCountry.Belgium,
                      CscCountry.Belize,
                      CscCountry.Benin,
                      CscCountry.Bermuda,
                      CscCountry.Bhutan,
                      CscCountry.Bolivia,
                      CscCountry.Bosnia_and_Herzegovina,
                      CscCountry.Botswana,
                      CscCountry.Bouvet_Island,
                      CscCountry.Brazil,
                      CscCountry.British_Indian_Ocean_Territory,
                      CscCountry.Brunei,
                      CscCountry.Bulgaria,
                      CscCountry.Burkina_Faso,
                      CscCountry.Burundi,
                      CscCountry.Cambodia,
                      CscCountry.Cameroon,
                      CscCountry.Canada,
                      CscCountry.Cape_Verde,
                      CscCountry.Cayman_Islands,
                      CscCountry.Central_African_Republic,
                      CscCountry.Chad,
                      CscCountry.Chile,
                      CscCountry.China,
                      CscCountry.Christmas_Island,
                      CscCountry.Cocos_Keeling_Islands,
                      CscCountry.Colombia,
                      CscCountry.Comoros,
                      CscCountry.Congo,
                      CscCountry.Congo_The_Democratic_Republic_Of_The,
                      CscCountry.Cook_Islands,
                      CscCountry.Costa_Rica,
                      CscCountry.Cote_D_Ivoire_Ivory_Coast,
                      CscCountry.Croatia_Hrvatska,
                      CscCountry.Cuba,
                      CscCountry.Cyprus,
                      CscCountry.Czech_Republic,
                      CscCountry.Denmark,
                      CscCountry.Djibouti,
                      CscCountry.Dominica,
                      CscCountry.Dominican_Republic,
                      CscCountry.East_Timor,
                      CscCountry.Ecuador,
                      CscCountry.Egypt,
                      CscCountry.El_Salvador,
                      CscCountry.Equatorial_Guinea,
                      CscCountry.Eritrea,
                      CscCountry.Estonia,
                      CscCountry.Ethiopia,
                      CscCountry.Falkland_Islands,
                      CscCountry.Faroe_Islands,
                      CscCountry.Fiji_Islands,
                      CscCountry.Finland,
                      CscCountry.France,
                      CscCountry.French_Guiana,
                      CscCountry.French_Polynesia,
                      CscCountry.French_Southern_Territories,
                      CscCountry.Gabon,
                      CscCountry.Gambia_The,
                      CscCountry.Georgia,
                      CscCountry.Germany,
                      CscCountry.Ghana,
                      CscCountry.Gibraltar,
                      CscCountry.Greece,
                      CscCountry.Greenland,
                      CscCountry.Grenada,
                      CscCountry.Guadeloupe,
                      CscCountry.Guam,
                      CscCountry.Guatemala,
                      CscCountry.Guernsey_and_Alderney,
                      CscCountry.Guinea,
                      CscCountry.Guinea_Bissau,
                      CscCountry.Guyana,
                      CscCountry.Haiti,
                      CscCountry.Heard_Island_and_McDonald_Islands,
                      CscCountry.Honduras,
                      CscCountry.Hong_Kong_S_A_R,
                      CscCountry.Hungary,
                      CscCountry.Iceland,
                      CscCountry.India,
                      CscCountry.Indonesia,
                      CscCountry.Iran,
                      CscCountry.Iraq,
                      CscCountry.Ireland,
                      CscCountry.Israel,
                      CscCountry.Italy,
                      CscCountry.Jamaica,
                      CscCountry.Japan,
                      CscCountry.Jersey,
                      CscCountry.Jordan,
                      CscCountry.Kazakhstan,
                      CscCountry.Kenya,
                      CscCountry.Kiribati,
                      CscCountry.Korea_North,
                      CscCountry.Korea_South,
                      CscCountry.Kuwait,
                      CscCountry.Kyrgyzstan,
                      CscCountry.Laos,
                      CscCountry.Latvia,
                      CscCountry.Lebanon,
                      CscCountry.Lesotho,
                      CscCountry.Liberia,
                      CscCountry.Libya,
                      CscCountry.Liechtenstein,
                      CscCountry.Lithuania,
                      CscCountry.Luxembourg,
                      CscCountry.Macau_S_A_R,
                      CscCountry.Macedonia,
                      CscCountry.Madagascar,
                      CscCountry.Malawi,
                      CscCountry.Malaysia,
                      CscCountry.Maldives,
                      CscCountry.Mali,
                      CscCountry.Malta,
                      CscCountry.Man_Isle_of,
                      CscCountry.Marshall_Islands,
                      CscCountry.Martinique,
                      CscCountry.Mauritania,
                      CscCountry.Mauritius,
                      CscCountry.Mayotte,
                      CscCountry.Mexico,
                      CscCountry.Micronesia,
                      CscCountry.Moldova,
                      CscCountry.Monaco,
                      CscCountry.Mongolia,
                      CscCountry.Montenegro,
                      CscCountry.Montserrat,
                      CscCountry.Morocco,
                      CscCountry.Mozambique,
                      CscCountry.Myanmar,
                      CscCountry.Namibia,
                      CscCountry.Nauru,
                      CscCountry.Nepal,
                      CscCountry.Bonaire_Sint_Eustatius_and_Saba,
                      CscCountry.Netherlands_The,
                      CscCountry.New_Caledonia,
                      CscCountry.New_Zealand,
                      CscCountry.Nicaragua,
                      CscCountry.Niger,
                      CscCountry.Nigeria,
                      CscCountry.Niue,
                      CscCountry.Norfolk_Island,
                      CscCountry.Northern_Mariana_Islands,
                      CscCountry.Norway,
                      CscCountry.Oman,
                      CscCountry.Pakistan,
                      CscCountry.Palau,
                      CscCountry.Palestinian_Territory_Occupied,
                      CscCountry.Panama,
                      CscCountry.Papua_new_Guinea,
                      CscCountry.Paraguay,
                      CscCountry.Peru,
                      CscCountry.Philippines,
                      CscCountry.Pitcairn_Island,
                      CscCountry.Poland,
                      CscCountry.Portugal,
                      CscCountry.Puerto_Rico,
                      CscCountry.Qatar,
                      CscCountry.Reunion,
                      CscCountry.Romania,
                      CscCountry.Russia,
                      CscCountry.Rwanda,
                      CscCountry.Saint_Helena,
                      CscCountry.Saint_Kitts_And_Nevis,
                      CscCountry.Saint_Lucia,
                      CscCountry.Saint_Pierre_and_Miquelon,
                      CscCountry.Saint_Vincent_And_The_Grenadines,
                      CscCountry.Saint_Barthelemy,
                      CscCountry.Saint_Martin_French_part,
                      CscCountry.Samoa,
                      CscCountry.San_Marino,
                      CscCountry.Sao_Tome_and_Principe,
                      CscCountry.Saudi_Arabia,
                      CscCountry.Senegal,
                      CscCountry.Serbia,
                      CscCountry.Seychelles,
                      CscCountry.Sierra_Leone,
                      CscCountry.Singapore,
                      CscCountry.Slovakia,
                      CscCountry.Slovenia,
                      CscCountry.Solomon_Islands,
                      CscCountry.Somalia,
                      CscCountry.South_Africa,
                      CscCountry.South_Georgia,
                      CscCountry.South_Sudan,
                      CscCountry.Spain,
                      CscCountry.Sri_Lanka,
                      CscCountry.Sudan,
                      CscCountry.Suriname,
                      CscCountry.Svalbard_And_Jan_Mayen_Islands,
                      CscCountry.Swaziland,
                      CscCountry.Sweden,
                      CscCountry.Switzerland,
                      CscCountry.Syria,
                      CscCountry.Taiwan,
                      CscCountry.Tajikistan,
                      CscCountry.Tanzania,
                      CscCountry.Thailand,
                      CscCountry.Togo,
                      CscCountry.Tokelau,
                      CscCountry.Tonga,
                      CscCountry.Trinidad_And_Tobago,
                      CscCountry.Tunisia,
                      CscCountry.Turkey,
                      CscCountry.Turkmenistan,
                      CscCountry.Turks_And_Caicos_Islands,
                      CscCountry.Tuvalu,
                      CscCountry.Uganda,
                      CscCountry.Ukraine,
                      CscCountry.United_Arab_Emirates,
                      CscCountry.United_Kingdom,
                      CscCountry.United_States,
                      CscCountry.United_States_Minor_Outlying_Islands,
                      CscCountry.Uruguay,
                      CscCountry.Uzbekistan,
                      CscCountry.Vanuatu,
                      CscCountry.Vatican_City_State_Holy_See,
                      CscCountry.Venezuela,
                      CscCountry.Vietnam,
                      CscCountry.Virgin_Islands_British,
                      CscCountry.Virgin_Islands_US,
                      CscCountry.Wallis_And_Futuna_Islands,
                      CscCountry.Western_Sahara,
                      CscCountry.Yemen,
                      CscCountry.Zambia,
                      CscCountry.Zimbabwe,
                      CscCountry.Kosovo,
                      CscCountry.Curacao,
                      CscCountry.Sint_Maarten_Dutch_part,
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

                // TextFormField(
                //   cursorColor: Colors.orange,
                //
                //   decoration: InputDecoration(
                //     isDense: true,
                //     contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                //     hintText: 'City',
                //     hintStyle: TextStyle(fontSize: 12),
                //     // labelText: 'Invoice title',
                //     labelStyle: TextStyle(color: Colors.black),
                //     enabledBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(color: page),
                //     ),
                //     focusedBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(color: theme1),
                //     ),
                //   ),
                // ).paddingOnly(bottom: 5.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
