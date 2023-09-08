import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service/Admin/session/session.dart';
import 'package:service/network/api_interface.dart';
import '../../../styles/styles.dart';
import '../../account/widgets/profile_widget.dart';
import '../../common/block_button_widget.dart';
import '../../common/ui.dart';

class EditProfileView extends StatefulWidget {
  String? userName;
  int? phoneNumber;
  String? emailAddress;
  String? userAddress;
  int? userId;
  String? userTokenValue;

  EditProfileView(
      {Key? key,
      this.userName,
      this.phoneNumber,
      this.emailAddress,
      this.userAddress,
      this.userId,
      this.userTokenValue})
      : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String userToken = "";
  int? userId;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController.text = widget.userName.toString();
    mobileNumberController.text = widget.phoneNumber.toString();
    emailController.text = widget.emailAddress.toString();
    addressController.text = widget.userAddress.toString();
    getTokenFromSession();
  }



  @override
  Widget build(BuildContext context) {
    //  controller.profileForm = new GlobalKey<FormState>();
    return Scaffold(
        appBar: /*hideAppBar
            ? null
            :*/
            AppBar(
          title: Text(
            "Edit Profile".tr,
            style: context.textTheme.subtitle1,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading:  IconButton(
            icon:  Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
        ),
        body: ListView(
          primary: true,
          children: [
            Text(
              widget.userName.toString(),
              style: Get.textTheme.headline5,
              textAlign: TextAlign.center,
            ).paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: Ui.getBoxDecoration(),
              child: Column(
                children: [
                  AccountLinkWidget(
                    icon: Icon(Icons.person_outline, color: Colors.orange),
                    text: TextFormField(
                      cursorColor: Colors.orange,
                      //initialValue: widget.userName.toString(),
                      controller: fullNameController,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
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
                    icon: const Icon(Icons.phone_android_outlined,
                        color: Colors.orange),
                    text: TextFormField(
                      cursorColor: Colors.orange,
                      controller: mobileNumberController,
                     // initialValue: widget.phoneNumber.toString(),
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: const TextStyle(color: Colors.black),
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
                    icon: const Icon(Icons.alternate_email, color: Colors.orange),
                    text: TextFormField(
                      cursorColor: Colors.orange,
                      controller: emailController,
                     // initialValue: widget.emailAddress.toString(),
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                        hintText: 'jhon@gmail.com',
                        hintStyle: const TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: const TextStyle(color: Colors.black),
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
                    icon: const Icon(Icons.location_on, color: Colors.orange),
                    text: TextFormField(
                      cursorColor: Colors.orange,
                      controller: addressController,
                    //  initialValue: widget.userAddress.toString(),
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                        hintText: 'Full Address',
                        hintStyle: const TextStyle(fontSize: 14),
                        // labelText: 'Invoice title',
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: page),
                        ),
                      ),
                    ),
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
                      print("fromOnTap");
                      if(fullNameController.text == ""){
                        showToast("Please enter the full name");
                      }else if(mobileNumberController.text == ""){
                        showToast("Please enter mobile");
                      }else if(emailController.text == ""){
                        showToast("Please enter your email address");
                      } else if (!validateMailField(
                          emailController.text.toString())) {
                        showToast("Email is Incorrect");
                      }else if(addressController.text == ""){
                        showToast("Address is Empty");
                      }else {
                        ApiInterface().updateProfileInformation(userToken,fullNameController.text,mobileNumberController.text,emailController.text,addressController.text,userId.toString());
                        //     .then((value) => {
                        //   if(value.status == "1"){
                        //     showToast(value.message.toString()),
                        //   }else{
                        //     showToast("Something went wrong"),
                        //   }
                        //  // print("fromApiInter $value"),
                        // });
                      }




                    })
                .marginSymmetric(horizontal: 20.0)
                .paddingOnly(bottom: 20),
          ],
        ));
  }

  void _bottomsheet(BuildContext context) {
    String text;
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        builder: (context) {
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
                        onTap: () {
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
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (_) {
                                return ImageUp(text = "gal");
                              });
                          // getgall();
                          // Navigator.pop(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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

  void getTokenFromSession() {
    getUserToken().then((value) => {
      setState(() {
        userToken = value.toString();
      }),
    });
    getUserId().then((value) => {
      setState(() {
        userId = value;
        print("fromUseRID ${userId}");
      }),
    });

  }

  Future<String> getUserToken() async {
    return await SessionManager().get(SessionDataKey().tspLoginToken);
  }
  Future<int> getUserId() async {
    return await SessionManager().get(SessionDataKey().userId);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }

  bool validateMailField(String userInput) {
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(userInput)) {
      return false;
    } else {
      return true;
    }
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

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    print(widget.text.toString());
    if (widget.text.toString() == "cam") {
      getcam();
      // Navigator.pop(context);
    } else if (widget.text.toString() == "gal") {
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
          child: Column(
            children: [
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
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 20, right: 20, top: 20),
                    child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile Photo',
                              style: Get.textTheme.bodyText1,
                              textAlign: TextAlign.start,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: Get.textTheme.bodyText1,
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
                                // process = "proof";
                                // _bottomsheet(context,process);
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 30,
                                    ),
                                    Text(
                                      'Add Image',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ).paddingSymmetric(
                                    horizontal: 20, vertical: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade400),
                              ).paddingSymmetric(horizontal: 20),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Center(
                                child: Image.file(
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
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                  // Get.offAndToNamed(Routes.ADLOGIN);

                  // Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  child: Text('Upload',
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
