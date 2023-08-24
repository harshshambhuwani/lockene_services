import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../styles/styles.dart';
import '../../account/widgets/profile_widget.dart';
import '../../common/block_button_widget.dart';
import '../../common/ui.dart';
import '../controllers/editprofile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  // final bool hideAppBar;
  //
  // ProfileView({this.hideAppBar = false}) {
  //   // controller.profileForm = new GlobalKey<FormState>();
  // }

  @override
  Widget build(BuildContext context) {
    controller.profileForm = new GlobalKey<FormState>();
    return Scaffold(
        appBar: /*hideAppBar
            ? null
            :*/ AppBar(
                title: Text(
                  "Edit Profile".tr,
                  style: context.textTheme.subtitle1,
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
          primary: true,
          children: [
            Text("Rajat Kumar".tr, style: Get.textTheme.headline5,textAlign:  TextAlign.center,).paddingOnly(top: 25, bottom: 0, right: 22, left: 22),


            // SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
            // ImageUp(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    _bottomsheet(context);
                  },
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: 200,
                        height: 200,
                      ),
                      Container(
                        decoration: Ui.getBoxDecoration(
                          radius: 14,
                          border: Border.all(width: 5, color: Colors.white),
                          color: Colors.black,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CachedNetworkImage(
                                fit: BoxFit.fitWidth,
                                width: 90,
                                height: 90,
                                imageUrl:
                                'https://cdn-icons-png.flaticon.com/512/2482/2482458.png',
                                placeholder: (context, url) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 90,
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error_outline),
                              ),
                            ),
                          ),
                        ),
                      ).paddingOnly(left: 25, top: 25),
                      Positioned(
                        left: 145.5,
                        top: 12.5,
                        child: ClipOval(
                          child: Container(
                            color: Colors.white,
                            width: 30,
                            height: 30,
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),


            Container(

              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: Ui.getBoxDecoration(),
              child: Column(
                children: [
                  AccountLinkWidget(
                    icon: Icon(Icons.person_outline, color: Colors.orange),
                    text:
                    TextFormField(
                      cursorColor: Colors.orange,
                      initialValue: 'Rajat Kumar',
                      style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        hintText: 'Full Name',
                        hintStyle: TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: page),
                        ),
                      ),
                    ),
                    onTap: (e) {
                      // Get.toNamed(Routes.PROFILE);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.phone_android_outlined, color: Colors.orange),
                    text:
                    TextFormField(
                      cursorColor: Colors.orange,
                      initialValue: '9689455261',
                      keyboardType: TextInputType.phone,
                      style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: page),
                        ),
                      ),
                    ),
                    onTap: (e) {
                      // Get.find<RootController>().changePage(0);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.alternate_email, color: Colors.orange),
                    text: TextFormField(
                      cursorColor: Colors.orange,
                      initialValue: 'rajat@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        hintText: 'jhon@gmail.com',
                        hintStyle: TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: page),
                        ),
                      ),
                    ),
                    onTap: (e) {
                      // Get.toNamed(Routes.NOTIFICATIONS);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.location_on, color: Colors.orange),
                    text:TextFormField(
                      cursorColor: Colors.orange,
                      initialValue: 'Duplex No. 60, Lokhvihar Park,Bhilgaon,Nagpur',
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        hintText: 'Full Address',
                        hintStyle: TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: page),
                        ),
                      ),
                    ),
                    /*Text("Duplex No. 60, Lokhvihar Park,Bhilgaon,Nagpur".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),*/
                    onTap: (e) {
                      // Get.find<RootController>().changePage(2);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.key, color: Colors.orange),
                    text:TextFormField(
                      cursorColor: Colors.orange,
                      initialValue: 'Rajat123',
                      // obscureText: controller.hidePassword.value,
                      keyboardType: TextInputType.visiblePassword,                      style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        // contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        hintText: "••••••••••••".tr,
                        hintStyle: TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: page),
                        ),
                        // suffixIcon: IconButton(
                        //   onPressed: () {
                        //     controller.hidePassword.value = !controller.hidePassword.value;
                        //   },
                        //   color: Colors.grey,
                        //   icon: Icon(controller.hidePassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        // ),
                      ),
                    ),
                    /*Text("Duplex No. 60, Lokhvihar Park,Bhilgaon,Nagpur".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),*/
                    onTap: (e) {
                      // Get.find<RootController>().changePage(2);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.home_outlined, color: Colors.orange),
                    text:TextFormField(
                      cursorColor: Colors.orange,
                      initialValue: 'Bank Of India',
                      // obscureText: controller.hidePassword.value,
                      keyboardType: TextInputType.text,                      style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        // contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        hintText: 'Please enter bank name'.tr,
                        hintStyle: TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: page),
                        ),
                        // suffixIcon: IconButton(
                        //   onPressed: () {
                        //     controller.hidePassword.value = !controller.hidePassword.value;
                        //   },
                        //   color: Colors.grey,
                        //   icon: Icon(controller.hidePassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        // ),
                      ),
                    ),
                    /*Text("Duplex No. 60, Lokhvihar Park,Bhilgaon,Nagpur".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),*/
                    onTap: (e) {
                      // Get.find<RootController>().changePage(2);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.numbers_rounded, color: Colors.orange),
                    text:TextFormField(
                      cursorColor: Colors.orange,
                      initialValue: '982450001054',
                      // obscureText: controller.hidePassword.value,
                      keyboardType: TextInputType.phone,                      style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        // contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        hintText: 'Please enter account number'.tr,
                        hintStyle: TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: page),
                        ),
                        // suffixIcon: IconButton(
                        //   onPressed: () {
                        //     controller.hidePassword.value = !controller.hidePassword.value;
                        //   },
                        //   color: Colors.grey,
                        //   icon: Icon(controller.hidePassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        // ),
                      ),
                    ),
                    /*Text("Duplex No. 60, Lokhvihar Park,Bhilgaon,Nagpur".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),*/
                    onTap: (e) {
                      // Get.find<RootController>().changePage(2);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.account_circle_outlined, color: Colors.orange),
                    text:TextFormField(
                      cursorColor: Colors.orange,
                      initialValue: 'Rajat Kumar',
                      // obscureText: controller.hidePassword.value,
                      keyboardType: TextInputType.text,                      style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        // contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        hintText: 'Please enter account holder name'.tr,
                        hintStyle: TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: page),
                        ),
                        // suffixIcon: IconButton(
                        //   onPressed: () {
                        //     controller.hidePassword.value = !controller.hidePassword.value;
                        //   },
                        //   color: Colors.grey,
                        //   icon: Icon(controller.hidePassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        // ),
                      ),
                    ),
                    /*Text("Duplex No. 60, Lokhvihar Park,Bhilgaon,Nagpur".tr,style: TextStyle( color: Colors.black,fontWeight: FontWeight.w500)),*/
                    onTap: (e) {
                      // Get.find<RootController>().changePage(2);
                    },
                  ),
                ],
              ),
            ),


            BlockButtonWidget(
                text: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Update".tr,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline6!.merge(
                          TextStyle(color: page),
                        ),
                      ),
                    ),
                    // Icon(Icons.check, color: page, size: 22)
                  ],
                ),
                color: Colors.orange,
                onPressed: () {



                }).marginSymmetric(horizontal: 20.0).paddingOnly(bottom: 20),
          ],
        ));
  }

  void _bottomsheet(BuildContext context) {
    String text;
    showModalBottomSheet(context: context, isDismissible: true,builder: (context){
      return Container(
        color: Color(0xFF737373),
        height: 120,
        child: Container(
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) {
                            // return CustomDialog();
                            return ImageUp(text = "cam");
                          });
                      // getcam();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_enhance_rounded,size: 40,),
                        SizedBox(height: 10,),
                        Text('Camera',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) {
                            return ImageUp(text ="gal");
                          });
                      // getgall();
                      // Navigator.pop(context);

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image,size: 40,),
                        SizedBox(height: 10,),
                        Text('Gallery',style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  )
              ),

            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
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

}

