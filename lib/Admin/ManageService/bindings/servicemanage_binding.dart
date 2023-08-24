import 'package:get/get.dart';

import '../controllers/manageservice_controller.dart';


class ManageServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageServiceController>(
      () => ManageServiceController(),
    );

  }
}
