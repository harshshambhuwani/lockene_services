import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:service/features/techniciandashboard/widget/main_drawer_widget.dart';
import '../../../styles/styles.dart';
import '../../common/custom_bottom_nav_bar.dart';
import '../../common/main_drawer_widget.dart';
import '../../technician/screen/login.dart';
import '../../technician/service/auth_controller.dart';
import '../controllers/root_controller.dart';



class TechDash extends GetView<RootController> {

  final arg = Get.arguments;
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final RootController drawerController = Get.put(RootController());



  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: GlobalKey<ScaffoldState>(),
        drawer:arg.toString()=="team"?
        MainDrawerWidget():AdminDrawerWidget(),
        body:  WillPopScope(
          onWillPop: () async {
            if (drawerController.isDrawerOpen.value) {
              drawerController.closeDrawer();
              return false;
            }
            return true;
          },
          child: controller.currentPage,

        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.colorScheme.secondary,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePage(index);
          },
          children: [
            CustomBottomNavigationItem(
              icon: Icons.home_outlined,
              label: "Home".tr, color: Colors.orange.shade700,
            ),
            CustomBottomNavigationItem(
              icon: Icons.star_border,
              label: "Reviews".tr,color: Colors.orange.shade700,
            ),
            CustomBottomNavigationItem(
              icon: Icons.widgets_outlined,
              label: "More".tr,color: Colors.orange.shade700,
            ),
            // CustomBottomNavigationItem(
            //   icon: Icons.person_outline,
            //   label: "Account".tr,color: Colors.orange.shade300,
            // ),
          ],
        ),
      );
    });
  }
}
