import 'package:get/get.dart';

import '../../Registration/controller/regist_controller.dart';
import '../controller/payment_controller.dart';


class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
  }
}
