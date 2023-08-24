import 'package:get/get.dart';

import '../controllers/allteam_controller.dart';
import '../controllers/specificmember_controller.dart';


class AllMembBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTeamMembController>(
      () => AllTeamMembController(),
    );
    Get.lazyPut<SpecificMembController>(
      () => SpecificMembController(),
    );

  }
}
