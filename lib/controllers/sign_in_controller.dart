import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/validators/input_validators.dart';
import 'package:get/get.dart';

import '../components/custom_snackbar.dart';

class SignInController extends GetxController with InputValidator {
  final email = TextEditingController();
  final password = TextEditingController();

  final authController = Get.find<AuthController>();

  Future<void> login() async {
    if (validateEmail(email.text) != null) {
      showCustomSnackBar(validateEmail(email.text)!, title: 'Email');
    } else if (validatePassword(password.text) != null) {
      showCustomSnackBar(validateEmptyField(password.text)!, title: 'Password');
    } else {
      await authController.login(email.text.trim(), password.text.trim()).then((status) {
        if (status.getSuccess) {
          Get.offAllNamed(RouteHelper.initial);
        } else {
          showCustomSnackBar(status.getMessage);
        }
      });
    }
  }
}
