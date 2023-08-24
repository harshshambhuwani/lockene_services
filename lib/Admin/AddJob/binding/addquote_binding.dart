import 'package:get/get.dart';

import '../controller/addjob_controller.dart';
import '../controller/editjob_controller.dart';



class AddJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddJobController>(
      () => AddJobController(),
    );
    Get.lazyPut<EditJobController>(
      () => EditJobController(),
    );

  }
}
