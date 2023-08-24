import 'package:get/get.dart';

import '../controller/addtax_controller.dart';
import '../controller/edittax_controller.dart';



class AddTaxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaxController>(
      () => AddTaxController(),
    );
    Get.lazyPut<EditTaxController>(
      () => EditTaxController(),
    );


  }
}
