import 'package:get/get.dart';

import '../../Registration/controller/regist_controller.dart';
import '../controller/editmember_controller.dart';
import '../controller/emp_profile_controller.dart';
import '../controller/emp_report_controller.dart';


class EmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeProfileController>(
      () => EmployeeProfileController(),
    );
    Get.lazyPut<EmployeeReportController>(
      () => EmployeeReportController(),
    );
    Get.lazyPut<EditMemberController>(
      () => EditMemberController(),
    );
  }
}
