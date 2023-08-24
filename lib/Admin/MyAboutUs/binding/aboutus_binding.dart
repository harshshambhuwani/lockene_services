import 'package:get/get.dart';

import '../../Registration/controller/regist_controller.dart';
import '../controller/aboutus_controller.dart';


class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutUsController>(
      () =>AboutUsController(),
    );
  }
}
