import 'package:get/get.dart';

import '../controllers/manageprod_controller.dart';


class ProductManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageProductController>(
      () => ManageProductController(),
    );

  }
}
