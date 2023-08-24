import 'package:get/get.dart';

import '../controller/addmember_controller.dart';
import '../controller/addsuccess_controller.dart';



class AddMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMemberController>(
      () => AddMemberController(),
    );
    Get.lazyPut<AddSuccessController>(
      () => AddSuccessController(),
    );

  }
}
