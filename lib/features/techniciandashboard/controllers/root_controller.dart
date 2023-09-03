/*
 * Copyright (c) 2020 .
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../account/views/account_view.dart';
import '../../home/views/home_view.dart';
import '../../reviews/views/reviews_view.dart';
import '../../../routes/app_routes.dart';



class RootController extends GetxController {
  final currentIndex = 0.obs;
  final notificationsCount = 0.obs;
  final RxBool isDrawerOpen = false.obs;

  // final customPages = <CustomPage>[].obs;
  // NotificationRepository? _notificationRepository;
  // CustomPageRepository? _customPageRepository;

  // RootController() {
  //   _notificationRepository = new NotificationRepository();
  //   _customPageRepository = new CustomPageRepository();
  // }
  final arg = Get.arguments;

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  void closeDrawer() {
    isDrawerOpen.value = false;
  }
  @override
  void onInit() {
    super.onInit();
    // Initialize your controller's state here
    if (Get.arguments != null && Get.arguments is int) {
      changePageInRoot(Get.arguments as int);
    } else {
      changePageInRoot(0);
    }
    super.onInit();
    print(arg);
  }

  // @override
  // void onInit() async {
  //   // await getCustomPages();
  //
  // }

  List<Widget> pages = [
    HomeView(),
    ReviewsView(),
    const AccountView(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  /**
   * change page in route
   * */
  void changePageInRoot(int _index) {
    currentIndex.value = _index;
  }

  void changePageOutRoot(int _index) {
    currentIndex.value = _index;
    Get.offNamedUntil(Routes.ROOT, (Route route) {
      if (route.settings.name == Routes.ROOT) {
        return true;
      }
      return false;
    }, arguments: _index);
  }

  Future<void> changePage(int _index) async {
    if (Get.currentRoute == Routes.ROOT) {
      changePageInRoot(_index);
    } else {
      changePageOutRoot(_index);
    }
    await refreshPage(_index);
  }

  Future<void> refreshPage(int _index) async {
    switch (_index) {
      // case 0:
      //   {
      //     await Get.find<HomeController>().refreshHome();
      //     break;
      //   }
      // case 2:
      //   {
      //     await Get.find<MessagesController>().refreshMessages();
      //     break;
      //   }
    }
  }

  // void getNotificationsCount() async {
  //   notificationsCount.value = await _notificationRepository!.getCount();
  // }
  //
  // Future<void> getCustomPages() async {
  //   customPages.assignAll(await _customPageRepository!.all());
  // }


}
