import 'package:flutter/material.dart';
import 'package:food_delivery/utils/validators/input_validators.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with InputValidator{
  final email = TextEditingController();
  final name = TextEditingController();
  final contact = TextEditingController();
  final password = TextEditingController();
}
