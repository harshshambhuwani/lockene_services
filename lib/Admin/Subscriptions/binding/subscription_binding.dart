import 'package:get/get.dart';
import 'package:service/Admin/Subscriptions/controller/mysubscription_controller.dart';
import 'package:service/Admin/Subscriptions/controller/subscriptionhistory_controller.dart';

import '../../Registration/controller/regist_controller.dart';
import '../controller/subscription_controller.dart';


class SubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionController>(
      () =>SubscriptionController(),
    );
    Get.lazyPut<MySubscriptionController>(
      () =>MySubscriptionController(),
    );
    Get.lazyPut<SubscriptionHistoryController>(
      () =>SubscriptionHistoryController(),
    );
  }
}
