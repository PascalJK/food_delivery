import 'package:flutter/material.dart';
import 'package:food_delivery/components/custom_snackbar.dart';
import 'package:food_delivery/utils/validators/input_validators.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with InputValidator {
  final email = TextEditingController();
  final name = TextEditingController();
  final contact = TextEditingController();
  final password = TextEditingController();

  void registration() {
    if (validateEmail(email.text) != null) {
      showCustomSnackBar(validateEmail(email.text)!, title: 'Email');
    } else if (validateEmptyField(name.text) != null) {
      showCustomSnackBar(validateEmptyField(name.text)!, title: 'Name');
    } else if (validateContactNumber(contact.text) != null) {
      showCustomSnackBar(validateContactNumber(name.text)!, title: 'Contact');
    } else if (validatePassword(password.text) != null) {
      showCustomSnackBar(validatePassword(name.text)!, title: 'Password');
    }
    else{
      showCustomSnackBar('All went well', title: 'Success');
    }
  }
}