class ImageUp extends StatefulWidget {
  final String text;
  ImageUp(this.text);

  @override
  State<ImageUp> createState() => _ImageUpState();
}

class _ImageUpState extends State<ImageUp> {

  File? file;
  ImagePicker imagePicker = ImagePicker();
  getcam() async{
    var img = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }
  getgall() async{
    var img = await imagePicker.getImage(source: ImageSource.gallery);
    // wpart = File(img!.path);
    setState(() {
      file = File(img!.path);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    print(widget.text.toString());
    if(widget.text.toString()=="cam"){

      getcam();
      // Navigator.pop(context);


    }else if(widget.text.toString()=="gal"){
      getgall();
      // Navigator.pop(context);

    }
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        // title: Text('Update Status'),
        content: Container(
          width: size.width * 0.9,
          child: Column(children: [
            // Container(
            //     height: size.width *0.4,
            //     width: size.width *0.4,
            //     // child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_sjeuhlxx.json')
            //
            // ),
            // Text('Registration Successful'.tr,
            //   style: TextStyle(
            //       color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0,left: 20,right: 20,top: 20),
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Profile Photo',style: Get.textTheme.bodyText1,
                            textAlign: TextAlign.start,),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                              Navigator.pop(context);
                            },
                            child: Text('Cancel',style: Get.textTheme.bodyText1,
                              textAlign: TextAlign.start,),
                          ),
                        ],
                      )),
                ),
                file == null ? Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        // process = "proof";
                        // _bottomsheet(context,process);
                      },
                      child:  Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.image,size: 30,),
                            Text('Add Image',style: TextStyle(fontSize: 14),)
                          ],
                        ).paddingSymmetric(horizontal: 20,vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade400
                        ),
                      ).paddingSymmetric(horizontal: 20),
                    ),
                  ],
                ): Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                        child:  Image.file(
                          file!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
              Navigator.pop(context);
              // Get.offAndToNamed(Routes.ADLOGIN);

              // Get.back();
            }
              , child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                child: Text('Upload',style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16)),
              ),
              style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.orange),
            ).marginOnly(bottom: 20.0,top: 8.0),

          ],),
        )
    );

  }
}
