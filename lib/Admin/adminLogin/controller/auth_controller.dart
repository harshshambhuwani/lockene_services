import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/common/ui.dart';
import '../../../features/techniciandashboard/screen/techdashboard.dart';
import '../../../routes/app_routes.dart';


class AuthADController extends GetxController {
  // final Rx<User> currentUser = Get.find<AuthService>().user;
  late GlobalKey<FormState> loginFormKey;
  // late GlobalKey<FormState> registerFormKey;
  late GlobalKey<FormState> forgotPasswordFormKey;
  final hidePassword = true.obs;
  final loading = false.obs;
  final smsSent = ''.obs;
  // late UserRepository _userRepository;

  // AuthController() {
  //   _userRepository = UserRepository();
  // }

  void login() async {
    Get.focusScope!.unfocus();
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      loading.value = true;
      try {
        // await Get.find<FireBaseMessagingService>().setDeviceToken();
        // currentUser.value = await _userRepository.login(currentUser.value);
        // await _userRepository.signInWithEmailAndPassword(currentUser.value.email!, currentUser.value.apiToken!);
        // TechDash
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => TechDash()),
        // );
        loading.value = false;
        await Get.toNamed(Routes.TECHDASHBOARD,arguments: 0);
      } catch (e) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      } finally {
        loading.value = false;
      }
    }
  }

  void register() async {
    // Get.focusScope!.unfocus();
    // if (registerFormKey.currentState!.validate()) {
    //   registerFormKey.currentState!.save();
    //   loading.value = true;
    //   // try {
    //   //   if (Get.find<SettingsService>().setting.value.enableOtp!) {
    //   //     await _userRepository.sendCodeToPhone();
    //   //     loading.value = false;
    //   //     await Get.toNamed(Routes.PHONE_VERIFICATION);
    //   //   } else {
    //   //     await Get.find<FireBaseMessagingService>().setDeviceToken();
    //   //     currentUser.value = await _userRepository.register(currentUser.value);
    //   //     await _userRepository.signUpWithEmailAndPassword(currentUser.value.email!, currentUser.value.apiToken!);
    //   //     loading.value = false;
    //   //     await Get.offAllNamed(Routes.E_PROVIDERS);
    //   //   }
    //   // } catch (e) {
    //   //   Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    //   // } finally {
    //   //   loading.value = false;
    //   // }
    // }

    // Get.focusScope!.unfocus();
    // if (registerFormKey.currentState!.validate()) {
    //   registerFormKey.currentState!.save();
    //   loading.value = true;
    //   try {
    //     // await Get.find<FireBaseMessagingService>().setDeviceToken();
    //     // currentUser.value = await _userRepository.login(currentUser.value);
    //     // await _userRepository.signInWithEmailAndPassword(currentUser.value.email!, currentUser.value.apiToken!);
    //     // TechDash
    //     // Navigator.push(
    //     //   context,
    //     //   MaterialPageRoute(
    //     //       builder: (context) => TechDash()),
    //     // );
    //     loading.value = false;
    //     await Get.toNamed(Routes.TECHDASHBOARD,arguments: 0);
    //   } catch (e) {
    //     Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    //   } finally {
    //     loading.value = false;
    //   }
    // }

  }
  //
  // Future<void> verifyPhone() async {
  //   try {
  //     loading.value = true;
  //     await _userRepository.verifyPhone(smsSent.value);
  //     await Get.find<FireBaseMessagingService>().setDeviceToken();
  //     currentUser.value = await _userRepository.register(currentUser.value);
  //     await _userRepository.signUpWithEmailAndPassword(currentUser.value.email!, currentUser.value.apiToken!);
  //     loading.value = false;
  //     await Get.offAllNamed(Routes.E_PROVIDERS);
  //   } catch (e) {
  //     loading.value = false;
  //     Get.toNamed(Routes.REGISTER);
  //     Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
  //   } finally {
  //     loading.value = false;
  //   }
  // }
  //
  // Future<void> resendOTPCode() async {
  //   await _userRepository.sendCodeToPhone();
  // }
  //
  // void sendResetLink() async {
  //   Get.focusScope!.unfocus();
  //   if (forgotPasswordFormKey.currentState!.validate()) {
  //     forgotPasswordFormKey.currentState!.save();
  //     loading.value = true;
  //     try {
  //       await _userRepository.sendResetLinkEmail(currentUser.value);
  //       loading.value = false;
  //       Get.showSnackbar(Ui.SuccessSnackBar(message: "The Password reset link has been sent to your email: ".tr + currentUser.value.email!));
  //       Timer(Duration(seconds: 5), () {
  //         Get.offAndToNamed(Routes.LOGIN);
  //       });
  //     } catch (e) {
  //       Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
  //     } finally {
  //       loading.value = false;
  //     }
  //   }
  // }
}
