import 'package:get/get.dart';

import '../../common/ui.dart';



class ReviewController extends GetxController {

  @override
  void onReady() async {
    await refreshReview();
    super.onReady();
  }

  Future refreshReview({bool showMessage = false}) async {
    await getReview();
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "Reviews refreshed successfully".tr));
    }
  }

  Future getReview() async {
    try {
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}
