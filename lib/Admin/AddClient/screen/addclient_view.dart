import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/features/profile/widgets/phone_field_widget.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../features/common/text_field_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/addclient_controller.dart';



class AddClientView extends GetView<AddClientController>{

  final arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    controller.loginFormKey = new GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Client".tr,
            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
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

              Obx(() {
                if (controller.loading.isTrue) {
                  return CircularLoadingWidget(height: 300);
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Get.toNamed(Routes.MY_CONTACT);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // background color
                            onPrimary: Colors.white, // text color
                            elevation: 5, // button's elevation
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // button's border radius
                              side: BorderSide(color: Colors.orange), // button's border color
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.account_circle_outlined,color: Colors.orange,),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text("Add From Contacts",
                                    style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.orange)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),




                      TextFieldWidget(
                        labelText: "Full Name".tr,
                        hintText: "Sanket Kumar".tr,
                        // initialValue: (controller.currentUser.value.name)!,
                        // onSaved: (input) => controller.currentUser.value.name = input,
                        validator: (input) => input!.length < 3 ? "Should be more than 3 characters".tr : null,
                        iconData: Icons.person_outline,
                        isFirst: true,
                        isLast: false,
                      ),
                      TextFieldWidget(
                        labelText: "Email Address".tr,
                        hintText: "sanket@gmail.com".tr,
                        // initialValue: (controller.currentUser.value.email)!,
                        // onSaved: (input) => controller.currentUser.value.email = input,
                        validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
                        iconData: Icons.alternate_email,
                        isFirst: false,
                        isLast: false,
                      ),
                      PhoneFieldWidget(
                        labelText: "Phone Number".tr,
                        hintText: "000 000 0000".tr,
                        // initialCountryCode: (controller.currentUser.value.getPhoneNumber().countryISOCode),
                        // initialValue: (controller.currentUser.value.getPhoneNumber().number),
                        onSaved: (phone) {
                          // return controller.currentUser?.value?.phoneNumber = phone.completeNumber;
                          // return controller.currentUser.value.phoneNumber = phone!.completeNumber;
                        },
                        isLast: false,
                        isFirst: false,
                      ),
                      Drop(),
                      // GetHours(),
                      // Drop(),
                      // PhoneFieldWidget(
                      //   labelText: "Phone Number".tr,
                      //   hintText: "000 000 0000".tr,
                      //   // initialCountryCode: (controller.currentUser.value.getPhoneNumber().countryISOCode),
                      //   // initialValue: (controller.currentUser.value.getPhoneNumber().number),
                      //   onSaved: (phone) {
                      //     // return controller.currentUser?.value?.phoneNumber = phone.completeNumber;
                      //     // return controller.currentUser.value.phoneNumber = phone!.completeNumber;
                      //   },
                      //   isLast: false,
                      //   isFirst: false,
                      // ),

                    ],
                  );
                }
              }),

              // Row(
              //   // crossAxisAlignment: WrapCrossAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Image.network('https://cdn-icons-png.flaticon.com/512/9720/9720868.png',scale: 24,color: Colors.blue,),
              //     Expanded(
              //         child: Text('The salary is calculated based on daily attendence status Present/Absent.The salary will not be calculated for a week off or holiday.',textDirection: TextDirection.ltr,maxLines: 7,).paddingOnly(left: 5.0)),
              //   ],
              // ).paddingSymmetric(horizontal: 20.0,vertical: 10),

              BlockButtonWidget(
                onPressed: () {
                  if(arg.toString()=="add"){
                    Get.back();

                  }else{
                    Get.offAndToNamed(Routes.SUCCESS_MEMBER);
                  }
                },
                color: Colors.orange,
                text: Text(
                  "Submit".tr,
                  style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
                ),
              ).paddingOnly(top:15,bottom:25,right: 20,left: 20),
            ],
          ),
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
                  BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                ],
                border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Text('Working Time',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,)),
                Row(
                  children: [
                    Icon(Icons.apartment_outlined,color: Colors.grey.shade500,),
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
                            valueChoose = newValue as String?;

                            setState(() {
                              print(valueChoose);


                            });
                          }).marginOnly(left: 14.0,right: 0.0,top: 0.0,bottom: 0),
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
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                ],
                border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Full Address',style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.start,),
                  ],
                ).paddingOnly(bottom: 10.0),
                Row(
                  children: [
                    // Icon(Icons.home,color: Colors.grey.shade500,).marginOnly(right: 14),
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/3203/3203071.png',color: Colors.grey.shade500,),
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
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/3203/3203071.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Address Line 2',
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
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/2942/2942076.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'City',
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
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/5042/5042691.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'State',
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
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Icon(Icons.numbers,color: Colors.grey.shade500,)
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Postal Code',
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
                Row(
                  children: [
                    Container(
                      width: Get.height * 0.025,
                      height: Get.height * 0.025,
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/44/44386.png',color: Colors.grey.shade500,),
                    ).paddingOnly(right: 14.0),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          hintText: 'Country',
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
                ).paddingOnly(bottom: 10.0),

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

