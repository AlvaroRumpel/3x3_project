import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void onInit() async {
    super.onInit();
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAndToNamed('/login');
  }
}
