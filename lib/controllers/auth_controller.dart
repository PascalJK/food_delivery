import 'package:get/get.dart';

import '../data/repo/auth_repo.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});
}
