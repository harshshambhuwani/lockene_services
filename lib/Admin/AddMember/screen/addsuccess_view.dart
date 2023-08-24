import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:service/Admin/AddMember/controller/addsuccess_controller.dart';


import 'package:service/features/profile/widgets/phone_field_widget.dart';
import 'package:share_plus/share_plus.dart';

import '../../../features/common/block_button_widget.dart';
import '../../../features/common/circular_loading_widget.dart';
import '../../../features/common/text_field_widget.dart';
import '../../../features/common/ui.dart';
import '../../../routes/app_routes.dart';
import '../../../styles/styles.dart';
import '../controller/addmember_controller.dart';



class AddSuccessView extends GetView<AddSuccessController>{


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    controller.loginFormKey = new GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Employee Activation".tr,
            style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500)),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () async {
            Get.back();
            },
          ),
        ),
        body: ListView(
          primary: true,
          children: [

            Icon(Icons.check_circle,size: 65,color: Colors.green,),
            Container(
              alignment: Alignment.center,
              child: Text('Congratulations',
                style: Get.textTheme.headline6!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.green,)),
              ),
            ).paddingOnly(top: 10,bottom: 5.0),
            Container(
              alignment: Alignment.center,
              child: Text('Employee has been created',
                style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.green,)),
              ),
            ).paddingOnly(bottom: 5.0),
            Text('Share below instructions with the employee to resume there work').paddingSymmetric(horizontal: 20.0),
            Container(
              height: 1,
              color: Colors.grey,
            ).marginSymmetric(horizontal: 20.0,vertical: 20),
            Text('Ask Employee to Follow Below Steps',
              style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black,)),
            ).paddingSymmetric(horizontal: 20.0),

            Column(
              children: [
                Row(children: [
                  Icon(Icons.cloud_download_outlined),
                  Text('Step 1 : Download App',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black,)),
                       ).paddingSymmetric(horizontal: 10.0,vertical: 5.0),
                ],),
                Text('Share below instructions with the employee to resume there work').paddingOnly(left: 35.0),

                InkWell(
                  onTap: (){
                    var String = "https://play.google.com/store/apps/details?id=com.prosolstech.mistrichacha_partnerhttps:factotime.page.link/4gGz";
                    Clipboard.setData(ClipboardData(text: String));
                    print(String);
                    Get.showSnackbar(Ui.SuccessSnackBar(message: "Successfully copied"));

                  },
                  child: Row(
                    children: [
                      Expanded(flex: 15,
                        child:Wrap(children: [
                          Text('https://play.google.com/store/apps/details?id=com.prosolstech.mistrichacha_partnerhttps:factotime.page.link/4gGz',style: TextStyle(color: Colors.blue),)
                        ],).paddingOnly(left: 35.0,top: 10.0,right:15.0)),

                      Expanded(
                          flex:1,child:
                      Icon(Icons.copy).paddingOnly(top: 10.0))
                    ],
                  ),
                ),
                
                Row(children: [
                  Icon(Icons.person_outline_sharp),
                  Text('Step 2 : Login Credentials',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black,)),
                  ).paddingSymmetric(horizontal: 10.0),
                ],).marginOnly(top: 15.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Ask employee to login with below credentials').paddingOnly(left: 35,top: 5.0,bottom: 10.0),
                ),
               Column(
                 children: [
                   Container(
                       alignment: Alignment.topLeft,
                       child: Text('Mobile Number',style: TextStyle(color: Colors.blue),)),
                   Container(
                       alignment: Alignment.topLeft,
                       child: Text('9689455261',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)),
                 ],
               ).paddingOnly(left: 35.0,top: 5.0),
               Column(
                 children: [
                   Container(
                       alignment: Alignment.topLeft,
                       child: Text('Password',style: TextStyle(color: Colors.blue),)),
                   Container(
                       alignment: Alignment.topLeft,
                       child: Text('sxsAsx',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)),
                 ],
               ).paddingOnly(left: 35.0,top: 5.0),
                Row(children: [
                  Icon(Icons.location_on_outlined),
                  Text('Step 3 : Punch',
                    style: Get.textTheme.subtitle1!.merge(TextStyle(fontWeight: FontWeight.w500,color: Colors.black,)),
                  ).paddingSymmetric(horizontal: 10.0),
                ],).marginOnly(top: 10.0,bottom: 5.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Ask employee to punch daily on time').paddingOnly(left: 35),
                ),
              ],
            ).paddingOnly(left: 20.0,right: 20.0,top: 10.0),

            FloatingActionButton.extended(
              label: Text('Share with Employee'), // <-- Text
              backgroundColor: Colors.orange,
              icon: Icon( // <-- Icon
                Icons.send,
                size: 24.0,
              ),
              onPressed: () async {
                final url ='https://play.google.com/store/apps/details?id=com.prosolstech.mistrichacha_partner';
                await Share.share('Congratulations your Employee Id has been genrated please download the application from belows url \n ${url}  \n Login Credentials \n Mobile Number \n 9689455261 \n Password \n sxsAsx \n And start working with us by daily punching on time to mark attendence.');
                // Get.back();
                //     Get.showSnackbar(Ui.ErrorSnackBar(message: "Currently we are working on its functionality"));

              },
            ).paddingOnly(left: 20.0,right: 20.0,top: 20.0),

            // BlockButtonWidget(
            //   onPressed: () {
            //   },
            //   color: Colors.orange,
            //   text: Text(
            //     "Submit".tr,
            //     style: Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
            //   ),
            // ).paddingOnly(top:15,bottom:25,right: 20,left: 20),
          ],
        ),

      ),
    );
  }
}




