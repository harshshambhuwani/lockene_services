import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/ui.dart';

class AllQuoteController extends GetxController{

  int _value = 1;
  final isLoading = true.obs;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    await refreshDetails();
    super.onReady();
  }


  Future refreshDetails({bool showMessage = false}) async {
    await getReviews();
    if (showMessage) {

      Get.showSnackbar(Ui.SuccessSnackBar(message:"My Quote refreshed successfully".tr));

    }
  }

  Future getReviews() async {
    try {
      // reviews.assignAll(await _eProviderRepository!.getReviews(Get.find<AuthService>().user.value.id!));
      // totalReviews.value = reviews.length;
      // rate.value = reviews.map((element) => element.rate).reduce((value, element) => value! + element!) !/ reviews.length;

    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getUpdateFilter() async {

    await RadioListTile(
      title: Text(
        'Price : Low to High',
        style: TextStyle(
            fontSize: 14.0,
            color: Colors.black),
      ),
      value: 1,
      groupValue: _value,
      onChanged: (value) {
            _value = value as int;
            print("hi 1");
      },
      controlAffinity:
      ListTileControlAffinity.trailing,
    );

  }

  // void getUpdate() {
  //    setState(() {});
  // }

  
  
}


