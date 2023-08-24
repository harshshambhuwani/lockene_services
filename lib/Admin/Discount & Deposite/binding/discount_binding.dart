import 'package:get/get.dart';

import '../controller/deposite_controller.dart';
import '../controller/discount_controller.dart';




class DiscountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscountController>(
      () => DiscountController(),
    );
    Get.lazyPut<DepositeController>(
      () => DepositeController(),
    );

  }
}
