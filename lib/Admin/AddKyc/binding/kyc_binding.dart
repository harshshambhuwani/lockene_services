import 'package:get/get.dart';

import '../controller/kyc_controller.dart';


class KycBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KycController>(
      () => KycController(),
    );

  }
}
