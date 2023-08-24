import 'package:get/get.dart';

import '../../Registration/controller/regist_controller.dart';
import '../controller/companydetails_controller.dart';


class RegistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistController>(
      () => RegistController(),
    );
    Get.lazyPut<CompanyController>(
      () => CompanyController(),
    );
  }
}
