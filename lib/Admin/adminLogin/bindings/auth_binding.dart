import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../../Registration/controller/regist_controller.dart';


class AuthADBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthADController>(
      () => AuthADController(),
    );
  }
}
