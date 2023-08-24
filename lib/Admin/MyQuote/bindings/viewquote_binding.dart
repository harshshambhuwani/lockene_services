import 'package:get/get.dart';

import '../controller/allquote_controller.dart';
import '../controller/invoice_review_controller.dart';
import '../controller/invoicesend_controller.dart';
import '../controller/invoiceview_controller.dart';
import '../controller/jobview_controller.dart';
import '../controller/viewquote_controller.dart';



class ViewQuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewQuoteController>(
      () => ViewQuoteController(),
    );
    Get.lazyPut<AllQuoteController>(
      () => AllQuoteController(),
    );
    Get.lazyPut<JobViewController>(
      () => JobViewController(),
    );
    Get.lazyPut<ViewInvoiceController>(
      () => ViewInvoiceController(),
    );
    Get.lazyPut<SendInvoiceController>(
      () => SendInvoiceController(),
    );
    Get.lazyPut<ReviewInvoiceController>(
      () => ReviewInvoiceController(),
    );


  }
}
