import 'package:get/get.dart';

mixin InputValidator {
  // Validators
  String? validateEmptyField(String value) {
    if (value.isEmpty) return "Field cannot be empty.";
    return null;
  }

  String? validateContactNumber(String value) {
    if (value.isEmpty) return "Type in contact number.";
    if (!GetUtils.isPhoneNumber(value)) return "Enter a valid phone number.";
    return null;
  }

  String? validatePrice(String value) {
    if (value.isEmpty) return "Type in price.";
    if (!GetUtils.isNum(value)) return "Enter a valid price.";
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) return 'Type in your email address';
    if (!GetUtils.isEmail(value.trim())) return "Enter a valid email address.";
    return null;
  }

  String? validatePassword(String password1) {
    if (password1.isEmpty) return "Type in your password.";
    if (password1.length < 6) return "Password can not be less than (6) characters";
    return null;
  }

  String? comparePassword(String password1, String password2) {
    // Compare Passwords
    if (password2 != password1) return "Passwords don't match";
    return null;
  }
}
