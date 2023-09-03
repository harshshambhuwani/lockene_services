import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:service/Admin/session/session.dart';
import 'package:service/features/profile/views/edit_teamprofile_view.dart';
import 'package:service/network/api_interface.dart';

import '../../../styles/styles.dart';
import '../../account/widgets/profile_widget.dart';
import '../../common/block_button_widget.dart';
import '../../common/text_field_widget.dart';
import '../../common/ui.dart';
import '../../../routes/app_routes.dart';
import '../controllers/profile_controller.dart';
import '../widgets/delete_account_widget.dart';
import '../widgets/image_field_widget.dart';
import '../widgets/phone_field_widget.dart';

class ProfileView extends StatefulWidget {
  String? userName;
  int? phoneNumber;
  String? userEmailAddress;
  String? userAddress;
  String? userTokenValue;
  int? userIdValue;

  ProfileView({
    Key? key,
    this.userName,
    this.phoneNumber,
    this.userEmailAddress,
    this.userAddress,
    this.userTokenValue,
    this.userIdValue,
  }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ApiInterface().getProfileInformation(userToken,useId.toString()).then((value) => {
    //   // if(value.status == "1"){
    //   //   name = value.data?.tspFname.toString() ?? "",
    //   //   phoneNumber = value.data?.tspFname.toString() ?? "",
    //   //   emailId = value.data?.tspFname.toString() ?? "",
    //   //   userAddress = value.data?.tspFname.toString() ?? "",
    //   // }
    // });
  }

  @override
  Widget build(BuildContext context) {
    ///  controller.profileForm = GlobalKey<FormState>();
    return Scaffold(
        // appBar: hideAppBar
        //     ? null
        //     :
        appBar: AppBar(
          title: Text(
            "My Profile".tr,
            style: context.textTheme.subtitle1,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
          actions: [
            InkWell(
                onTap: () {
                //  Get.toNamed(Routes.EDITPROFILE);
                  Get.to( EditProfileView(userName : widget.userName,phoneNumber : widget.phoneNumber,emailAddress : widget.userEmailAddress,userAddress : widget.userAddress,userId : widget.userIdValue,userTokenValue : widget.userTokenValue));
                },
                child: Row(
                  children: [
                    Text('Edit',
                        style: context.textTheme.subtitle1!.merge(
                          const TextStyle(color: Colors.black),
                        )),
                    const Icon(
                      Icons.edit,
                      size: 18,
                      color: Colors.black,
                    ).paddingOnly(left: 5.0)
                  ],
                ).paddingSymmetric(horizontal: 20, vertical: 20))
          ],
        ),
        body: ListView(
          primary: true,
          children: [
            Text(
              widget.userName.toString(),
              style: Get.textTheme.headline5,
              textAlign: TextAlign.center,
            ).paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                              const Icon(Icons.error_outline),
                        ),
                      ),
                    ),
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
                    text: Text(
                      widget.userName.toString(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    onTap: (e) {
                      // Get.toNamed(Routes.PROFILE);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.phone_android_outlined,
                        color: Colors.orange),
                    text: Text(widget.phoneNumber.toString(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.find<RootController>().changePage(0);
                    },
                  ),
                  AccountLinkWidget(
                    icon: Icon(Icons.alternate_email, color: Colors.orange),
                    text: Text(widget.userEmailAddress.toString(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.toNamed(Routes.NOTIFICATIONS);
                    },
                  ),
                  AccountLinkWidget(
                    icon: const Icon(Icons.location_on, color: Colors.orange),
                    text: Text(widget.userAddress.toString(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    onTap: (e) {
                      // Get.find<RootController>().changePage(2);
                    },
                  ),
                ],
              ),
            ),
            BlockButtonWidget(
                text: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Complete KYC".tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headline6!.merge(
                      TextStyle(color: page),
                    ),
                  ),
                ),
                color: Colors.grey,
                onPressed: () {
                  // ADD_KYC
                  Get.toNamed(Routes.ADD_KYC);
                }).marginSymmetric(horizontal: 20.0, vertical: 10),
          ],
        ));
  }

  Future<String> getSessionData() async {
    return await SessionManager().get(SessionDataKey().tspLoginToken);
  }

  Future<int> getUserId() async {
    return await SessionManager().get(SessionDataKey().userId);
  }
}
