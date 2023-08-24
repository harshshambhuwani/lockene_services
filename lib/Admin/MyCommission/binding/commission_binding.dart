import 'package:get/get.dart';

import '../../Registration/controller/regist_controller.dart';
import '../controller/commission_controller.dart';


class CommissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommissionController>(
      () =>CommissionController(),
    );
  }
}
