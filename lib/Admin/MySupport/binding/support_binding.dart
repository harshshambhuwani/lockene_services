import 'package:get/get.dart';

import '../../Registration/controller/regist_controller.dart';
import '../controller/asksupport_controller.dart';
import '../controller/support_controller.dart';


class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportController>(
      () =>SupportController(),
    );
    Get.lazyPut<AskQueryController>(
      () =>AskQueryController(),
    );
  }
}
