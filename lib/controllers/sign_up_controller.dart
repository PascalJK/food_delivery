import 'package:flutter/material.dart';
import 'package:food_delivery/components/custom_snackbar.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/utils/validators/input_validators.dart';
import 'package:get/get.dart';

import '../models/account_model.dart';

class SignUpController extends GetxController with InputValidator {
  final email = TextEditingController();
  final name = TextEditingController();
  final contact = TextEditingController();
  final password = TextEditingController();

  final _authController = Get.find<AuthController>();

  Future<void> registration() async {
    if (validateEmail(email.text) != null) {
      showCustomSnackBar(validateEmail(email.text)!, title: 'Email');
    } else if (validateEmptyField(name.text) != null) {
      showCustomSnackBar(validateEmptyField(name.text)!, title: 'Name');
    } else if (validateContactNumber(contact.text) != null) {
      showCustomSnackBar(validateContactNumber(name.text)!, title: 'Contact');
    } else if (validatePassword(password.text) != null) {
      showCustomSnackBar(validatePassword(password.text)!, title: 'Password');
    } else {
      var acc = AccountModel(
        name: name.text,
        contact: contact.text,
        email: email.text,
        password: password.text,
      );
      _authController.registration(acc).then((status) {
        if (status.getSuccess) {
          print('passed test');
        } else {
          showCustomSnackBar(status.getMessage);
        }
      });
    }
  }
}
