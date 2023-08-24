import 'package:get/get.dart';

import '../controller/addlineitem_controller.dart';
import '../controller/allline_controller.dart';
import '../controller/editlineitem_controller.dart';



class AllLineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllLineController>(
      () => AllLineController(),
    );
    Get.lazyPut<AddLineitemController>(
      () => AddLineitemController(),
    );
    Get.lazyPut<EditAddLineitemController>(
      () => EditAddLineitemController(),
    );

  }
}
