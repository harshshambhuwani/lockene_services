import 'package:get/get.dart';

import '../controller/notif_controller.dart';



class MyNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyNotificationController>(
      () => MyNotificationController(),
    );


  }
}
