import 'package:get/get.dart';

import '../controller/addinvoice_controller.dart';
import '../controller/editinvoice_controller.dart';



class AddInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddInvoiceController>(
      () => AddInvoiceController(),
    );
    Get.lazyPut<EditInvoiceController>(
      () => EditInvoiceController(),
    );

  }
}
