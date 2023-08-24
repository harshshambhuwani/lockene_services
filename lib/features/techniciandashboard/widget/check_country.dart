import 'package:country_list_pick/country_list_pick.dart';
// import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';

class CheckCountry extends StatefulWidget {
  const CheckCountry({Key? key}) : super(key: key);

  @override
  State<CheckCountry> createState() => _CheckCountryState();
}

class _CheckCountryState extends State<CheckCountry> {
  String? valueChoose;
  List listItem = [
    'Approve Quote',
    'Reject Quote',
    'Draft Quote',
  ];
  var process;
  var countrytxt;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();


    return AlertDialog(
      scrollable: true,

      contentPadding: EdgeInsets.zero,
      title: Text('Please choose your country'),
      content: Container(
        width: size.width * 0.9,
        // height: size.height * 0.4,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryListPick(
                    appBar: AppBar(
                      backgroundColor: Colors.blue,
                      title: Text('Please choose your country'),
                    ),

                    // if you need custome picker use this
                    pickerBuilder: (context, CountryCode? countryCode){
                      return Column(
                        children: [
                          Container(
                            height:size.height*0.2,
                            child: Image.asset(
                              countryCode!.flagUri!,
                              package: 'country_list_pick',

                            ).paddingOnly(bottom: 20,top: 20.0),
                          ),
                          // Align(
                          //     alignment : Alignment.centerLeft,
                          //     child: Text(countryCode.dialCode!,style: TextStyle(color: Colors.black),)),
                          Text(countryCode.name!,style: TextStyle(color: Colors.orange,fontSize: 22),),
                        ],
                      );
                    },

                    // To disable option set to false
                    theme: CountryTheme(
                      labelColor: Colors.white24,
                      alphabetSelectedTextColor: Colors.white,
                      alphabetSelectedBackgroundColor: Colors.green,
                      isShowFlag: true,
                      isShowTitle: true,
                      isShowCode: true,
                      isDownIcon: true,
                      showEnglishName: true,
                    ),
                    // Set default value
                    // initialSelection: '+1',
                    // or
                    initialSelection: 'US',
                    onChanged: (CountryCode?code) {
                      print(code!.name);
                      print(code.code);
                      print(code.dialCode);
                      print(code.flagUri);

                      setState(() {
                        // code.name! = countrytxt;
                      });
                    },
                    // Whether to allow the widget to set a custom UI overlay
                    useUiOverlay: true,
                    // Whether the country list should be wrapped in a SafeArea
                    useSafeArea: true
                ),
              ],
            ).paddingSymmetric(horizontal: 8.0),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Get.toNamed(Routes.ADD_KYC);
                // controller!.statusUpdated(showMessage: true);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 25.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Text(
                    'Submit',
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


